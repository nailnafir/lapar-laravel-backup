<?php

namespace App\Http\Controllers\API;

use Exception;
use App\Models\User;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Actions\Fortify\PasswordValidationRules;
use Facade\FlareClient\Http\Response;

class UserController extends Controller
{
    use PasswordValidationRules;

    /**
     * @param Request $request
     * @return mixed
     */
    public function fetch(Request $request)
    {
        return ResponseFormatter::success($request->user(),'Data profile user berhasil diambil');
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Exception
     */
    public function login(Request $request)
    {
        try {
            $request->validate([
                'email' => 'email|required',
                'password' => 'required'
            ]);

            $credentials = request(['email', 'password']);
            if (!Auth::attempt($credentials)) {
                return Response()->json([
                    'message' => 'Wrong email or password',
                ], 422);
            }

            $user = User::where('email', $request->email)->first();
            if ( ! Hash::check($request->password, $user->password, [])) {
                throw new \Exception('Invalid Credentials');
            }

            $tokenResult = $user->createToken('authToken')->plainTextToken;
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'user' => $user
            ],'Authenticated');
        } catch (Exception $errors) {
            return Response()->json([
                'message' => 'The given data was invalid.',
                'errors' => $errors->validator->errors(),
            ], 422);
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Exception
     */
    public function register(Request $request)
    {
        try {
            $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|max:255|unique:users',
                'password' => $this->passwordRules(),
                'address' => 'required|string',
                'houseNumber' => 'required|string|max:255',
                'rtrw' => 'required|string|max:255',
                'subDistrict' => 'required|string|max:255',
                'district' => 'required|string|max:255',
                'city' => 'required|string|max:255',
                'phoneNumber' => 'required|string|max:255',
            ]);

            User::create([
                'name' => $request->name,
                'email' => $request->email,
                'gender' => $request->gender,
                'address' => $request->address,
                'houseNumber' => $request->houseNumber,
                'rtrw' => $request->rtrw,
                'subDistrict' => $request->subDistrict,
                'district' => $request->district,
                'city' => $request->city,
                'phoneNumber' => $request->phoneNumber,
                'password' => Hash::make($request->password),
            ]);

            $user = User::where('email', $request->email)->first();

            $tokenResult = $user->createToken('authToken')->plainTextToken; // biar sekalian login

            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'user' => $user,
            ], 'Pengguna Berhasil Terdaftar');

        } catch (Exception $errors) {
            return Response()->json([
                'message' => 'The given data was invalid.',
                'errors' => $errors->validator->errors(),
            ], 422);
        }
    }

    public function logout(Request $request) {
        $token = $request->user()->currentAccessToken()->delete();

        return ResponseFormatter::success($token, 'Token Revoked');
    }

    public function updateProfile(Request $request) {
        $data = $request->all();

        $user = Auth::user();
        $user->update($data);

        return ResponseFormatter::success($user, 'Profile Updated');
    }

    public function updatePhoto(Request $request) {
        $validator = Validator::make($request->all(), [
            'file' => 'required|image|max:2048'
        ]);

        if($validator->fails()) {
            return Response()->json([
                'errors' => $validator->errors(),
                'Update photo fails',
                401
            ]);
        }

        if($request->file('file')) {
            $file = $request->file->store('assets/user', 'public');

            // Simpan foto ke database (url saja)
            $user = Auth::user();
            $user->profile_photo_path = $file;
            $user->update();

            return ResponseFormatter::success([$file], 'File successfully uploaded');
        }
    }
}
