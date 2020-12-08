<?php

namespace App\Http\Requests;

use App\Actions\Fortify\PasswordValidationRules;
use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    use PasswordValidationRules;
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => $this->passwordRules(),
            'gender' => ['required', 'string', 'max:255', 'in:Laki-laki,Perempuan'],
            'roles' => ['required', 'string', 'max:255', 'in:USER,ADMIN'],
            'address' => ['required', 'string'],
            'houseNumber' => ['required', 'string', 'max:255'],
            'rtrw' => ['required', 'string', 'max:255'],
            'subDistrict' => ['required', 'string', 'max:255'],
            'district' => ['required', 'string', 'max:255'],
            'city' => ['required', 'string', 'max:255'],
            'phoneNumber' => ['required', 'string', 'max:255']
        ];
    }
}
