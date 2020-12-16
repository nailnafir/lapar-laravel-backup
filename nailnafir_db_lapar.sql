-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `ingredients` text COLLATE utf8mb4_unicode_ci,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `types` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picturePath` text COLLATE utf8mb4_unicode_ci,
  `location` text CHARACTER SET utf8mb4,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `food` (`id`, `name`, `description`, `ingredients`, `price`, `discount`, `rate`, `types`, `picturePath`, `location`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	'Sosis Bakar',	'Sosis bakar merupakan jajanan kekinian yang menjadi favorite bagi segala kalangan. Lebih enak jika ditambah dengan bumbu pedas manis.',	'Daging sapi, tepung terigu, telur, air, garam, kecap, dan cabai.',	10000,	10,	4.5,	'Terlaris',	'assets/food/vS08Q3OaBr4hrd8uMJsieO3hnYJvEBfrrptBGg6y.jpeg',	'Ciledug, Tangerang',	NULL,	'2020-11-25 04:34:14',	'2020-11-25 23:30:37'),
(4,	'Oseng Daging Mercon',	'Jogja bukan cuma terkenal dengan gudegnya yang manis. Ada juga oseng super pedas khas Jogja yang disebut oseng mercon. Sudah pernah mencobanya? Pasti Anda ketagihan. Nah, sekarang nggak perlu jauh-jauh lagi ke Joga. Buat Anda yang tinggal jauh dari Jogja atau yang penasaran dengan rasanya, yuk silakan diorder.',	'Daging sapi, air, minyak, cabai rawit, cabai merah, bawang merah, bawang putih, ketumbar, jinten',	40000,	5,	4.5,	'Terlaris',	'assets/food/UEOHrDLNzKvrmGCkPYnWRugVQc4qWoKbD3Wx1UNA.jpeg',	'Pinang, Tangerang',	NULL,	'2020-11-26 13:22:58',	'2020-11-26 13:22:58');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2014_10_12_200000_add_two_factor_columns_to_users_table',	1),
(4,	'2019_08_19_000000_create_failed_jobs_table',	1),
(5,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(6,	'2020_05_21_100000_create_teams_table',	1),
(7,	'2020_05_21_200000_create_team_user_table',	1),
(8,	'2020_11_15_083229_create_sessions_table',	1),
(9,	'2020_11_19_042440_create_food_table',	1),
(10,	'2020_11_19_044042_create_transactions_table',	1);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1,	'App\\Models\\User',	1,	'authToken',	'd8f4785be49b695bdb8cc4e910bfb1fce700ebbb07e2c583b88e8e32211b7c7c',	'[\"*\"]',	NULL,	'2020-12-01 08:24:31',	'2020-12-01 08:24:31'),
(2,	'App\\Models\\User',	6,	'authToken',	'6966af664c58852cc80bf7d5a280ac7e3b4a88b3e730de08e9ade08619ab2ca7',	'[\"*\"]',	NULL,	'2020-12-01 08:42:48',	'2020-12-01 08:42:48'),
(3,	'App\\Models\\User',	7,	'authToken',	'301ddf88e97f6875bdb9445a7628b480137e4d1b9529d6ef80fa9018ef7146b8',	'[\"*\"]',	NULL,	'2020-12-01 08:49:07',	'2020-12-01 08:49:07'),
(4,	'App\\Models\\User',	1,	'authToken',	'7b46e934d27446658c09ce00271b7b20405174009b9d7cec09e52d495ca7bfb1',	'[\"*\"]',	'2020-12-01 09:15:22',	'2020-12-01 09:06:39',	'2020-12-01 09:15:22'),
(5,	'App\\Models\\User',	8,	'authToken',	'8a71db021c865a05ce6de150f2aeec21e835d33888cb08195bf3044dc3b9e4bd',	'[\"*\"]',	NULL,	'2020-12-04 16:30:47',	'2020-12-04 16:30:47'),
(6,	'App\\Models\\User',	9,	'authToken',	'ece22e9720b407ad66593cb1b97afa09e5e29ce0fdd160a4a61310664ec345c5',	'[\"*\"]',	NULL,	'2020-12-04 23:25:48',	'2020-12-04 23:25:48'),
(7,	'App\\Models\\User',	9,	'authToken',	'f596a45da8ff2d4aa10f356d7fa9dcdfa438752bcea34dd5d55221a26e3d3031',	'[\"*\"]',	NULL,	'2020-12-04 23:28:01',	'2020-12-04 23:28:01'),
(8,	'App\\Models\\User',	10,	'authToken',	'4bf76f6c78b3a36c7ba644bddefd30d3963b75320839b8b69b135c648ce85bc9',	'[\"*\"]',	'2020-12-04 23:30:08',	'2020-12-04 23:30:05',	'2020-12-04 23:30:08'),
(9,	'App\\Models\\User',	11,	'authToken',	'76a82c23cf4c6ccf74d6743b498534a096c9635e51fe3fdeffa9cc341969a39d',	'[\"*\"]',	'2020-12-04 23:45:11',	'2020-12-04 23:45:07',	'2020-12-04 23:45:11'),
(10,	'App\\Models\\User',	12,	'authToken',	'8aec99cc8f58b334d413feebddcf232f7d9fe6e5c9eed81ca3f71c662f4a3ebc',	'[\"*\"]',	'2020-12-05 01:37:17',	'2020-12-05 01:37:11',	'2020-12-05 01:37:17'),
(11,	'App\\Models\\User',	13,	'authToken',	'818f21a9a41478734805a7a50b55222593ef2e9b5a9b5f395c4dec5ceb4d601a',	'[\"*\"]',	'2020-12-05 01:47:08',	'2020-12-05 01:47:03',	'2020-12-05 01:47:08'),
(12,	'App\\Models\\User',	14,	'authToken',	'19a69547e3c43757bd1b69c37bf267a3e2a422f36f01cf759daa7595992f328c',	'[\"*\"]',	'2020-12-05 01:56:06',	'2020-12-05 01:56:04',	'2020-12-05 01:56:06'),
(13,	'App\\Models\\User',	15,	'authToken',	'd60f945e9085dc84e911651f04a35dd14ec546aae5ff4eb0c49c2b59818e4335',	'[\"*\"]',	'2020-12-07 10:53:28',	'2020-12-07 10:53:24',	'2020-12-07 10:53:28'),
(14,	'App\\Models\\User',	16,	'authToken',	'51e9d72eab7cceb447d08b38f794c50923c9520e8d6f19177ae819f7f4541c01',	'[\"*\"]',	'2020-12-07 11:02:25',	'2020-12-07 11:02:21',	'2020-12-07 11:02:25'),
(15,	'App\\Models\\User',	15,	'authToken',	'a14228fa53a5a0ef682a027f52541342dce4ec8170844987b8cf88aa296f84bb',	'[\"*\"]',	NULL,	'2020-12-07 11:12:46',	'2020-12-07 11:12:46'),
(16,	'App\\Models\\User',	15,	'authToken',	'1d15a64b2b241047ee8beaef74f384d89c0afee220c59714b3ac9299fd3fc694',	'[\"*\"]',	NULL,	'2020-12-07 11:21:40',	'2020-12-07 11:21:40'),
(17,	'App\\Models\\User',	15,	'authToken',	'2693029f4afd1a26188b1f96042bde15a2c1acd0884629b65237360c14fd21dd',	'[\"*\"]',	NULL,	'2020-12-07 11:23:58',	'2020-12-07 11:23:58'),
(18,	'App\\Models\\User',	17,	'authToken',	'e9e7a5a9ce235ebc5bd6a0e070bab066723774e663b4fb34e75f7fe997c371bb',	'[\"*\"]',	'2020-12-07 11:46:28',	'2020-12-07 11:46:24',	'2020-12-07 11:46:28');

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('kmX3iqf1ijdZF2EG6eTTJlV4g3peeHG4oxG4hHY1',	1,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36',	'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiaVJaVmZpVW9FUFFCS050MVdxZDBBR2NWakNvYXB0TzlaUEFJMnJqVyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHZqSjRhWk8zc0ZZMlQ3dmVzeDZZdC5paFZ1TTl4OUFsWjExWXpodThpSEhkaDFXZXYvQXpTIjtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MDoiaHR0cDovL2xhcGFyLWxhcmF2ZWwudGVzdC9kYXNoYm9hcmQvZm9vZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJHZqSjRhWk8zc0ZZMlQ3dmVzeDZZdC5paFZ1TTl4OUFsWjExWXpodThpSEhkaDFXZXYvQXpTIjt9',	1607404578);

DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1,	1,	'Nailul\'s Team',	1,	'2020-11-24 21:06:07',	'2020-11-24 21:06:07'),
(2,	3,	'Nailul\'s Team',	1,	'2020-11-25 02:46:42',	'2020-11-25 02:46:42'),
(3,	5,	'Berliana\'s Team',	1,	'2020-11-25 23:55:46',	'2020-11-25 23:55:46');

DROP TABLE IF EXISTS `team_user`;
CREATE TABLE `team_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `transactions` (`id`, `user_id`, `food_id`, `quantity`, `total`, `status`, `payment_url`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	2,	30000,	'Terkirim',	'https://app.sandbox.midtrans.com/snap/v2/vtweb/334edb89-625a-4706-8eb9-4b0c157c6b0f',	NULL,	'2020-11-26 03:39:31',	'2020-11-26 11:38:11');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `houseNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rtrw` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subDistrict` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `gender`, `address`, `houseNumber`, `rtrw`, `subDistrict`, `district`, `city`, `phoneNumber`, `roles`, `created_at`, `updated_at`) VALUES
(1,	'NAILUL FIRDAUS',	'nail.nafir@gmail.com',	NULL,	'$2y$10$vjJ4aZO3sFY2T7vesx6Yt.ihVuM9x9AlZ11Yzhu8iHHdh1Wev/AzS',	NULL,	NULL,	'gxxTVrIZIKCO4OST4DROAf148EzdWv9RRZLfCUkmz6gZK0MbQLGcTvGfHWMy',	1,	NULL,	'LAKI-LAKI',	'JALAN SEKTOR XIII',	'47',	'01 / 10',	'SUDIMARA JAYA',	'CILEDUG',	'KOTA TANGERANG',	'081288070110',	'ADMIN',	'2020-11-25 02:46:42',	'2020-11-25 23:54:48'),
(5,	'BERLIANA RIZKA',	'berlianarizkaap@gmail.com',	NULL,	'$2y$10$R6ZlaF.zS31z8odyKtXo8OS3gUycKk8j4N6lJG79rObH8OiXDZ89e',	NULL,	NULL,	'jaLyLI66fYXLXV8fewLFxk1IvwMjlrC15nnr2n19cdrG60Rc0lTTapVCxczQ',	3,	NULL,	'PEREMPUAN',	'JALAN SEKTOR XIII',	'47',	'01 / 10',	'SUDIMARA JAYA',	'CILEDUG',	'KOTA TANGERANG',	'081211293272',	'ADMIN',	'2020-11-25 23:55:46',	'2020-11-25 23:57:43');

-- 2020-12-08 06:29:58
