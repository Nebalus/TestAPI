-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Dec 05, 2024 at 10:40 AM
-- Server version: 9.1.0
-- PHP Version: 8.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `main`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
                            `account_id` int UNSIGNED NOT NULL,
                            `user_id` int UNSIGNED DEFAULT NULL,
                            `admin_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
                            `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`account_id`, `user_id`, `admin_description`, `created_at`) VALUES
                                                                                        (1, 1, NULL, '2024-12-05 09:16:20'),
                                                                                        (2, 2, NULL, '2024-12-05 09:16:20'),
                                                                                        (3, 3, NULL, '2024-12-05 09:16:20'),
                                                                                        (4, 4, NULL, '2024-12-05 09:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `account_invitation_tokens`
--

CREATE TABLE `account_invitation_tokens` (
                                             `owner_account_id` int UNSIGNED NOT NULL,
                                             `invited_account_id` int UNSIGNED DEFAULT NULL,
                                             `token_field_1` smallint UNSIGNED NOT NULL,
                                             `token_field_2` smallint UNSIGNED NOT NULL,
                                             `token_field_3` smallint UNSIGNED NOT NULL,
                                             `token_field_4` smallint UNSIGNED NOT NULL,
                                             `token_checksum` smallint UNSIGNED NOT NULL,
                                             `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                             `used_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account_invitation_tokens`
--

INSERT INTO `account_invitation_tokens` (`owner_account_id`, `invited_account_id`, `token_field_1`, `token_field_2`, `token_field_3`, `token_field_4`, `token_checksum`, `created_at`, `used_at`) VALUES
                                                                                                                                                                                                      (1, NULL, 2356, 1345, 7231, 2389, 3330, '2024-11-26 22:09:04', NULL),
                                                                                                                                                                                                      (2, 4, 2467, 5439, 9434, 6317, 5914, '2024-11-12 17:59:26', '2024-11-11 18:59:41'),
                                                                                                                                                                                                      (1, 2, 2485, 2764, 9211, 4695, 4788, '2024-11-05 08:12:38', '2024-11-07 09:07:22'),
                                                                                                                                                                                                      (1, 3, 4586, 5863, 8326, 9386, 7040, '2024-11-05 08:12:38', '2024-11-07 09:09:52'),
                                                                                                                                                                                                      (1, NULL, 6847, 5780, 7257, 1059, 5235, '2024-11-07 08:09:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_punishments`
--

CREATE TABLE `account_punishments` (
                                       `punishment_id` int UNSIGNED NOT NULL,
                                       `punished_account_id` int UNSIGNED NOT NULL,
                                       `moderator_account_id` int UNSIGNED NOT NULL,
                                       `punishment_type` enum('BAN','TEMPBAN') NOT NULL,
                                       `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
                                       `starts_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                       `ends_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `account_punishments`
--

INSERT INTO `account_punishments` (`punishment_id`, `punished_account_id`, `moderator_account_id`, `punishment_type`, `reason`, `starts_at`, `ends_at`) VALUES
    (1, 3, 1, 'BAN', 'Just for Existence', '2024-11-07 08:13:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `linktrees`
--

CREATE TABLE `linktrees` (
                             `linktree_id` int UNSIGNED NOT NULL,
                             `user_id` int UNSIGNED NOT NULL,
                             `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
                             `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `linktrees`
--

INSERT INTO `linktrees` (`linktree_id`, `user_id`, `description`, `created_at`, `updated_at`) VALUES
                                                                                                  (1, 1, 'The Description from Nebalus', '2024-11-12 19:19:41', '2024-11-12 19:19:41'),
                                                                                                  (3, 2, 'Testers Account', '2024-11-12 19:25:09', '2024-11-12 19:25:09');

-- --------------------------------------------------------

--
-- Table structure for table `linktree_clicks`
--

CREATE TABLE `linktree_clicks` (
                                   `click_id` int UNSIGNED NOT NULL,
                                   `linktree_id` int UNSIGNED NOT NULL,
                                   `clicked_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `linktree_clicks`
--

INSERT INTO `linktree_clicks` (`click_id`, `linktree_id`, `clicked_at`) VALUES
                                                                            (1, 1, '2024-11-12 19:23:40'),
                                                                            (2, 1, '2024-11-12 19:23:43'),
                                                                            (3, 1, '2024-11-12 19:23:46'),
                                                                            (4, 1, '2024-11-12 19:24:15'),
                                                                            (5, 1, '2024-11-12 19:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `linktree_entrys`
--

CREATE TABLE `linktree_entrys` (
                                   `linktree_entry_id` int UNSIGNED NOT NULL,
                                   `linktree_id` int UNSIGNED NOT NULL,
                                   `label` varchar(84) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                   `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                   `description` text,
                                   `display_order` int UNSIGNED NOT NULL,
                                   `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                   `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `linktree_entrys`
--

INSERT INTO `linktree_entrys` (`linktree_entry_id`, `linktree_id`, `label`, `url`, `description`, `display_order`, `created_at`, `updated_at`) VALUES
                                                                                                                                                   (1, 1, 'Youtube', 'https://youtube.com', NULL, 1, '2024-11-12 19:20:35', '2024-11-12 19:20:35'),
                                                                                                                                                   (2, 1, 'Github', 'https://github.com/Nebalus', NULL, 2, '2024-11-12 19:21:38', '2024-11-12 19:21:38'),
                                                                                                                                                   (3, 1, 'Crunchyroll', 'https://www.crunchyroll.com/', NULL, 3, '2024-11-12 19:22:36', '2024-11-12 19:22:36'),
                                                                                                                                                   (4, 3, 'ChatGPT', 'https://chatgpt.com/', NULL, 1, '2024-11-12 19:26:10', '2024-11-12 19:26:10');

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
                             `referral_id` int UNSIGNED NOT NULL,
                             `user_id` int UNSIGNED NOT NULL,
                             `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                             `pointer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '/',
                             `disabled` bit(1) NOT NULL DEFAULT b'0',
                             `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `referrals`
--

INSERT INTO `referrals` (`referral_id`, `user_id`, `code`, `pointer`, `disabled`, `created_at`, `updated_at`) VALUES
                                                                                                                  (1, 1, 'TEST', '/', b'0', '2024-02-25 00:00:00', '2024-09-28 15:35:26'),
                                                                                                                  (3, 1, 'sdfsdOPs', 'https://google.com', b'0', '2024-02-25 00:00:00', '2024-09-28 15:35:26'),
                                                                                                                  (5, 1, 'TEST42', '/', b'0', '2024-02-27 11:04:20', '2024-09-28 15:35:26'),
                                                                                                                  (6, 1, '42', '/42', b'0', '2024-02-28 21:30:24', '2024-09-28 15:35:26'),
                                                                                                                  (7, 1, 'dfghdfgh', '/', b'1', '2024-08-03 23:20:58', '2024-09-28 15:35:26'),
                                                                                                                  (11, 2, 'youtube', 'https://youtube.com', b'0', '2024-11-07 08:19:50', '2024-11-07 08:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `referral_clicks`
--

CREATE TABLE `referral_clicks` (
                                   `click_id` int UNSIGNED NOT NULL,
                                   `referral_id` int UNSIGNED NOT NULL,
                                   `clicked_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `referral_clicks`
--

INSERT INTO `referral_clicks` (`click_id`, `referral_id`, `clicked_at`) VALUES
                                                                            (1, 6, '2024-11-05 15:41:25'),
                                                                            (2, 6, '2024-11-05 15:41:30'),
                                                                            (3, 6, '2024-11-05 15:41:35'),
                                                                            (4, 6, '2024-11-05 15:50:28'),
                                                                            (5, 6, '2024-11-05 15:50:28'),
                                                                            (6, 6, '2024-11-05 15:50:29'),
                                                                            (7, 6, '2024-11-05 15:50:29'),
                                                                            (8, 6, '2024-11-05 15:50:30'),
                                                                            (9, 6, '2024-11-05 23:02:33'),
                                                                            (10, 6, '2024-11-05 23:02:34'),
                                                                            (11, 6, '2024-11-05 23:02:34'),
                                                                            (12, 1, '2024-11-05 23:02:38'),
                                                                            (13, 1, '2024-11-05 23:02:39'),
                                                                            (14, 1, '2024-11-05 23:02:42'),
                                                                            (15, 1, '2024-11-05 23:02:46'),
                                                                            (16, 5, '2024-11-05 23:02:49'),
                                                                            (17, 5, '2024-11-05 23:02:50'),
                                                                            (18, 5, '2024-11-05 23:02:51'),
                                                                            (19, 6, '2024-11-05 23:02:54'),
                                                                            (20, 6, '2024-11-11 18:08:28'),
                                                                            (21, 6, '2024-11-11 18:08:37'),
                                                                            (22, 6, '2024-11-11 18:08:38'),
                                                                            (23, 6, '2024-11-11 18:08:38'),
                                                                            (24, 6, '2024-11-11 18:08:39'),
                                                                            (25, 6, '2024-11-11 18:08:45'),
                                                                            (26, 5, '2024-11-11 18:08:52'),
                                                                            (27, 1, '2024-11-11 18:08:57'),
                                                                            (28, 1, '2024-11-11 18:08:58'),
                                                                            (29, 1, '2024-11-11 18:08:59'),
                                                                            (30, 1, '2024-11-11 18:09:46'),
                                                                            (31, 1, '2024-11-11 18:09:55'),
                                                                            (32, 1, '2024-11-11 18:09:56'),
                                                                            (33, 1, '2024-11-11 18:09:57'),
                                                                            (34, 1, '2024-11-11 18:09:58'),
                                                                            (35, 1, '2024-11-11 18:09:59'),
                                                                            (36, 1, '2024-11-11 18:09:59'),
                                                                            (37, 3, '2024-11-11 18:26:47'),
                                                                            (38, 3, '2024-11-11 18:26:49'),
                                                                            (39, 3, '2024-11-11 18:26:50'),
                                                                            (40, 3, '2024-11-11 18:50:51'),
                                                                            (41, 6, '2024-11-11 18:50:55'),
                                                                            (42, 6, '2024-11-11 18:50:57'),
                                                                            (43, 6, '2024-11-11 18:50:58'),
                                                                            (44, 6, '2024-11-12 17:56:25'),
                                                                            (45, 1, '2024-11-12 17:56:39'),
                                                                            (46, 1, '2024-11-12 17:56:39'),
                                                                            (47, 11, '2024-11-12 17:56:45'),
                                                                            (48, 11, '2024-11-12 17:56:46'),
                                                                            (49, 11, '2024-11-12 17:56:47'),
                                                                            (50, 11, '2024-11-12 17:56:47'),
                                                                            (51, 5, '2024-11-12 17:56:52'),
                                                                            (52, 5, '2024-11-12 17:56:52'),
                                                                            (53, 6, '2024-11-12 17:56:58'),
                                                                            (54, 1, '2024-11-13 17:46:51'),
                                                                            (55, 1, '2024-11-13 17:46:52'),
                                                                            (56, 6, '2024-11-13 17:46:56'),
                                                                            (57, 6, '2024-11-13 17:46:57'),
                                                                            (58, 1, '2024-11-13 17:47:01'),
                                                                            (59, 1, '2024-11-13 17:47:02'),
                                                                            (60, 1, '2024-11-13 17:47:14'),
                                                                            (61, 1, '2024-11-13 17:47:15'),
                                                                            (62, 6, '2024-11-13 17:47:20'),
                                                                            (63, 6, '2024-11-13 17:47:21'),
                                                                            (64, 6, '2024-11-13 17:47:22'),
                                                                            (65, 11, '2024-11-13 17:47:27'),
                                                                            (66, 11, '2024-11-13 17:47:27'),
                                                                            (67, 11, '2024-11-13 17:47:28'),
                                                                            (68, 11, '2024-11-13 17:47:28'),
                                                                            (69, 11, '2024-11-13 17:47:29'),
                                                                            (70, 1, '2024-11-13 17:47:35'),
                                                                            (71, 3, '2024-11-26 23:18:39'),
                                                                            (72, 3, '2024-11-26 23:18:43'),
                                                                            (73, 3, '2024-11-26 23:18:44'),
                                                                            (74, 3, '2024-11-26 23:18:46'),
                                                                            (75, 3, '2024-11-26 23:18:46'),
                                                                            (76, 3, '2024-11-26 23:18:47'),
                                                                            (77, 3, '2024-11-26 23:18:47'),
                                                                            (78, 3, '2024-11-26 23:18:47'),
                                                                            (79, 3, '2024-11-26 23:18:48'),
                                                                            (80, 3, '2024-11-26 23:19:04'),
                                                                            (81, 3, '2024-11-26 23:19:05'),
                                                                            (82, 3, '2024-11-26 23:19:06'),
                                                                            (83, 3, '2024-11-26 23:19:07'),
                                                                            (84, 3, '2024-11-26 23:19:07'),
                                                                            (85, 3, '2024-11-26 23:19:10'),
                                                                            (86, 3, '2024-11-26 23:19:10'),
                                                                            (87, 6, '2024-11-26 23:19:14'),
                                                                            (88, 6, '2024-11-26 23:19:15'),
                                                                            (89, 6, '2024-11-26 23:19:15'),
                                                                            (90, 6, '2024-11-26 23:19:16'),
                                                                            (91, 6, '2024-11-26 23:19:16'),
                                                                            (92, 6, '2024-11-26 23:19:16'),
                                                                            (93, 6, '2024-11-26 23:19:17'),
                                                                            (94, 1, '2024-11-26 23:19:21'),
                                                                            (95, 1, '2024-11-26 23:19:21'),
                                                                            (96, 1, '2024-11-26 23:19:21'),
                                                                            (97, 5, '2024-11-26 23:19:25'),
                                                                            (98, 5, '2024-11-26 23:19:25'),
                                                                            (99, 5, '2024-11-26 23:19:26'),
                                                                            (100, 5, '2024-11-26 23:19:27'),
                                                                            (101, 5, '2024-11-26 23:19:27'),
                                                                            (102, 5, '2024-11-26 23:19:28'),
                                                                            (103, 5, '2024-11-26 23:19:28'),
                                                                            (104, 5, '2024-11-26 23:19:28'),
                                                                            (105, 5, '2024-11-26 23:19:29'),
                                                                            (106, 5, '2024-11-26 23:19:29'),
                                                                            (107, 5, '2024-11-26 23:19:29'),
                                                                            (108, 6, '2024-11-26 23:19:33'),
                                                                            (109, 6, '2024-11-26 23:19:34'),
                                                                            (110, 6, '2024-11-26 23:19:34'),
                                                                            (111, 6, '2024-11-26 23:19:35'),
                                                                            (112, 6, '2024-11-26 23:19:35'),
                                                                            (113, 6, '2024-11-26 23:19:36'),
                                                                            (114, 6, '2024-11-26 23:19:37'),
                                                                            (115, 6, '2024-11-26 23:19:37'),
                                                                            (116, 6, '2024-11-26 23:19:39'),
                                                                            (117, 6, '2024-11-26 23:19:39'),
                                                                            (118, 6, '2024-11-26 23:19:40'),
                                                                            (119, 6, '2024-11-26 23:19:40'),
                                                                            (120, 6, '2024-11-26 23:19:41'),
                                                                            (121, 6, '2024-11-26 23:19:41'),
                                                                            (122, 6, '2024-11-26 23:19:41'),
                                                                            (123, 6, '2024-11-26 23:19:42'),
                                                                            (124, 6, '2024-11-26 23:19:42'),
                                                                            (125, 6, '2024-11-26 23:19:42'),
                                                                            (126, 6, '2024-11-26 23:19:43'),
                                                                            (127, 6, '2024-11-26 23:19:44'),
                                                                            (128, 6, '2024-11-26 23:19:45'),
                                                                            (129, 6, '2024-11-26 23:19:45'),
                                                                            (130, 6, '2024-11-26 23:19:45'),
                                                                            (131, 6, '2024-11-26 23:19:46'),
                                                                            (132, 6, '2024-11-26 23:19:47'),
                                                                            (133, 11, '2024-11-26 23:23:25'),
                                                                            (134, 11, '2024-11-26 23:23:26'),
                                                                            (135, 11, '2024-11-26 23:23:27'),
                                                                            (136, 11, '2024-11-26 23:23:27'),
                                                                            (137, 11, '2024-11-26 23:23:28'),
                                                                            (138, 11, '2024-11-26 23:23:28'),
                                                                            (139, 11, '2024-11-26 23:23:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
                         `user_id` int UNSIGNED NOT NULL,
                         `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                         `email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                         `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                         `totp_secret_key` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                         `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
                         `disabled` bit(1) NOT NULL DEFAULT b'0',
                         `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `totp_secret_key`, `description`, `created_at`, `updated_at`) VALUES
                                                                                                                                               (1, 'Nebalus', 'contact@nebalus.dev', '$2y$10$9xaR/88aZteW49ExqqveWe6O./RkNfrAj3tSNGPCc/keJsT95EcEu', 'S61WXXWZU5J6QT0H4CX4B02X2HET0LYW', 'Is the default test User', '2024-02-28 21:28:40', '2024-08-03 23:07:10'),
                                                                                                                                               (2, 'Tester', 'tester@nebalus.dev', '', '5BO8E403VD95MT6XCHWFXOKP8LZCGRKY', 'Password = Tester42', '2024-11-07 07:56:33', '2024-11-07 07:56:33'),
                                                                                                                                               (3, 'BannedTester', 'bannedtester@nebalus.dev', '', 'DXUZV74K66YCFV4E9WD9T9G4TYO6SWH7', 'Password = BAnnedTester11', '2024-11-07 08:07:04', '2024-11-07 08:07:04'),
                                                                                                                                               (4, 'disabledbitch', 'disabledbitch@nebalus.dev', '', '5VX7YY1UH0U4DECIJHB1AY6PHL6IGHKP', 'Password = TEST1234!', '2024-11-11 18:31:01', '2024-11-11 18:31:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_login_history`
--

CREATE TABLE `user_login_history` (
                                      `login_history_id` int UNSIGNED NOT NULL,
                                      `user_id` int UNSIGNED NOT NULL,
                                      `ip_address` tinyblob NOT NULL,
                                      `success` bit(1) NOT NULL DEFAULT b'0',
                                      `user_agent` text NOT NULL,
                                      `happend_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_login_history`
--

INSERT INTO `user_login_history` (`login_history_id`, `user_id`, `ip_address`, `success`, `user_agent`, `happend_at`) VALUES
                                                                                                                          (2, 1, 0x32313330373036343333, b'1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36', '2024-11-07 08:02:42'),
                                                                                                                          (3, 2, 0x31383737343331383433, b'1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:97.0) Gecko/20100101 Firefox/97.0', '2024-11-07 08:17:36'),
                                                                                                                          (4, 1, 0x30, b'0', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36', '2024-11-12 08:17:37'),
                                                                                                                          (5, 1, 0x33323332323336303037, b'1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36', '2024-10-08 08:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
                                    `user_id` int UNSIGNED NOT NULL,
                                    `access_level` enum('ADMINISTRATOR','USER') NOT NULL DEFAULT 'USER',
                                    `permissions` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
    ADD PRIMARY KEY (`account_id`),
    ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `account_invitation_tokens`
--
ALTER TABLE `account_invitation_tokens`
    ADD PRIMARY KEY (`token_field_1`,`token_field_2`,`token_field_3`,`token_field_4`,`token_checksum`) USING BTREE,
    ADD UNIQUE KEY `invited_user_id` (`invited_account_id`),
    ADD KEY `owner_user_id` (`owner_account_id`);

--
-- Indexes for table `account_punishments`
--
ALTER TABLE `account_punishments`
    ADD PRIMARY KEY (`punishment_id`),
    ADD KEY `punished_user_id` (`punished_account_id`),
    ADD KEY `moderator_user_id` (`moderator_account_id`);

--
-- Indexes for table `linktrees`
--
ALTER TABLE `linktrees`
    ADD PRIMARY KEY (`linktree_id`),
    ADD UNIQUE KEY `account` (`user_id`);

--
-- Indexes for table `linktree_clicks`
--
ALTER TABLE `linktree_clicks`
    ADD PRIMARY KEY (`click_id`),
    ADD KEY `analytics_linktree_clicks_ibfk_1` (`linktree_id`);

--
-- Indexes for table `linktree_entrys`
--
ALTER TABLE `linktree_entrys`
    ADD PRIMARY KEY (`linktree_entry_id`),
    ADD UNIQUE KEY `linktree_id` (`linktree_id`,`display_order`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
    ADD PRIMARY KEY (`referral_id`),
    ADD UNIQUE KEY `refcode` (`code`) USING BTREE,
    ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `referral_clicks`
--
ALTER TABLE `referral_clicks`
    ADD PRIMARY KEY (`click_id`),
    ADD KEY `referral_id` (`referral_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`user_id`),
    ADD UNIQUE KEY `email` (`email`),
    ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_login_history`
--
ALTER TABLE `user_login_history`
    ADD PRIMARY KEY (`login_history_id`),
    ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
    ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
    MODIFY `account_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `account_punishments`
--
ALTER TABLE `account_punishments`
    MODIFY `punishment_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `linktrees`
--
ALTER TABLE `linktrees`
    MODIFY `linktree_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `linktree_clicks`
--
ALTER TABLE `linktree_clicks`
    MODIFY `click_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `linktree_entrys`
--
ALTER TABLE `linktree_entrys`
    MODIFY `linktree_entry_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
    MODIFY `referral_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `referral_clicks`
--
ALTER TABLE `referral_clicks`
    MODIFY `click_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_login_history`
--
ALTER TABLE `user_login_history`
    MODIFY `login_history_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
    ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Constraints for table `account_invitation_tokens`
--
ALTER TABLE `account_invitation_tokens`
    ADD CONSTRAINT `account_invitation_tokens_ibfk_2` FOREIGN KEY (`invited_account_id`) REFERENCES `accounts` (`account_id`) ON UPDATE RESTRICT,
    ADD CONSTRAINT `account_invitation_tokens_ibfk_3` FOREIGN KEY (`owner_account_id`) REFERENCES `accounts` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `account_punishments`
--
ALTER TABLE `account_punishments`
    ADD CONSTRAINT `account_punishments_ibfk_1` FOREIGN KEY (`punished_account_id`) REFERENCES `accounts` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    ADD CONSTRAINT `account_punishments_ibfk_2` FOREIGN KEY (`moderator_account_id`) REFERENCES `accounts` (`account_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `linktrees`
--
ALTER TABLE `linktrees`
    ADD CONSTRAINT `linktrees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `linktree_clicks`
--
ALTER TABLE `linktree_clicks`
    ADD CONSTRAINT `linktree_clicks_ibfk_1` FOREIGN KEY (`linktree_id`) REFERENCES `linktrees` (`linktree_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `linktree_entrys`
--
ALTER TABLE `linktree_entrys`
    ADD CONSTRAINT `linktree_entrys_ibfk_1` FOREIGN KEY (`linktree_id`) REFERENCES `linktrees` (`linktree_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `referrals`
--
ALTER TABLE `referrals`
    ADD CONSTRAINT `referrals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `referral_clicks`
--
ALTER TABLE `referral_clicks`
    ADD CONSTRAINT `referral_clicks_ibfk_1` FOREIGN KEY (`referral_id`) REFERENCES `referrals` (`referral_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `user_login_history`
--
ALTER TABLE `user_login_history`
    ADD CONSTRAINT `user_login_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
    ADD CONSTRAINT `user_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;