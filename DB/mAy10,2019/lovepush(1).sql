-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 10, 2019 at 06:54 PM
-- Server version: 5.7.22-0ubuntu0.16.04.1
-- PHP Version: 7.1.20-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lovepush`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capture_distance` int(11) NOT NULL DEFAULT '0' COMMENT 'NotUsed (in meters) distance range for other members profiles capture not used',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'used for forgot password',
  `verify_code_created_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `image`, `password`, `capture_distance`, `remember_token`, `verify_code`, `verify_code_created_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@love-push.com', '8899776612', '1555395687.jpeg', '$2y$10$oALoe/ZsdJCnM91RPUYkFOS.2tP2X/vTdmuJ5xqusIras5gP3hcj.', 100, '03foR9nyQhjj5iAeMbueTUOoaP0WHx51lTJW6A7lU3uKK5kx4OIi6czCUoNx', '774846', '2018-10-04 19:04:55', '2018-06-27 05:06:26', '2019-04-16 00:52:24');

-- --------------------------------------------------------

--
-- Table structure for table `feeds`
--

CREATE TABLE `feeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feeds`
--

INSERT INTO `feeds` (`id`, `user_id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 3, 'First Feed', 'FF', '1548326142.png', '2019-01-24 05:05:42', '2019-01-24 05:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=activee, 0=inactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 1, '2019-04-10 12:07:00', '2019-04-10 12:09:08'),
(2, 'de', 'German', 1, '2019-04-10 12:07:00', '2019-04-10 12:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(26, '2014_10_12_000000_create_users_table', 1),
(27, '2014_10_12_100000_create_password_resets_table', 1),
(28, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(29, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(30, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(31, '2016_06_01_000004_create_oauth_clients_table', 1),
(32, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(33, '2019_01_15_133005_create_post_ads_table', 1),
(34, '2019_01_16_074723_add_image_to_users_table', 1),
(35, '2019_01_16_075955_create_user_profile_images_table', 1),
(36, '2019_01_16_125501_add_role_to_users_table', 1),
(37, '2019_01_17_070145_add_city_country_to_users_table', 1),
(38, '2019_01_18_102128_create_user_requests_table', 1),
(39, '2019_01_18_103857_create_notifications_table', 1),
(40, '2019_01_21_072426_create_personality_questions_table', 2),
(41, '2019_01_21_072803_create_personality_questions_options_table', 2),
(42, '2019_01_21_095504_create_personality_tests_table', 2),
(43, '2019_01_22_042411_change_radius_to_post_ads_table', 3),
(44, '2019_01_23_093446_add_otp_to_users_table', 4),
(45, '2019_01_24_101128_create_feeds_table', 5),
(46, '2019_01_25_091432_add_seetingsparam_to_users_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `message`, `created_at`, `updated_at`) VALUES
(1, 6, 'Like', 'test has sent you a request.', '2019-01-24 04:16:15', '2019-01-24 04:16:15'),
(2, 6, 'Like', 'test has sent you a request.', '2019-01-24 04:24:56', '2019-01-24 04:24:56'),
(3, 4, 'Like', 'test has sent you a request.', '2019-01-24 04:25:02', '2019-01-24 04:25:02'),
(4, 5, 'Like', 'test has sent you a request.', '2019-01-24 04:31:21', '2019-01-24 04:31:21'),
(5, 4, 'Like', 'test has sent you a request.', '2019-01-24 04:31:22', '2019-01-24 04:31:22'),
(6, 5, 'Like', 'vivek kumar has sent you a request.', '2019-01-25 06:34:39', '2019-01-25 06:34:39'),
(7, 5, 'Like', 'vivek kumar has sent you a request.', '2019-01-25 06:46:38', '2019-01-25 06:46:38'),
(8, 5, 'Like', 'vivek kumar has sent you a request.', '2019-01-25 07:18:21', '2019-01-25 07:18:21'),
(9, 13, 'Like', 'ER has sent you a request.', '2019-01-28 00:28:20', '2019-01-28 00:28:20'),
(10, 13, 'Like', 'ER has sent you a request.', '2019-01-28 01:15:05', '2019-01-28 01:15:05'),
(11, 13, 'Like', 'ER has sent you a request.', '2019-01-28 01:15:27', '2019-01-28 01:15:27'),
(12, 13, 'Like', 'ER has sent you a request.', '2019-01-28 01:15:54', '2019-01-28 01:15:54'),
(13, 13, 'Like', 'ER has sent you a request.', '2019-01-28 01:20:18', '2019-01-28 01:20:18'),
(14, 13, 'Like', 'ER has sent you a request.', '2019-01-28 01:20:40', '2019-01-28 01:20:40'),
(15, 13, 'Like', 'ER has sent you a request.', '2019-01-28 01:24:03', '2019-01-28 01:24:03'),
(16, 13, 'Like', 'ER has sent you a request.', '2019-01-28 01:25:43', '2019-01-28 01:25:43'),
(17, 13, 'Like', 'ER has sent you a request.', '2019-01-28 01:25:54', '2019-01-28 01:25:54'),
(18, 13, 'Like', 'ER has sent you a request.', '2019-01-28 01:25:59', '2019-01-28 01:25:59'),
(19, 13, 'Like', 'ER has sent you a request.', '2019-01-28 01:28:13', '2019-01-28 01:28:13'),
(20, 13, 'Like', 'ER has sent you a request.', '2019-01-28 01:28:15', '2019-01-28 01:28:15'),
(21, 13, 'Like', 'ER has sent you a request.', '2019-01-29 01:19:06', '2019-01-29 01:19:06'),
(22, 8, 'Like', 'ER has sent you a request.', '2019-01-29 01:19:08', '2019-01-29 01:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0238175f8476ead65cc0d90ce276f5af6755d1e63684a149c6aeccfffcfd692de71957d342db2306', 3, 2, 'user', '[]', 0, '2019-04-10 02:06:47', '2019-04-10 02:06:47', '2020-04-10 07:36:47'),
('02f046caf84caeeaf0eb6a27ce771275a2f348b8e65c195c3219bb00a3cf99d7bd365c27e7cbfa25', 3, 2, 'user', '[]', 0, '2019-04-22 04:14:55', '2019-04-22 04:14:55', '2020-04-22 09:44:55'),
('09240a6e1082016f8a13e4d39c34781c5063b929d7748eccaa728c6e8a1cc9e9642c7e6d827813fb', 3, 2, 'user', '[]', 0, '2019-04-10 03:39:36', '2019-04-10 03:39:36', '2020-04-10 09:09:36'),
('1fcb42739bc72f4f77eddc7b1eb7d8b728b70f41e63216159298300cde47a21ff995c276e309c852', 3, 2, 'user', '[]', 1, '2019-04-18 01:19:55', '2019-04-18 01:19:55', '2020-04-18 06:49:55'),
('2620df0383c5592334e5a19780faf330ae48978214c7bf8aeae0080f83ba2c14c6cb0c9c4d813950', 3, 2, 'user', '[]', 0, '2019-04-10 02:03:41', '2019-04-10 02:03:41', '2020-04-10 07:33:41'),
('29c8a4fc77c155b43f1c9a380202f015f65d91f4c900ad2e018357764cbbaab111cd7abda3f562d3', 3, 2, 'user', '[]', 1, '2019-04-18 01:21:36', '2019-04-18 01:21:36', '2020-04-18 06:51:36'),
('2bb7f053676ce6bcc67ed7d847167263c10f244bba156aa6fe75e06c7f3f23cfcd70bbbab13ab6d9', 3, 2, 'user', '[]', 0, '2019-04-18 00:24:44', '2019-04-18 00:24:44', '2020-04-18 05:54:44'),
('432ec579b8f2e4d0b820e292b12f2654844973fcd122fba9788f11e4a9918d3c9994254142b13c2c', 3, 2, 'user', '[]', 0, '2019-04-10 03:46:23', '2019-04-10 03:46:23', '2020-04-10 09:16:23'),
('44a8d8fa273940d23b5cd826063f7a087e003771717878d6494aa6cb946ab76c8a5931fb7b1b6439', 3, 2, 'user', '[]', 0, '2019-04-18 02:05:45', '2019-04-18 02:05:45', '2020-04-18 07:35:45'),
('48dd3b068f222d41adeb889967c28645ee9855fe7312ecc1b5b5985d7556f6b1007ad396bd6190bc', 3, 2, 'user', '[]', 0, '2019-04-17 01:06:47', '2019-04-17 01:06:47', '2020-04-17 06:36:47'),
('4ef051d022b8c96ddc3656e44ab7a3503e54d53980692e7e35cf6285ce73589dd443cb55b8c462e4', 27, 2, 'user', '[]', 0, '2019-04-22 01:16:45', '2019-04-22 01:16:45', '2020-04-22 06:46:45'),
('5632cdbd5a204f51bea784eb374e4c4b3bc62ed576ace16d898d44298653d1ef0d0f12af0690482f', 3, 2, 'user', '[]', 1, '2019-04-18 02:06:44', '2019-04-18 02:06:44', '2020-04-18 07:36:44'),
('6673a390e67edb0841a9821fc511efb5f45a3d77b02d012ac6fdc66c56fddd90351b01456e008982', 3, 2, 'user', '[]', 0, '2019-04-18 02:05:30', '2019-04-18 02:05:30', '2020-04-18 07:35:30'),
('6f6ff8f872d5393b1588140c9a42ab2566578bc8a7251d872827deb109431b3b1ba9e29f664989b7', 3, 2, 'user', '[]', 0, '2019-04-18 01:55:14', '2019-04-18 01:55:14', '2020-04-18 07:25:14'),
('701c71e17b6a85a6c956da1b687d6dae96f1ad212d018f91cd9a9ed53f0407fd0931d1cb0e3fb63d', 3, 2, 'user', '[]', 0, '2019-04-18 00:41:12', '2019-04-18 00:41:12', '2020-04-18 06:11:12'),
('71665dc2853c9374837520a2bcd2e29d0f88eb6e4febe6fa4b727a03a1f543f5d78e3d27fd09e8e3', 3, 2, 'user', '[]', 0, '2019-04-22 00:06:20', '2019-04-22 00:06:20', '2020-04-22 05:36:20'),
('85d6fbd4f8700b94ddf942d73283ce7392294caece5a43276a5509f6997140559d96bfb35dd94f0f', 3, 2, 'user', '[]', 0, '2019-04-18 02:06:08', '2019-04-18 02:06:08', '2020-04-18 07:36:08'),
('9dfd324c35e6607e622b53978047fa997f1994c2a204e6f9ca430afe9b28f6df2890e26c055a830e', 3, 2, 'user', '[]', 0, '2019-04-10 02:19:05', '2019-04-10 02:19:05', '2020-04-10 07:49:05'),
('a4974b3226ad7d3d542a03282522bd0bcad2a4007cb78ffdc55274438495bb2348ddd5d66f8778a4', 3, 2, 'user', '[]', 0, '2019-04-18 00:41:22', '2019-04-18 00:41:22', '2020-04-18 06:11:22'),
('b9d6af2ebe607e8eb392e70a82bfa6fcdd63ae1a1c69fcf84b52cfabaccb088e5a868cff7c1b92cd', 3, 2, 'user', '[]', 0, '2019-04-18 00:23:46', '2019-04-18 00:23:46', '2020-04-18 05:53:46'),
('c143449aad6ee775f0969bd7492b58930271e9d2b021963aec72e2d30acd9a04dd2eed3a1e09f2a3', 3, 2, 'user', '[]', 0, '2019-04-17 02:24:19', '2019-04-17 02:24:19', '2020-04-17 07:54:19'),
('ca2d4734aad40023b2d5fe18e9875db7905cfc46fb55a92303cb6b20329745a86393f88be42b8967', 3, 2, 'user', '[]', 0, '2019-04-18 01:55:33', '2019-04-18 01:55:33', '2020-04-18 07:25:33'),
('d5e60fa6cfb86974a69fd4429264232ac1908755c593f6c8a22c9ab1385d0ea641204a1b0ba6bd9b', 3, 2, 'user', '[]', 0, '2019-04-19 05:02:23', '2019-04-19 05:02:23', '2020-04-19 10:32:23'),
('ee581de5593e353893e54ad930f88389a96ea9a80b5d9f30834b5cd74a4d2aa972a1c00422881953', 3, 2, 'user', '[]', 0, '2019-04-10 02:04:43', '2019-04-10 02:04:43', '2020-04-10 07:34:43'),
('f3cdeebccbde6d711f97dccb07371dc03ffd1828e692792f9e443d566fd53b0127e5b0c2ee0a3aa7', 3, 2, 'user', '[]', 0, '2019-04-10 01:59:05', '2019-04-10 01:59:05', '2020-04-10 07:29:05'),
('f6494fc9c25d284d373eaffdacb0aaf79e63eaad4e35516760b3b02ef153a5d8dd1ca293f8f7f6f9', 27, 2, 'user', '[]', 0, '2019-04-22 01:16:02', '2019-04-22 01:16:02', '2020-04-22 06:46:02'),
('ff5cc9e4265dbac8803f691cad47bb069b6de6570734787f3959fbdbb40e686185f752dc4ebdfa07', 3, 2, 'user', '[]', 0, '2019-04-18 00:23:06', '2019-04-18 00:23:06', '2020-04-18 05:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Love Push Personal Access Client', 'Abxmt0kiTkWqZT8Bg9s3BdqoGBlkq2T2nRS3tTrm', 'http://localhost', 1, 0, 0, '2019-01-21 04:55:50', '2019-01-21 04:55:50'),
(2, NULL, 'Love Push Personal Access Client', 'qHYTNG5l2T5kCL83shS6K7mPugStvfyXy4nk2WVp', 'http://localhost', 1, 0, 0, '2019-04-10 01:40:52', '2019-04-10 01:40:52'),
(3, NULL, 'Love Push Password Grant Client', 'ZVSpB7pymCbIYoKNnHCv7M1qLXb3WTlvSEjVf6lj', 'http://localhost', 0, 1, 0, '2019-04-10 01:40:53', '2019-04-10 01:40:53');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-01-21 04:55:50', '2019-01-21 04:55:50'),
(2, 2, '2019-04-10 01:40:53', '2019-04-10 01:40:53');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personality_questions@NotUsed`
--

CREATE TABLE `personality_questions@NotUsed` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=> inactive, 1=>active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personality_questions@NotUsed`
--

INSERT INTO `personality_questions@NotUsed` (`id`, `question`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'What  is your favourite fruit?', 1, '2019-01-21 05:00:40', '2019-04-01 02:25:58'),
(2, 'What  is your favourite color ?', 1, '2019-01-22 04:48:09', '2019-04-01 02:25:44'),
(3, 'Test', 1, '2019-04-04 02:42:59', '2019-04-04 02:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `personality_questions_options@NotUsed`
--

CREATE TABLE `personality_questions_options@NotUsed` (
  `id` int(10) UNSIGNED NOT NULL,
  `personality_question_id` int(10) UNSIGNED NOT NULL,
  `option` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personality_questions_options@NotUsed`
--

INSERT INTO `personality_questions_options@NotUsed` (`id`, `personality_question_id`, `option`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mango', '2019-01-21 05:00:40', '2019-01-21 05:00:40'),
(2, 1, 'Orange', '2019-01-21 05:00:41', '2019-01-21 05:00:41'),
(3, 1, 'Banana', '2019-01-21 05:00:41', '2019-01-21 05:00:41'),
(4, 1, 'Apple', '2019-01-21 05:00:41', '2019-01-21 05:00:41'),
(9, 2, 'Red', '2019-01-28 06:41:55', '2019-01-28 06:41:55'),
(10, 2, 'Orange', '2019-01-28 06:41:55', '2019-01-28 06:41:55'),
(11, 2, 'Pink', '2019-01-28 06:41:55', '2019-01-28 06:41:55'),
(12, 2, 'Yellow', '2019-01-28 06:41:55', '2019-01-28 06:41:55'),
(13, 3, 'test1', '2019-04-04 02:43:00', '2019-04-04 02:43:00'),
(14, 3, 'test2', '2019-04-04 02:43:00', '2019-04-04 02:43:00'),
(15, 3, 'test3', '2019-04-04 02:43:00', '2019-04-04 02:43:00'),
(16, 3, 'test4', '2019-04-04 02:43:00', '2019-04-04 02:43:00');

-- --------------------------------------------------------

--
-- Table structure for table `personality_tests@NotUsed`
--

CREATE TABLE `personality_tests@NotUsed` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `option_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personality_tests@NotUsed`
--

INSERT INTO `personality_tests@NotUsed` (`id`, `user_id`, `option_id`, `created_at`, `updated_at`) VALUES
(12, 3, 4, '2019-01-23 06:47:27', '2019-01-23 06:47:27'),
(17, 5, 1, '2019-01-23 06:54:03', '2019-01-23 06:54:03'),
(19, 5, 1, '2019-01-23 06:57:28', '2019-01-23 06:57:28'),
(21, 5, 1, '2019-01-23 06:57:30', '2019-01-23 06:57:30'),
(23, 5, 2, '2019-01-23 06:58:31', '2019-01-23 06:58:31'),
(25, 5, 2, '2019-01-23 06:58:35', '2019-01-23 06:58:35'),
(27, 5, 3, '2019-01-24 23:33:04', '2019-01-24 23:33:04'),
(29, 13, 2, '2019-01-25 06:01:38', '2019-01-25 06:01:38'),
(31, 13, 4, '2019-01-25 07:18:14', '2019-01-25 07:18:14');

-- --------------------------------------------------------

--
-- Table structure for table `post_ads`
--

CREATE TABLE `post_ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> love ad, 2=> connect ad',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_post_anonymously` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> show, 0=> profile hidden',
  `radius` decimal(8,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> active, 0=> not active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_ads`
--

INSERT INTO `post_ads` (`id`, `user_id`, `title`, `description`, `post_type`, `image`, `location`, `latitude`, `longitude`, `is_post_anonymously`, `radius`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'titl', 'Js fjd dd djd dj sjd djs sjs sjf djd sjd djd jd ddj dd', 2, '1548244910.png', 'Tower C, Third Floor DLF Building, IT Park 160101, Phase - I, Manimajra, Chandigarh, Haryana 134114, India', '30.72808590000001', '76.84575629999999', 0, '15.00', 1, '2019-01-23 06:31:50', '2019-01-23 06:31:50'),
(2, 6, 'title', 'Des djd djs sjs sjs sjs sjs shs hs jsjs', 2, '1548400345.png', 'Tower C, Third Floor DLF Building, IT Park 160101, Phase - I, Manimajra, Chandigarh, Haryana 134114, India', '30.72808590000001', '76.84575629999999', 1, '38.25', 1, '2019-01-25 01:42:25', '2019-01-25 01:42:25'),
(3, 6, 'hddj', 'Shsh', 2, '1548400421.png', 'Tower C, Third Floor DLF Building, IT Park 160101, Phase - I, Manimajra, Chandigarh, Haryana 134114, India', '30.72808590000001', '76.84575629999999', 1, '45.83', 1, '2019-01-25 01:43:41', '2019-01-25 01:43:41'),
(4, 13, 'nxdbjdhshs', 'jddjdj djejds djsb', 1, '1548414974.png', 'Unnamed Road, Phase - I, Manimajra, Chandigarh, Haryana 160101, India', '30.727847500000003', '76.84621484375', 0, '65.00', 1, '2019-01-25 05:46:14', '2019-01-25 05:46:14');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active,0=inactive',
  `max_scores` int(11) DEFAULT NULL,
  `max_answers` int(11) DEFAULT NULL,
  `score_multiple` float NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `status`, `max_scores`, `max_answers`, `score_multiple`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 1, '2019-04-30 15:31:17', '2019-05-08 17:09:48'),
(2, 1, NULL, 1, 1, '2019-04-30 15:31:17', '2019-05-08 17:09:50'),
(3, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:17:13'),
(4, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:17:43'),
(5, 1, 80, 2, 2, '2019-04-30 15:31:17', '2019-04-30 16:19:26'),
(6, 1, 40, 2, 1, '2019-04-30 15:31:17', '2019-04-30 16:19:43'),
(7, 1, 40, 3, 1, '2019-04-30 15:31:17', '2019-04-30 16:19:59'),
(8, 1, 30, 2, 1, '2019-04-30 15:31:17', '2019-04-30 16:20:10'),
(9, 1, 20, 1, 0.15, '2019-04-30 15:31:17', '2019-05-08 15:31:58'),
(10, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:22:29'),
(11, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:22:42'),
(12, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:23:23'),
(13, 1, 60, 3, 1, '2019-04-30 15:31:17', '2019-04-30 16:23:38'),
(14, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:24:52'),
(15, 1, 60, 3, 1, '2019-04-30 15:31:17', '2019-04-30 16:25:36'),
(16, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:25:46'),
(17, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:25:54'),
(18, 1, 20, 1, 1, '2019-04-30 15:31:17', '2019-04-30 16:26:13'),
(19, 0, NULL, NULL, 1, '2019-04-30 15:31:17', '2019-04-30 15:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `question_descs`
--

CREATE TABLE `question_descs` (
  `question_id` int(11) NOT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=English,2=German',
  `question` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active,0=inactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_descs`
--

INSERT INTO `question_descs` (`question_id`, `language_id`, `question`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Who are you searching for on Love push?', 1, '2019-04-30 15:30:10', '2019-04-30 15:30:17'),
(1, 2, 'Wen suchen Sie bei Love Push?', 1, '2019-04-30 15:30:10', '2019-04-30 15:30:19'),
(2, 1, 'What are you searching for?', 1, '2019-04-30 15:33:28', '2019-04-30 15:33:53'),
(2, 2, 'Was suchst du?', 1, '2019-04-30 15:33:28', '2019-04-30 15:34:04'),
(3, 1, 'Where is your favourite place to stay ?', 1, '2019-04-30 15:33:28', '2019-04-30 15:34:54'),
(3, 2, 'Wo ist dein Lieblingsplatz?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:01'),
(4, 1, 'Your fashion style?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:36'),
(4, 2, 'Dein Modestil?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(5, 1, 'Why do you want to meet new people?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:36'),
(5, 2, 'Warum möchtest du neue Leute kennenlernen?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(6, 1, 'how would you describe yourself?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:36'),
(6, 2, 'Wie würdest du dich selbst beschreiben?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(7, 1, 'How do you spend your weekends?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:36'),
(7, 2, 'Wie verbringst du deine Wochenenden?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(8, 1, 'cook,order or go out to eat?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:36'),
(8, 2, 'kochen, bestellen oder essen gehen?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(9, 1, 'Wich meals do you prefer?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:36'),
(9, 2, 'Welche Mahlzeiten bevorzugen Sie?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(10, 1, 'If you can sleep threw, when are you getting up?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:36'),
(10, 2, 'Wenn du schlafen kannst, wann stehst du auf?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(11, 1, 'Which animal do you prefer?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:36'),
(11, 2, 'Welches Tier bevorzugst du?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(12, 1, 'level of education', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:36'),
(12, 2, 'Bildungsgrad', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(13, 1, 'What do you do with your free time?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:36'),
(13, 2, 'Was machst du mit deiner Freizeit?', 1, '2019-04-30 15:33:28', '2019-04-30 15:35:45'),
(14, 1, 'If you would win a vacation from love push, where would you go to?', 1, '2019-04-30 15:33:28', '2019-04-30 15:56:27'),
(14, 2, 'Wenn Sie einen Urlaub von Love Push gewinnen würden, wohin würden Sie gehen?', 1, '2019-04-30 15:33:28', '2019-04-30 15:56:29'),
(15, 1, 'What is most important refering to your dream partner?', 1, '2019-04-30 15:33:28', '2019-04-30 15:55:52'),
(15, 2, 'Was ist am wichtigsten für Ihren Traumpartner?', 1, '2019-04-30 15:33:28', '2019-04-30 15:56:15'),
(16, 1, 'How important is sex for you in a relationship?', 1, '2019-04-30 15:33:28', '2019-04-30 15:55:39'),
(16, 2, 'Wie wichtig ist Sex in einer Beziehung für dich?', 1, '2019-04-30 15:33:28', '2019-04-30 15:55:37'),
(17, 1, 'Do you want to have kids with your future partner?', 1, '2019-04-30 15:33:28', '2019-04-30 15:55:39'),
(17, 2, 'Möchten Sie Kinder mit Ihrem zukünftigen Partner haben?', 1, '2019-04-30 15:33:28', '2019-04-30 15:55:37'),
(18, 1, 'Do you want to merry later on?', 1, '2019-04-30 15:33:28', '2019-04-30 15:55:39'),
(18, 2, 'Möchten Sie später fröhlich sein?', 1, '2019-04-30 15:33:28', '2019-04-30 15:55:37');

-- --------------------------------------------------------

--
-- Table structure for table `ques_options`
--

CREATE TABLE `ques_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active,0=inactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ques_options`
--

INSERT INTO `ques_options` (`id`, `question_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-04-30 17:02:46', '2019-04-30 17:02:46'),
(2, 1, 1, '2019-04-30 17:02:46', '2019-04-30 17:04:16'),
(3, 1, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:18'),
(4, 2, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(5, 2, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(6, 2, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(7, 2, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(8, 2, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(9, 3, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(10, 3, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(11, 3, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(12, 3, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(13, 4, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(14, 4, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(15, 4, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(16, 4, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(17, 5, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(18, 5, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(19, 5, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(20, 5, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(21, 5, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(22, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(23, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(24, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(25, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(26, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(27, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(28, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(29, 6, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(30, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(31, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(32, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(33, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(34, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(35, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(36, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(37, 7, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(38, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(39, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(40, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(41, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(42, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(43, 8, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(44, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(45, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(46, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(47, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(48, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(49, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(50, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(51, 9, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(52, 10, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(53, 10, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(54, 10, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(55, 11, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(56, 11, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(57, 11, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(58, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(59, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(60, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(61, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(62, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(63, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(64, 12, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(65, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(66, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(67, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(68, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(69, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(70, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(71, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(72, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(73, 13, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(74, 14, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(75, 14, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(76, 14, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(77, 14, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(78, 14, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(79, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(80, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(81, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(82, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(83, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(84, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(85, 15, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(86, 16, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(87, 16, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(88, 16, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(89, 16, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(90, 17, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(91, 17, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(92, 17, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(93, 18, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(94, 18, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51'),
(95, 18, 1, '2019-04-30 17:02:51', '2019-04-30 17:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `ques_option_descs`
--

CREATE TABLE `ques_option_descs` (
  `ques_option_id` int(11) NOT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=English, 2=German',
  `option` text CHARACTER SET utf8,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active,0=inactive',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ques_option_descs`
--

INSERT INTO `ques_option_descs` (`ques_option_id`, `language_id`, `option`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Man', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(1, 2, 'Mann', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(2, 1, 'Women', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(2, 2, 'Frau', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(3, 1, 'Transgender', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(3, 2, 'Transgender', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(4, 1, 'The great love', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(4, 2, 'Die große Liebe', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(5, 1, 'Nice acquaintances', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(5, 2, 'Nette Bekannte', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(6, 1, 'Friendships', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(6, 2, 'Freundschaften', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(7, 1, 'Travel buddy', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(7, 2, 'Reise-Kumpel', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(8, 1, 'Open for everything', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(8, 2, 'Offen für alles', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(9, 1, 'Outside, I love to move my self and be in nature', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(9, 2, 'Draußen bewege ich mich gerne und bin in der Natur', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(10, 1, 'My home is my temple', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(10, 2, 'Mein Zuhause ist mein Tempel', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(11, 1, 'places where i get to meet new interesting people', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(11, 2, 'Orte, an denen ich neue interessante Leute kennenlernen kann', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(12, 1, 'A place where I can think and find new ideas', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(12, 2, 'Ein Ort, an dem ich nachdenken und neue Ideen finden kann', 1, '0000-00-00 00:00:00', '2019-04-30 17:07:47'),
(13, 1, 'jeans and sneaker , i wear clothes to go somewhere and not to impress', 1, '0000-00-00 00:00:00', '2019-04-30 17:33:46'),
(13, 2, 'Jeans und Sneaker, ich trage Kleidung, um irgendwohin zu gehen und nicht zu beeindrucken', 1, '0000-00-00 00:00:00', '2019-04-30 17:33:59'),
(14, 1, 'Everything got to be perfekt! My outfit has to match from my shirt down to the socks', 1, '0000-00-00 00:00:00', '2019-04-30 17:34:29'),
(14, 2, 'Alles muss perfekt sein! Mein Outfit muss von meinem Hemd bis zu den Socken passen', 1, '0000-00-00 00:00:00', '2019-04-30 17:34:37'),
(15, 1, 'i dont care as long as it is comfortable', 1, '0000-00-00 00:00:00', '2019-04-30 17:34:51'),
(15, 2, 'Ich interessiere mich nicht, solange es bequem ist', 1, '0000-00-00 00:00:00', '2019-04-30 17:34:59'),
(16, 1, 'crazy!! I create my own style', 1, '0000-00-00 00:00:00', '2019-04-30 17:35:23'),
(16, 2, 'verrückt!! Ich erschaffe meinen eigenen Stil', 1, '0000-00-00 00:00:00', '2019-04-30 17:35:12'),
(17, 1, 'Love and security', 1, '0000-00-00 00:00:00', '2019-04-30 17:40:17'),
(17, 2, 'Liebe und Sicherheit', 1, '0000-00-00 00:00:00', '2019-04-30 17:40:25'),
(18, 1, 'Money and status', 1, '0000-00-00 00:00:00', '2019-04-30 17:40:39'),
(18, 2, 'Geld und Status', 1, '0000-00-00 00:00:00', '2019-04-30 17:40:46'),
(19, 1, 'Regularly free time activities / hobbys', 1, '0000-00-00 00:00:00', '2019-04-30 17:41:03'),
(19, 2, 'Regelmäßig Freizeitaktivitäten / Hobbies', 1, '0000-00-00 00:00:00', '2019-04-30 17:41:21'),
(20, 1, 'satisfaction of physical needs', 1, '0000-00-00 00:00:00', '2019-04-30 17:41:27'),
(20, 2, 'Befriedigung der körperlichen Bedürfnisse', 1, '0000-00-00 00:00:00', '2019-04-30 17:41:37'),
(21, 1, 'becoming old together', 1, '0000-00-00 00:00:00', '2019-04-30 17:41:58'),
(21, 2, 'gemeinsam alt werden', 1, '0000-00-00 00:00:00', '2019-04-30 17:42:23'),
(22, 1, 'shy', 1, '0000-00-00 00:00:00', '2019-04-30 17:48:31'),
(22, 2, 'schüchtern', 1, '0000-00-00 00:00:00', '2019-04-30 17:48:59'),
(23, 1, 'depending on my mood', 1, '0000-00-00 00:00:00', '2019-04-30 17:48:39'),
(23, 2, 'je nach Laune', 1, '0000-00-00 00:00:00', '2019-04-30 17:48:47'),
(24, 1, 'open minded', 1, '0000-00-00 00:00:00', '2019-04-30 17:49:17'),
(24, 2, 'offen', 1, '0000-00-00 00:00:00', '2019-04-30 17:49:24'),
(25, 1, 'humorous', 1, '0000-00-00 00:00:00', '2019-04-30 17:49:39'),
(25, 2, 'humorvoll', 1, '0000-00-00 00:00:00', '2019-04-30 17:49:45'),
(26, 1, 'sensitive', 1, '0000-00-00 00:00:00', '2019-04-30 17:49:57'),
(26, 2, 'empfindlich', 1, '0000-00-00 00:00:00', '2019-04-30 17:50:06'),
(27, 1, 'emotional', 1, '0000-00-00 00:00:00', '2019-04-30 17:50:13'),
(27, 2, 'emotional', 1, '0000-00-00 00:00:00', '2019-04-30 17:50:26'),
(28, 1, 'optimistic', 1, '0000-00-00 00:00:00', '2019-04-30 17:50:36'),
(28, 2, 'optimistisch', 1, '0000-00-00 00:00:00', '2019-04-30 17:50:43'),
(29, 1, 'pesimistic', 1, '0000-00-00 00:00:00', '2019-04-30 17:50:59'),
(29, 2, 'pessimistisch', 1, '0000-00-00 00:00:00', '2019-04-30 17:51:07'),
(30, 1, 'Netflix & TV', 1, '0000-00-00 00:00:00', '2019-04-30 17:56:30'),
(30, 2, 'Netflix & TV', 1, '0000-00-00 00:00:00', '2019-04-30 17:56:39'),
(31, 1, 'Bar hopping with friends', 1, '0000-00-00 00:00:00', '2019-04-30 17:56:47'),
(31, 2, 'Barhopping mit Freunden', 1, '0000-00-00 00:00:00', '2019-04-30 17:56:55'),
(32, 1, 'Club or other Party locations', 1, '0000-00-00 00:00:00', '2019-04-30 17:57:05'),
(32, 2, 'Club- oder andere Partyorte', 1, '0000-00-00 00:00:00', '2019-04-30 17:57:13'),
(33, 1, 'short trip', 1, '0000-00-00 00:00:00', '2019-04-30 17:57:23'),
(33, 2, 'Kurzausflug', 1, '0000-00-00 00:00:00', '2019-04-30 17:57:31'),
(34, 1, 'wellness', 1, '0000-00-00 00:00:00', '2019-04-30 17:57:40'),
(34, 2, 'Wellness', 1, '0000-00-00 00:00:00', '2019-04-30 17:57:48'),
(35, 1, 'go out for dinner', 1, '0000-00-00 00:00:00', '2019-04-30 17:57:57'),
(35, 2, 'Essen gehen', 1, '0000-00-00 00:00:00', '2019-04-30 17:58:06'),
(36, 1, 'sportive activities', 1, '0000-00-00 00:00:00', '2019-04-30 17:58:17'),
(36, 2, 'sportliche Aktivitäten', 1, '0000-00-00 00:00:00', '2019-04-30 17:58:25'),
(37, 1, 'with my family', 1, '0000-00-00 00:00:00', '2019-04-30 17:58:33'),
(37, 2, 'mit meiner Familie', 1, '0000-00-00 00:00:00', '2019-04-30 17:58:41'),
(38, 1, 'I like to cook at home', 1, '0000-00-00 00:00:00', '2019-04-30 18:19:53'),
(38, 2, 'Ich koche gerne zu Hause', 1, '0000-00-00 00:00:00', '2019-04-30 18:20:11'),
(39, 1, 'i like to get cooks', 1, '0000-00-00 00:00:00', '2019-04-30 18:20:18'),
(39, 2, 'Ich mag es, Köche zu bekommen', 1, '0000-00-00 00:00:00', '2019-04-30 18:20:25'),
(40, 1, 'ready meals at home', 1, '0000-00-00 00:00:00', '2019-04-30 18:20:46'),
(40, 2, 'Fertiggerichte zu Hause', 1, '0000-00-00 00:00:00', '2019-04-30 18:20:54'),
(41, 1, 'delivery service', 1, '0000-00-00 00:00:00', '2019-04-30 18:21:03'),
(41, 2, 'Lieferservice', 1, '0000-00-00 00:00:00', '2019-04-30 18:21:13'),
(42, 1, 'Fast food', 1, '0000-00-00 00:00:00', '2019-04-30 18:21:22'),
(42, 2, 'Fast Food', 1, '0000-00-00 00:00:00', '2019-04-30 18:21:31'),
(43, 1, 'restaurans', 1, '0000-00-00 00:00:00', '2019-04-30 18:21:57'),
(43, 2, 'Restaurants', 1, '0000-00-00 00:00:00', '2019-04-30 18:22:03'),
(44, 1, 'German', 1, '0000-00-00 00:00:00', '2019-04-30 18:36:13'),
(44, 2, 'German', 1, '0000-00-00 00:00:00', '2019-04-30 18:36:15'),
(45, 1, 'Italian', 1, '0000-00-00 00:00:00', '2019-04-30 18:36:06'),
(45, 2, 'Italian', 1, '0000-00-00 00:00:00', '2019-04-30 18:36:04'),
(46, 1, 'Asian', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:57'),
(46, 2, 'Asian', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:54'),
(47, 1, 'African', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:48'),
(47, 2, 'African', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:46'),
(48, 1, 'american', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:41'),
(48, 2, 'american', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:39'),
(49, 1, 'greek', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:31'),
(49, 2, 'greek', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:28'),
(50, 1, 'oriental', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:19'),
(50, 2, 'oriental', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:23'),
(51, 1, 'international', 1, '0000-00-00 00:00:00', '2019-04-30 18:34:56'),
(51, 2, 'International', 1, '0000-00-00 00:00:00', '2019-04-30 18:35:09'),
(52, 1, 'the alarm clock rings at 6 oclock so I can get the most out of the day', 1, '0000-00-00 00:00:00', '2019-04-30 18:39:19'),
(52, 2, 'Der Wecker klingelt um 6 Uhr, damit ich den Tag optimal nutzen kann', 1, '0000-00-00 00:00:00', '2019-04-30 18:39:28'),
(53, 1, 'i get up when I wake up', 1, '0000-00-00 00:00:00', '2019-04-30 18:39:35'),
(53, 2, 'Ich stehe auf, wenn ich aufwache', 1, '0000-00-00 00:00:00', '2019-04-30 18:39:47'),
(54, 1, 'No way to get me out of bed before 12 o clock', 1, '0000-00-00 00:00:00', '2019-04-30 18:39:56'),
(54, 2, 'Keine Möglichkeit, mich vor 12 Uhr aus dem Bett zu bekommen', 1, '0000-00-00 00:00:00', '2019-04-30 18:40:05'),
(55, 1, 'dog', 1, '0000-00-00 00:00:00', '2019-04-30 18:42:32'),
(55, 2, 'Hund', 1, '0000-00-00 00:00:00', '2019-04-30 18:42:41'),
(56, 1, 'cat', 1, '0000-00-00 00:00:00', '2019-04-30 18:42:47'),
(56, 2, 'Katze', 1, '0000-00-00 00:00:00', '2019-04-30 18:42:55'),
(57, 1, 'I don\'t like animals at all', 1, '0000-00-00 00:00:00', '2019-04-30 18:43:25'),
(57, 2, 'Ich mag keine Tiere', 1, '0000-00-00 00:00:00', '2019-04-30 18:43:15'),
(65, 1, 'Sports', 1, '0000-00-00 00:00:00', '2019-04-30 18:56:46'),
(65, 2, 'Sports', 1, '0000-00-00 00:00:00', '2019-04-30 18:56:44'),
(66, 1, 'relaxing on the couch watching TV or something else', 1, '0000-00-00 00:00:00', '2019-04-30 18:56:36'),
(66, 2, 'relaxing on the couch watching TV or something else', 1, '0000-00-00 00:00:00', '2019-04-30 18:56:32'),
(67, 1, 'Meeting up with friends', 1, '0000-00-00 00:00:00', '2019-04-30 18:56:23'),
(67, 2, 'Meeting up with friends', 1, '0000-00-00 00:00:00', '2019-04-30 18:56:20'),
(68, 1, 'shopping', 1, '0000-00-00 00:00:00', '2019-04-30 18:56:11'),
(68, 2, 'shopping', 1, '0000-00-00 00:00:00', '2019-04-30 18:56:09'),
(69, 1, 'reading books', 1, '0000-00-00 00:00:00', '2019-04-30 18:56:01'),
(69, 2, 'reading books', 1, '0000-00-00 00:00:00', '2019-04-30 18:55:56'),
(70, 1, 'creative things (art&music)', 1, '0000-00-00 00:00:00', '2019-04-30 18:55:47'),
(70, 2, 'creative things (art&music)', 1, '0000-00-00 00:00:00', '2019-04-30 18:55:38'),
(71, 1, 'spiritual things (meditation,taichi..)', 1, '0000-00-00 00:00:00', '2019-04-30 18:55:14'),
(71, 2, 'spiritual things (meditation,taichi..)', 1, '0000-00-00 00:00:00', '2019-04-30 18:55:13'),
(72, 1, 'PC & Video games', 1, '0000-00-00 00:00:00', '2019-04-30 18:55:03'),
(72, 2, 'PC & Video games', 1, '0000-00-00 00:00:00', '2019-04-30 18:55:05'),
(73, 1, 'buildung up property (network marketing, freelance work..)', 1, '0000-00-00 00:00:00', '2019-04-30 18:54:46'),
(73, 2, 'Immobilien aufbauen (Network Marketing, freiberufliche Tätigkeit ..)', 1, '0000-00-00 00:00:00', '2019-04-30 18:54:53'),
(74, 1, 'just at the ocean', 1, '0000-00-00 00:00:00', '2019-04-30 19:02:47'),
(74, 2, 'just at the ocean', 1, '0000-00-00 00:00:00', '2019-04-30 19:02:49'),
(75, 1, 'to the mountains for hiking or skiing', 1, '0000-00-00 00:00:00', '2019-04-30 19:02:56'),
(75, 2, 'to the mountains for hiking or skiing', 1, '0000-00-00 00:00:00', '2019-04-30 19:02:58'),
(76, 1, 'Sightseeing Tour plus Museums+', 1, '0000-00-00 00:00:00', '2019-04-30 19:03:07'),
(76, 2, 'Sightseeing Tour plus Museums+', 1, '0000-00-00 00:00:00', '2019-04-30 19:03:16'),
(77, 1, 'Adventure holdiays', 1, '0000-00-00 00:00:00', '2019-04-30 19:03:28'),
(77, 2, 'Adventure holdiays', 1, '0000-00-00 00:00:00', '2019-04-30 19:03:30'),
(78, 1, 'I don’t need to go on vacation, I like to stay at home', 1, '0000-00-00 00:00:00', '2019-04-30 19:03:36'),
(78, 2, 'I don’t need to go on vacation, I like to stay at home', 1, '0000-00-00 00:00:00', '2019-04-30 19:03:39'),
(79, 1, 'attractive appearance', 1, '0000-00-00 00:00:00', '2019-04-30 19:10:44'),
(79, 2, 'attractive appearance', 1, '0000-00-00 00:00:00', '2019-04-30 19:10:41'),
(80, 1, 'common interests', 1, '0000-00-00 00:00:00', '2019-04-30 19:10:35'),
(80, 2, 'common interests', 1, '0000-00-00 00:00:00', '2019-04-30 19:10:32'),
(81, 1, 'intelligence', 1, '0000-00-00 00:00:00', '2019-04-30 19:10:25'),
(81, 2, 'intelligence', 1, '0000-00-00 00:00:00', '2019-04-30 19:10:22'),
(82, 1, 'Status and Money', 1, '0000-00-00 00:00:00', '2019-04-30 19:10:16'),
(82, 2, 'Status and Money', 1, '0000-00-00 00:00:00', '2019-04-30 19:10:13'),
(83, 1, 'emphatie', 1, '0000-00-00 00:00:00', '2019-04-30 19:10:02'),
(83, 2, 'emphatie', 1, '0000-00-00 00:00:00', '2019-04-30 19:09:59'),
(84, 1, 'Loyalty', 1, '0000-00-00 00:00:00', '2019-04-30 19:09:51'),
(84, 2, 'Loyalty', 1, '0000-00-00 00:00:00', '2019-04-30 19:09:49'),
(85, 1, 'honesty', 1, '0000-00-00 00:00:00', '2019-04-30 19:09:40'),
(85, 2, 'honesty', 1, '0000-00-00 00:00:00', '2019-04-30 19:09:37'),
(86, 1, 'very important – daily', 1, '0000-00-00 00:00:00', '2019-04-30 19:16:05'),
(86, 2, 'very important – daily', 1, '0000-00-00 00:00:00', '2019-04-30 19:16:03'),
(87, 1, 'important –3 or 4 times per week', 1, '0000-00-00 00:00:00', '2019-04-30 19:15:56'),
(87, 2, 'important –3 or 4 times per week', 1, '0000-00-00 00:00:00', '2019-04-30 19:15:54'),
(88, 1, 'one time per week is already enough', 1, '0000-00-00 00:00:00', '2019-04-30 19:15:40'),
(88, 2, 'one time per week is already enough', 1, '0000-00-00 00:00:00', '2019-04-30 19:15:37'),
(89, 1, 'not important', 1, '0000-00-00 00:00:00', '2019-04-30 19:15:28'),
(89, 2, 'not important', 1, '0000-00-00 00:00:00', '2019-04-30 19:15:25'),
(90, 1, 'Yes, when the right time has come', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:02'),
(90, 2, 'Yes, when the right time has come', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:05'),
(91, 1, 'no', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:14'),
(91, 2, 'no', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:16'),
(92, 1, 'Lets see im open for everything', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:22'),
(92, 2, 'Lets see im open for everything', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:26'),
(93, 1, 'Yes, when she / he is the right one', 1, '0000-00-00 00:00:00', '2019-04-30 19:26:07'),
(93, 2, 'Yes, when she / he is the right one', 1, '0000-00-00 00:00:00', '2019-04-30 19:26:13'),
(94, 1, 'no', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:14'),
(94, 2, 'no', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:16'),
(95, 1, 'Lets see im open for everything', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:22'),
(95, 2, 'Lets see im open for everything', 1, '0000-00-00 00:00:00', '2019-04-30 19:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `test_ques`
--

CREATE TABLE `test_ques` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `ques_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_ques`
--

INSERT INTO `test_ques` (`id`, `test_id`, `ques_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 2, 1),
(20, 2, 2),
(21, 2, 3),
(22, 2, 4),
(23, 2, 5),
(24, 2, 6),
(25, 2, 7),
(26, 2, 8),
(27, 2, 9),
(28, 2, 10),
(29, 2, 11),
(30, 2, 12),
(31, 2, 13),
(32, 2, 14),
(33, 2, 15),
(34, 2, 16),
(35, 2, 17);

-- --------------------------------------------------------

--
-- Table structure for table `test_ques_ans`
--

CREATE TABLE `test_ques_ans` (
  `id` int(11) NOT NULL,
  `test_que_id` int(11) NOT NULL,
  `ans_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test_ques_ans`
--

INSERT INTO `test_ques_ans` (`id`, `test_que_id`, `ans_id`) VALUES
(1, 1, 2),
(2, 2, 4),
(3, 3, 12),
(4, 4, 15),
(5, 5, 20),
(6, 5, 21),
(7, 6, 24),
(8, 6, 25),
(9, 7, 31),
(10, 7, 32),
(11, 7, 33),
(12, 8, 42),
(13, 8, 43),
(14, 9, 50),
(15, 10, 53),
(16, 11, 57),
(17, 12, 63),
(18, 13, 70),
(19, 13, 71),
(20, 13, 72),
(21, 14, 77),
(22, 15, 80),
(23, 15, 81),
(24, 15, 82),
(25, 16, 87),
(26, 17, 91),
(27, 18, 94),
(28, 19, 2),
(29, 20, 6),
(30, 21, 11),
(31, 22, 15),
(32, 23, 19),
(33, 23, 20),
(34, 24, 27),
(35, 24, 28),
(36, 25, 33),
(37, 25, 34),
(38, 25, 35),
(39, 26, 41),
(40, 26, 42),
(41, 27, 50),
(42, 28, 54),
(43, 29, 57),
(44, 30, 64),
(45, 31, 70),
(46, 31, 71),
(47, 31, 72),
(48, 32, 78),
(49, 33, 81),
(50, 33, 82),
(51, 33, 83),
(52, 34, 89),
(53, 35, 92);

-- --------------------------------------------------------

--
-- Table structure for table `test_ques_comparisons`
--

CREATE TABLE `test_ques_comparisons` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Not Used',
  `test_ques_1` int(11) DEFAULT NULL,
  `test_ques_2` int(11) DEFAULT NULL,
  `obtained_marks` decimal(10,2) NOT NULL,
  `max_allowed_marks` decimal(10,2) NOT NULL,
  `final_marks` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` enum('en','de') COLLATE utf8mb4_unicode_ci DEFAULT 'en' COMMENT 'language en=english, de=germany',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> male, 2=> female',
  `age` int(11) DEFAULT NULL,
  `login_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> manaual,2=> facebook, 3=> google, 4=> instagram',
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_code` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `love_push_intention` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1= relationship, 2= friendship, 3= daily activities, 4= no expactations',
  `relationship` tinyint(5) DEFAULT NULL COMMENT '1= single, 2= in relationship, 3= married, 4= recently separated, 5= pen relationship',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physique` tinyint(5) DEFAULT NULL COMMENT '1= plump, 2= thin, 3= athletic, 4= muscular, 5= normal',
  `eyecolor` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `haircolor` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hobbies` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexual_orientation` tinyint(4) DEFAULT NULL COMMENT '1=> hetrosexual, 2=> bisexual, 3=> homesexual',
  `aboutme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0=> de-active, 1=> active',
  `is_restrict_fb_friends` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> not restrict, 0=> restrict',
  `partner_preference` tinyint(4) NOT NULL DEFAULT '3' COMMENT '1=> male, 2=> female, 3=> anyone',
  `is_profile_complete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=> not, 1=> yes',
  `device_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=> android, 2=> ios',
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '2' COMMENT '1=> admin, 2=> normal users',
  `employer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Not Used',
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Not Used',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Not Used',
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Not Used',
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Not Used',
  `is_phone_verify` tinyint(4) NOT NULL DEFAULT '0' COMMENT '(Not Used)0=> not, 1=> yes ',
  `subscription_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '(Not Used)1=>free, 2=>premium, 3=>vip',
  `subscription_expire_date` date DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `register_from` enum('','web') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'web= from website'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `locale`, `name`, `username`, `email`, `gender`, `age`, `login_type`, `social_id`, `verification_code`, `email_verified_at`, `phone_code`, `phone`, `latitude`, `longitude`, `password`, `love_push_intention`, `relationship`, `size`, `physique`, `eyecolor`, `haircolor`, `education`, `job`, `hobbies`, `religion`, `sexual_orientation`, `aboutme`, `status`, `is_restrict_fb_friends`, `partner_preference`, `is_profile_complete`, `device_type`, `device_token`, `profile_image`, `role`, `employer`, `country`, `address`, `city`, `language`, `is_phone_verify`, `subscription_type`, `subscription_expire_date`, `remember_token`, `created_at`, `updated_at`, `register_from`) VALUES
(1, 'en', 'Har', NULL, 'har@yopmail.com', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$gLBXXgyIGUAIJhW5HVjMrevaBKk6AX2vryxIDbzSemh720wWuPuZO', NULL, NULL, 'e4re', NULL, '6', 'frwe', 'wefrwe', 'ewrwe', 'werwe', NULL, 1, 'werweqrweq', 1, 1, 3, 1, 1, NULL, NULL, 1, 'werwqe', NULL, NULL, NULL, 'dsfsd', 0, 1, NULL, 'GAc5JWNTbTkiQkPhzzmQBv2EjmKhTaKgePg9C1cWXpGVeAOAUXMp4RU8HR13', '2019-01-18 07:57:34', '2019-01-22 05:19:59', NULL),
(3, 'en', 'ER', 'testuser1', 'test1@mailinator.com', 1, NULL, 1, NULL, NULL, NULL, '+91', '8264193357', '30.72808590000001', '76.84575629999999', '$2y$10$85mWAwmiAoDitlw8yohLveqhou1fanIlt26i./Wc0HJ7/P1GHELJq', NULL, NULL, 'e4re', NULL, 'er', 'frwe', 'wefrwe', 'ewrwe', 'werwe', NULL, 1, 'werweqrweq', 1, 1, 2, 1, 2, NULL, '1548661234.png', 2, 'werwqe', 'india', 'Tower C, Third Floor DLF Building, IT Park 160101, Phase - I, Manimajra, Chandigarh, Haryana 134114, India', 'Chandigarh', 'dsfsd', 0, 1, NULL, NULL, '2019-01-21 07:43:07', '2019-01-28 02:10:34', NULL),
(4, 'en', 'Abhishek', 'abhi', 'abshi@yopmail.com', 1, NULL, 1, NULL, NULL, NULL, '1', '9632587410', '28.4456789', '36.1123456', '$2y$10$FVLll0hrpR/8Fp10q/7LteVef0dLzpof8q2wRyD/4ZrKRSz7otO.e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 2, NULL, NULL, 2, NULL, '4554', 'Chandigarh', 'city', NULL, 0, 1, NULL, NULL, '2019-01-22 04:15:28', '2019-01-22 04:15:28', NULL),
(5, 'en', 'hh', 'bh', 'vv@mailinator.com', 1, NULL, 1, NULL, NULL, NULL, '+1', '1234567890', '30.7278325', '76.84623828125004', '$2y$10$QOKPakIaLZ1zRFls0uNC0OZvJrNbITuSKIftgalLhbrNgny4rPQJm', NULL, NULL, 'hxhx', NULL, 'ddhhd', 'hfhfhf', 'hddydh', 'fyhffh', 'dyydyd', NULL, 1, 'fhhdhd', 1, 1, 3, 1, 1, NULL, NULL, 2, 'gdgdgd', 'IN', 'Unnamed Road, Phase - I, Manimajra, Chandigarh, Haryana 160101, India', 'Chandigarh', 'hffh', 0, 1, NULL, NULL, '2019-01-22 04:32:01', '2019-01-22 06:41:48', NULL),
(6, 'en', 'ER', 'testuser2', 'test3@mailinator.com', 1, NULL, 1, NULL, NULL, NULL, '+91', '9915359476', '30.72808590000001', '76.84575629999999', '$2y$10$K2zDvXrb/nngBrWdLlEQhepOPkzFK8EiWmH6zZ3WA9KVWqb0Ds7Eq', NULL, NULL, 'e4re', NULL, 'er', 'frwe', 'wefrwe', 'ewrwe', 'werwe', NULL, 1, 'werweqrweq', 1, 0, 1, 1, 2, NULL, '1548661272.png', 2, 'werwqe', 'India', 'Tower C, Third Floor DLF Building, IT Park 160101, Phase - I, Manimajra, Chandigarh, Haryana 134114, India', 'Chandigarh', 'dsfsd', 1, 1, NULL, NULL, '2019-01-23 06:50:49', '2019-01-28 02:11:12', NULL),
(8, 'en', 'test', 'testuser3', 'test1@gmail.com', 1, NULL, 1, NULL, NULL, NULL, '+91', '8146523265', '30.72808590000001', '76.84575629999999', '$2y$10$w9dO9UwC0u.nnbe4rZBOB.TSO3bgom.dg1a7F24tLa2orBF5n0RKe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 2, NULL, NULL, 2, NULL, 'india', 'Tower C, Third Floor DLF Building, IT Park 160101, Phase - I, Manimajra, Chandigarh, Haryana 134114, India', 'chandigarh', NULL, 0, 1, NULL, NULL, '2019-01-24 06:22:47', '2019-01-24 06:22:47', NULL),
(12, 'en', 'test', 'testuser4', 'test2@gmail.com', 1, NULL, 1, NULL, 9111, NULL, '+91', '9457819996', '30.72808590000001', '76.84575629999999', '$2y$10$xdaCRyp6iQDd1cLQmX.PseC4caSTfVWl3WKGOwB3S91oCylcSCuBC', NULL, NULL, 'siz', NULL, 'eye', 'hair', 'edu', 'job', 'hobb', NULL, 1, 'Hejd djdbdjd fjdfjd fj jd', 1, 1, 3, 1, 2, NULL, NULL, 2, 'emp', 'india', 'Tower C, Third Floor DLF Building, IT Park 160101, Phase - I, Manimajra, Chandigarh, Haryana 134114, India', 'chandigarh', 'lan', 1, 1, NULL, NULL, '2019-01-24 07:19:46', '2019-01-25 05:18:43', NULL),
(13, 'en', 'vivek kumar', 'vivek', 'vivek.kumar@xicom.biz', 1, NULL, 1, NULL, NULL, NULL, '+91', '9878390481', '30.727837499999996', '76.84623046875001', '$2y$10$SYTno2f6DUO0.rCKmkIune9GR6.H3pdUYnZdFkgUcMO9bj7C.R0.u', NULL, NULL, 'hshs', NULL, 'hshs', 'hdhs', 'hshsh', 'hshs', 'hshe', NULL, 1, 'ydhdudydydz', 1, 1, 3, 1, 1, NULL, NULL, 2, 'dhsh', 'India', 'Unnamed Road, Phase - I, Manimajra, Chandigarh, Haryana 160101, India', 'Chandigarh', 'hshs', 1, 1, NULL, NULL, '2019-01-25 04:13:28', '2019-01-25 04:13:50', NULL),
(14, 'en', 'Subhash', 'Subhash', 'subhash@gmail.com', 1, NULL, 1, NULL, NULL, NULL, '+91', '7678458695', '28.620959', '77.081805', '$2y$10$CNeFpfVpqReIL9H6lahMbOlckTMjHz23yp83MFi3vcwKF4gXFpXzS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 1, NULL, NULL, 2, NULL, 'India', 'C-1/134, Janak Puri, Block C1, Janakpuri, New Delhi, Delhi 110058, India', 'New Delhi', NULL, 0, 1, NULL, NULL, '2019-03-13 05:11:34', '2019-03-13 05:11:34', NULL),
(15, 'en', 'test', 'test1', 'test2@mailinator.com', 1, NULL, 1, NULL, NULL, NULL, '+91', '8146523266', '30.72808590000001', '76.84575629999999', '$2y$10$.ECjJEVsSb.hPWRl8qgh2unOKr77YHgP7F5gV1gjuc918YFRqemDC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 2, NULL, NULL, 2, NULL, 'India', 'Tower C, Third Floor DLF Building, IT Park 160101, Phase - I, Manimajra, Chandigarh, Haryana 134114, India', 'Chandigarh', NULL, 0, 1, NULL, NULL, '2019-03-20 05:16:32', '2019-03-20 05:16:32', NULL),
(16, 'en', 'gfd', NULL, 'admin@happiix.com', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$rDWXNc0/iUTlHuV63SlEjOHF4uVaRPwNc6LriNveharxJ9/vuODQO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2019-04-02 07:47:31', '2019-04-02 07:47:31', NULL),
(17, 'en', 'Akhil', NULL, 'admin1@happiix.com', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$By22FXtVgELaTa3.t6kZO.mD1Igjsu9Mv8zz9ThlBHHoYzFxpqZDi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2019-04-02 08:08:14', '2019-04-02 08:08:14', 'web'),
(18, 'en', 'Akhil', NULL, 'akhil.sharma1@xicom.biz', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$FFZpecXaCAIr3kjugM1Tv.9xqWhRE6L2ugaBYa.7.IuukQlvs8jj2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2019-04-08 01:57:01', '2019-04-08 01:57:01', 'web'),
(20, 'en', 'arnav', NULL, 'akhil.sharma33@xicom.biz', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$/QWYirQHP61IO4eRmIYjLuf2AGWoTrjYehR5RyYnuwVdJ3BeEDtOW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2019-04-08 01:58:28', '2019-04-08 01:58:28', 'web'),
(21, 'en', 'Akhil', NULL, 'akhil.sharma85@xicom.biz', 1, NULL, 1, NULL, NULL, NULL, '+91', '56876876', NULL, NULL, '$2y$10$KhmgAiZwKKqaIoeXNWouyOerUWkPoHljDDSAUTc7Jhp2yrgZJspDW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2019-04-08 02:06:13', '2019-04-08 02:06:13', 'web'),
(23, 'en', 'gdg', NULL, 'admin@felsub.com', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$KpJYgBD38RgnlT6qMNvpkekJdL2N.RDLmncHffuDqtl4n.F0nDhW2', NULL, NULL, NULL, NULL, '', '', NULL, NULL, 'dhfghgh', NULL, 1, '', 1, 1, 2, 0, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2019-04-08 04:06:08', '2019-04-16 23:57:46', 'web'),
(24, 'en', 'gdgfgh', NULL, '', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$WqDf2aS/lTPpxebmNKo2TOVjsajsXuy/H0XXLjLeMIqyLFHztpOCy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2019-04-17 00:04:51', '2019-04-17 00:04:51', NULL),
(25, 'en', 'vvvvvvv', NULL, 'vivek@mailinator.com', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$HuJR8.t4H6LnH6ZYiLUf7uTaL7PGDNjS/q56mje2blukOqeNjbTlC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2019-04-17 00:07:27', '2019-04-17 00:07:27', NULL),
(26, 'en', 'Abhishek', 'abhi', 'abhi@yopmail.com', 1, NULL, 1, NULL, NULL, NULL, '9632587410', '9632587412', '28.4456789', '36.1123456', '$2y$10$cQoHMhph.JSqHDG8XIIUgem6ENtreySCNdLG6raH.7cCaevg5JDZC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 2, NULL, NULL, 2, NULL, 'India', 'Chandigarh', 'chandigarh', NULL, 0, 1, NULL, NULL, '2019-04-18 02:20:25', '2019-04-18 02:20:25', NULL),
(27, 'en', 'akhil', 'akhil', 'akhil@gmail.com', 1, NULL, 2, '35435', NULL, NULL, '9632587410', '7814817171', '28.4456789', '36.1123456', NULL, NULL, NULL, 'gfhgfh', NULL, 'fhgfh', 'fghfg', 'gfhg', 'gfhgf', 'fgh', NULL, 1, 'ffghuyt', 1, 1, 3, 1, 1, NULL, NULL, 2, 'gfhgh5654', 'India', 'Chandigarh', 'chandigarh', 'hgfdh', 1, 1, NULL, NULL, '2019-04-22 01:16:01', '2019-04-22 01:59:05', NULL),
(28, 'en', 'Mark', NULL, 'mark@mailinator.com', 1, NULL, 1, NULL, 8800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2019-05-10 01:31:12', '2019-05-10 01:31:12', 'web'),
(29, 'en', 'Chris', NULL, 'mark1@mailinator.com', 1, NULL, 1, NULL, NULL, '2019-05-10 01:53:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 0, 1, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2019-05-10 01:33:14', '2019-05-10 01:53:59', 'web');

-- --------------------------------------------------------

--
-- Table structure for table `user_attempt_questions`
--

CREATE TABLE `user_attempt_questions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_attempt_questions`
--

INSERT INTO `user_attempt_questions` (`id`, `user_id`, `question_id`, `created_at`, `updated_at`) VALUES
(1, 3, 3, '2019-05-08 07:05:45', '2019-05-08 15:28:06'),
(2, 3, 4, '2019-05-08 07:16:25', '2019-05-08 15:28:08'),
(3, 3, 5, '2019-05-08 07:17:08', '2019-05-08 15:28:10'),
(4, 3, 6, '2019-05-08 09:57:52', '2019-05-08 09:57:52'),
(5, 3, 7, '2019-05-08 09:59:24', '2019-05-08 09:59:24'),
(6, 3, 8, '2019-05-08 10:00:13', '2019-05-08 10:00:13'),
(7, 3, 9, '2019-05-08 10:02:23', '2019-05-08 10:02:23'),
(8, 3, 10, '2019-05-08 10:03:05', '2019-05-08 10:03:05'),
(9, 4, 1, '2019-05-08 10:05:53', '2019-05-08 10:05:53'),
(10, 4, 2, '2019-05-08 10:06:12', '2019-05-08 10:06:12'),
(11, 4, 3, '2019-05-08 10:06:40', '2019-05-08 10:06:40'),
(12, 4, 4, '2019-05-08 10:07:05', '2019-05-08 10:07:05'),
(13, 4, 5, '2019-05-08 10:07:43', '2019-05-08 10:07:43'),
(14, 4, 6, '2019-05-08 10:08:10', '2019-05-08 10:08:10'),
(15, 4, 7, '2019-05-08 10:08:52', '2019-05-08 10:08:52'),
(16, 4, 8, '2019-05-08 10:09:30', '2019-05-08 10:09:30'),
(17, 4, 9, '2019-05-08 10:09:52', '2019-05-08 10:09:52'),
(18, 4, 10, '2019-05-08 10:10:41', '2019-05-08 10:10:41'),
(19, 5, 1, '2019-05-08 10:15:47', '2019-05-08 10:15:47'),
(20, 5, 2, '2019-05-08 10:15:56', '2019-05-08 10:15:56'),
(21, 5, 3, '2019-05-08 10:16:50', '2019-05-08 10:16:50'),
(22, 5, 4, '2019-05-08 10:17:05', '2019-05-08 10:17:05'),
(23, 5, 5, '2019-05-08 10:17:30', '2019-05-08 10:17:30'),
(24, 5, 6, '2019-05-08 10:17:58', '2019-05-08 10:17:58'),
(25, 5, 7, '2019-05-08 10:18:31', '2019-05-08 10:18:31'),
(26, 5, 8, '2019-05-08 10:18:57', '2019-05-08 10:18:57'),
(27, 5, 9, '2019-05-08 10:19:39', '2019-05-08 10:19:39'),
(28, 5, 10, '2019-05-08 10:20:01', '2019-05-08 10:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_attempt_ques_answers`
--

CREATE TABLE `user_attempt_ques_answers` (
  `id` int(11) NOT NULL,
  `user_attempt_ques_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_attempt_ques_answers`
--

INSERT INTO `user_attempt_ques_answers` (`id`, `user_attempt_ques_id`, `answer_id`, `created_at`, `updated_at`) VALUES
(1, 1, 10, '2019-05-08 07:05:46', '2019-05-08 07:05:46'),
(2, 2, 13, '2019-05-08 07:16:25', '2019-05-08 07:16:25'),
(3, 3, 19, '2019-05-08 07:17:08', '2019-05-08 07:17:08'),
(4, 3, 20, '2019-05-08 07:17:08', '2019-05-08 07:17:08'),
(5, 4, 24, '2019-05-08 09:57:52', '2019-05-08 09:57:52'),
(6, 4, 25, '2019-05-08 09:57:52', '2019-05-08 09:57:52'),
(7, 5, 32, '2019-05-08 09:59:25', '2019-05-08 09:59:25'),
(8, 5, 34, '2019-05-08 09:59:25', '2019-05-08 09:59:25'),
(9, 5, 36, '2019-05-08 09:59:25', '2019-05-08 09:59:25'),
(10, 6, 41, '2019-05-08 10:00:13', '2019-05-08 10:00:13'),
(11, 6, 43, '2019-05-08 10:00:14', '2019-05-08 10:00:14'),
(12, 7, 50, '2019-05-08 10:02:23', '2019-05-08 10:02:23'),
(13, 8, 53, '2019-05-08 10:03:06', '2019-05-08 10:03:06'),
(14, 9, 2, '2019-05-08 10:05:54', '2019-05-08 10:05:54'),
(15, 10, 6, '2019-05-08 10:06:12', '2019-05-08 10:06:12'),
(16, 11, 12, '2019-05-08 10:06:41', '2019-05-08 10:06:41'),
(17, 12, 15, '2019-05-08 10:07:05', '2019-05-08 10:07:05'),
(18, 13, 20, '2019-05-08 10:07:43', '2019-05-08 10:07:43'),
(19, 13, 21, '2019-05-08 10:07:43', '2019-05-08 10:07:43'),
(20, 14, 26, '2019-05-08 10:08:10', '2019-05-08 10:08:10'),
(21, 14, 27, '2019-05-08 10:08:10', '2019-05-08 10:08:10'),
(22, 15, 34, '2019-05-08 10:08:52', '2019-05-08 10:08:52'),
(23, 15, 35, '2019-05-08 10:08:52', '2019-05-08 10:08:52'),
(24, 15, 36, '2019-05-08 10:08:52', '2019-05-08 10:08:52'),
(25, 16, 41, '2019-05-08 10:09:30', '2019-05-08 10:09:30'),
(26, 16, 42, '2019-05-08 10:09:30', '2019-05-08 10:09:30'),
(27, 17, 50, '2019-05-08 10:09:53', '2019-05-08 10:09:53'),
(28, 18, 53, '2019-05-08 10:10:41', '2019-05-08 10:10:41'),
(29, 19, 1, '2019-05-08 10:15:47', '2019-05-08 10:15:47'),
(30, 20, 4, '2019-05-08 10:15:56', '2019-05-08 10:15:56'),
(31, 21, 11, '2019-05-08 10:16:50', '2019-05-08 10:16:50'),
(32, 22, 15, '2019-05-08 10:17:05', '2019-05-08 10:17:05'),
(33, 23, 18, '2019-05-08 10:17:30', '2019-05-08 10:17:30'),
(34, 23, 19, '2019-05-08 10:17:30', '2019-05-08 10:17:30'),
(35, 24, 26, '2019-05-08 10:17:58', '2019-05-08 10:17:58'),
(36, 24, 27, '2019-05-08 10:17:58', '2019-05-08 10:17:58'),
(37, 25, 34, '2019-05-08 10:18:31', '2019-05-08 10:18:31'),
(38, 25, 35, '2019-05-08 10:18:31', '2019-05-08 10:18:31'),
(39, 25, 36, '2019-05-08 10:18:31', '2019-05-08 10:18:31'),
(40, 26, 41, '2019-05-08 10:18:57', '2019-05-08 10:18:57'),
(41, 26, 42, '2019-05-08 10:18:58', '2019-05-08 10:18:58'),
(42, 27, 50, '2019-05-08 10:19:39', '2019-05-08 10:19:39'),
(43, 28, 53, '2019-05-08 10:20:01', '2019-05-08 10:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile_images`
--

CREATE TABLE `user_profile_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_profile_images`
--

INSERT INTO `user_profile_images` (`id`, `user_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 3, '215231548660957.png', '2019-01-28 02:05:57', '2019-01-28 02:05:57'),
(2, 3, '185371548660957.png', '2019-01-28 02:05:57', '2019-01-28 02:05:57'),
(3, 3, '279021548661234.png', '2019-01-28 02:10:34', '2019-01-28 02:10:34'),
(4, 3, '968221548661234.png', '2019-01-28 02:10:34', '2019-01-28 02:10:34'),
(5, 6, '353311548661272.png', '2019-01-28 02:11:12', '2019-01-28 02:11:12'),
(6, 6, '392041548661272.png', '2019-01-28 02:11:12', '2019-01-28 02:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_requests`
--

CREATE TABLE `user_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `receiver_id` int(10) UNSIGNED NOT NULL,
  `is_sender_user_like` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 => like, -1=> rejected/dislike',
  `is_receiver_accepted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1=> accepted, 0=> pending, -1=> not-accepted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_requests`
--

INSERT INTO `user_requests` (`id`, `sender_id`, `receiver_id`, `is_sender_user_like`, `is_receiver_accepted`, `created_at`, `updated_at`) VALUES
(2, 3, 6, 1, 0, '2019-01-24 04:24:56', '2019-01-24 04:24:56'),
(3, 3, 5, -1, 0, '2019-01-24 04:24:59', '2019-01-24 04:24:59'),
(4, 3, 4, 1, 0, '2019-01-24 04:25:02', '2019-01-24 04:25:02'),
(6, 6, 5, 1, 0, '2019-01-24 04:31:21', '2019-01-24 04:31:21'),
(7, 6, 4, 1, 0, '2019-01-24 04:31:22', '2019-01-24 04:31:22'),
(8, 13, 5, -1, 0, '2019-01-25 06:34:37', '2019-01-25 06:34:37'),
(9, 13, 5, 1, 0, '2019-01-25 06:34:39', '2019-01-25 06:34:39'),
(10, 13, 5, 1, 0, '2019-01-25 06:46:38', '2019-01-25 06:46:38'),
(11, 13, 5, 1, 0, '2019-01-25 07:18:21', '2019-01-25 07:18:21'),
(12, 3, 13, -1, 0, '2019-01-28 00:28:20', '2019-01-28 01:15:52'),
(13, 3, 13, -1, 0, '2019-01-28 01:15:05', '2019-01-28 01:25:58'),
(14, 3, 13, -1, 0, '2019-01-28 01:15:27', '2019-01-28 01:28:14'),
(15, 3, 13, 1, 0, '2019-01-28 01:15:54', '2019-01-28 01:15:54'),
(16, 3, 13, 1, 0, '2019-01-28 01:20:18', '2019-01-28 01:20:18'),
(17, 3, 13, 1, 0, '2019-01-28 01:20:40', '2019-01-28 01:20:40'),
(18, 3, 13, 1, 0, '2019-01-28 01:24:03', '2019-01-28 01:24:03'),
(19, 3, 13, 1, 0, '2019-01-28 01:25:42', '2019-01-28 01:25:42'),
(20, 3, 13, 1, 0, '2019-01-28 01:25:54', '2019-01-28 01:25:54'),
(21, 3, 13, 1, 0, '2019-01-28 01:25:59', '2019-01-28 01:25:59'),
(22, 3, 13, 1, 0, '2019-01-28 01:28:12', '2019-01-28 01:28:12'),
(23, 3, 13, 1, 0, '2019-01-28 01:28:15', '2019-01-28 01:28:15'),
(24, 6, 13, 1, 0, '2019-01-29 01:19:06', '2019-01-29 01:19:06'),
(25, 6, 12, -1, 0, '2019-01-29 01:19:08', '2019-01-29 01:19:08'),
(26, 6, 8, 1, 0, '2019-01-29 01:19:08', '2019-01-29 01:19:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_tests`
--

CREATE TABLE `user_tests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_tests`
--

INSERT INTO `user_tests` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 5, '2019-05-10 09:48:43', '2019-05-10 09:48:43'),
(2, 3, '2019-05-10 10:08:08', '2019-05-10 10:08:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feeds`
--
ALTER TABLE `feeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feeds_user_id_foreign` (`user_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personality_questions@NotUsed`
--
ALTER TABLE `personality_questions@NotUsed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personality_questions_options@NotUsed`
--
ALTER TABLE `personality_questions_options@NotUsed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personality_questions_options_personality_question_id_foreign` (`personality_question_id`);

--
-- Indexes for table `personality_tests@NotUsed`
--
ALTER TABLE `personality_tests@NotUsed`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personality_tests_user_id_foreign` (`user_id`),
  ADD KEY `personality_tests_option_id_foreign` (`option_id`);

--
-- Indexes for table `post_ads`
--
ALTER TABLE `post_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_ads_user_id_foreign` (`user_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_descs`
--
ALTER TABLE `question_descs`
  ADD PRIMARY KEY (`question_id`,`language_id`) USING BTREE;

--
-- Indexes for table `ques_options`
--
ALTER TABLE `ques_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ques_option_descs`
--
ALTER TABLE `ques_option_descs`
  ADD PRIMARY KEY (`ques_option_id`,`language_id`) USING BTREE;

--
-- Indexes for table `test_ques`
--
ALTER TABLE `test_ques`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_ques_comparisons`
--
ALTER TABLE `test_ques_comparisons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_attempt_questions`
--
ALTER TABLE `user_attempt_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_attempt_ques_answers`
--
ALTER TABLE `user_attempt_ques_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profile_images`
--
ALTER TABLE `user_profile_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profile_images_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_requests_sender_id_foreign` (`sender_id`),
  ADD KEY `user_requests_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `user_tests`
--
ALTER TABLE `user_tests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `feeds`
--
ALTER TABLE `feeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `personality_questions@NotUsed`
--
ALTER TABLE `personality_questions@NotUsed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `personality_questions_options@NotUsed`
--
ALTER TABLE `personality_questions_options@NotUsed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `personality_tests@NotUsed`
--
ALTER TABLE `personality_tests@NotUsed`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `post_ads`
--
ALTER TABLE `post_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `ques_options`
--
ALTER TABLE `ques_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `test_ques`
--
ALTER TABLE `test_ques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `test_ques_ans`
--
ALTER TABLE `test_ques_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `test_ques_comparisons`
--
ALTER TABLE `test_ques_comparisons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `user_attempt_questions`
--
ALTER TABLE `user_attempt_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `user_attempt_ques_answers`
--
ALTER TABLE `user_attempt_ques_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `user_profile_images`
--
ALTER TABLE `user_profile_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user_requests`
--
ALTER TABLE `user_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `feeds`
--
ALTER TABLE `feeds`
  ADD CONSTRAINT `feeds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `personality_questions_options@NotUsed`
--
ALTER TABLE `personality_questions_options@NotUsed`
  ADD CONSTRAINT `personality_questions_options_personality_question_id_foreign` FOREIGN KEY (`personality_question_id`) REFERENCES `personality_questions@NotUsed` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `personality_tests@NotUsed`
--
ALTER TABLE `personality_tests@NotUsed`
  ADD CONSTRAINT `personality_tests_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `personality_questions_options@NotUsed` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `personality_tests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_ads`
--
ALTER TABLE `post_ads`
  ADD CONSTRAINT `post_ads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profile_images`
--
ALTER TABLE `user_profile_images`
  ADD CONSTRAINT `user_profile_images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_requests`
--
ALTER TABLE `user_requests`
  ADD CONSTRAINT `user_requests_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_requests_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
