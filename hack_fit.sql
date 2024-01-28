/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `hack_fit` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hack_fit`;

CREATE TABLE IF NOT EXISTS `admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_config_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `admin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_config` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;
INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
	(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
	(2, 0, 6, 'Admin', 'fa-tasks', '', NULL, NULL, '2024-01-23 15:59:42'),
	(3, 2, 7, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2024-01-23 15:59:42'),
	(4, 2, 8, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2024-01-23 15:59:42'),
	(5, 2, 9, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2024-01-23 15:59:42'),
	(6, 2, 10, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2024-01-23 15:59:42'),
	(7, 2, 11, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2024-01-23 15:59:42'),
	(8, 0, 12, 'Config', 'fa-toggle-on', 'config', NULL, '2024-01-21 05:34:13', '2024-01-23 15:59:42'),
	(9, 0, 14, 'Helpers', 'fa-gears', '', NULL, '2024-01-21 05:35:22', '2024-01-23 15:59:42'),
	(10, 9, 15, 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', NULL, '2024-01-21 05:35:22', '2024-01-23 15:59:42'),
	(11, 9, 16, 'Database terminal', 'fa-database', 'helpers/terminal/database', NULL, '2024-01-21 05:35:22', '2024-01-23 15:59:42'),
	(12, 9, 17, 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', NULL, '2024-01-21 05:35:22', '2024-01-23 15:59:42'),
	(13, 9, 18, 'Routes', 'fa-list-alt', 'helpers/routes', NULL, '2024-01-21 05:35:22', '2024-01-23 15:59:42'),
	(14, 0, 13, 'Log Viewer', 'fa-bars', 'log-viewer', NULL, '2024-01-21 05:38:49', '2024-01-23 15:59:42'),
	(15, 0, 3, 'Units', 'fa-balance-scale', '/units', NULL, '2024-01-23 15:52:08', '2024-01-23 15:59:42'),
	(16, 0, 2, 'Time Slots', 'fa-calendar-times-o', '/time-slots', NULL, '2024-01-23 15:54:45', '2024-01-23 15:59:42'),
	(17, 0, 4, 'Meal Categories', 'fa-sticky-note', '/meal-categories', NULL, '2024-01-23 15:58:06', '2024-01-23 15:59:42'),
	(18, 0, 5, 'Food Items', 'fa-apple', '/food-items', NULL, '2024-01-23 15:59:07', '2024-01-23 15:59:42');
/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
	(1, 1, 'admin', 'GET', '::1', '[]', '2024-01-21 05:34:59', '2024-01-21 05:34:59'),
	(2, 1, 'admin', 'GET', '::1', '[]', '2024-01-21 05:35:26', '2024-01-21 05:35:26'),
	(3, 1, 'admin', 'GET', '::1', '[]', '2024-01-21 05:37:36', '2024-01-21 05:37:36'),
	(4, 1, 'admin/auth/menu', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-21 05:37:40', '2024-01-21 05:37:40'),
	(5, 1, 'admin/auth/menu', 'POST', '::1', '{"parent_id":"0","title":"Log Viewer","icon":"fa-bars","uri":"log-viewer","roles":["1",null],"permission":null,"_token":"Q3UovQxMzPfLalA2SNAxKJv827DcXSqyEPMydqN8"}', '2024-01-21 05:38:49', '2024-01-21 05:38:49'),
	(6, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2024-01-21 05:38:49', '2024-01-21 05:38:49'),
	(7, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2024-01-21 05:38:52', '2024-01-21 05:38:52'),
	(8, 1, 'admin/auth/menu', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-21 05:38:54', '2024-01-21 05:38:54'),
	(9, 1, 'admin/auth/menu', 'POST', '::1', '{"_token":"Q3UovQxMzPfLalA2SNAxKJv827DcXSqyEPMydqN8","_order":"[{\\"id\\":1},{\\"id\\":2,\\"children\\":[{\\"id\\":3},{\\"id\\":4},{\\"id\\":5},{\\"id\\":6},{\\"id\\":7}]},{\\"id\\":8},{\\"id\\":14},{\\"id\\":9,\\"children\\":[{\\"id\\":10},{\\"id\\":11},{\\"id\\":12},{\\"id\\":13}]}]"}', '2024-01-21 05:39:26', '2024-01-21 05:39:26'),
	(10, 1, 'admin/auth/menu', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-21 05:39:27', '2024-01-21 05:39:27'),
	(11, 1, 'admin/auth/menu', 'POST', '::1', '{"_token":"Q3UovQxMzPfLalA2SNAxKJv827DcXSqyEPMydqN8","_order":"[{\\"id\\":1},{\\"id\\":2,\\"children\\":[{\\"id\\":3},{\\"id\\":4},{\\"id\\":5},{\\"id\\":6},{\\"id\\":7}]},{\\"id\\":8},{\\"id\\":14},{\\"id\\":9,\\"children\\":[{\\"id\\":10},{\\"id\\":11},{\\"id\\":12},{\\"id\\":13}]}]"}', '2024-01-21 05:39:27', '2024-01-21 05:39:27'),
	(12, 1, 'admin/auth/menu', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-21 05:39:28', '2024-01-21 05:39:28'),
	(13, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2024-01-21 05:39:28', '2024-01-21 05:39:28'),
	(14, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2024-01-21 05:41:00', '2024-01-21 05:41:00'),
	(15, 1, 'admin', 'GET', '::1', '[]', '2024-01-21 12:02:14', '2024-01-21 12:02:14'),
	(16, 1, 'admin/auth/logout', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-21 12:02:22', '2024-01-21 12:02:22'),
	(17, 1, 'admin', 'GET', '::1', '[]', '2024-01-21 12:02:35', '2024-01-21 12:02:35'),
	(18, 1, 'admin', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-21 12:02:38', '2024-01-21 12:02:38'),
	(19, 1, 'admin/helpers/scaffold', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-21 12:02:44', '2024-01-21 12:02:44'),
	(20, 1, 'admin', 'GET', '::1', '[]', '2024-01-23 10:19:03', '2024-01-23 10:19:03'),
	(21, 1, 'admin/helpers/scaffold', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 10:19:13', '2024-01-23 10:19:13'),
	(22, 1, 'admin', 'GET', '::1', '[]', '2024-01-23 11:58:51', '2024-01-23 11:58:51'),
	(23, 1, 'admin', 'GET', '::1', '[]', '2024-01-23 15:00:17', '2024-01-23 15:00:17'),
	(24, 1, 'admin', 'GET', '::1', '[]', '2024-01-23 15:49:11', '2024-01-23 15:49:11'),
	(25, 1, 'admin', 'GET', '::1', '[]', '2024-01-23 15:49:39', '2024-01-23 15:49:39'),
	(26, 1, 'admin/units', 'GET', '::1', '[]', '2024-01-23 15:49:53', '2024-01-23 15:49:53'),
	(27, 1, 'admin/units/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 15:50:00', '2024-01-23 15:50:00'),
	(28, 1, 'admin/units', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 15:50:08', '2024-01-23 15:50:08'),
	(29, 1, 'admin/auth/menu', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 15:50:42', '2024-01-23 15:50:42'),
	(30, 1, 'admin/auth/menu', 'POST', '::1', '{"parent_id":"0","title":"Units","icon":"fa-balance-scale","uri":"\\/units","roles":[null],"permission":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 15:52:07', '2024-01-23 15:52:07'),
	(31, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2024-01-23 15:52:08', '2024-01-23 15:52:08'),
	(32, 1, 'admin/auth/menu', 'POST', '::1', '{"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt","_order":"[{\\"id\\":1},{\\"id\\":15},{\\"id\\":2,\\"children\\":[{\\"id\\":3},{\\"id\\":4},{\\"id\\":5},{\\"id\\":6},{\\"id\\":7}]},{\\"id\\":8},{\\"id\\":14},{\\"id\\":9,\\"children\\":[{\\"id\\":10},{\\"id\\":11},{\\"id\\":12},{\\"id\\":13}]}]"}', '2024-01-23 15:52:18', '2024-01-23 15:52:18'),
	(33, 1, 'admin/auth/menu', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 15:52:19', '2024-01-23 15:52:19'),
	(34, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2024-01-23 15:52:24', '2024-01-23 15:52:24'),
	(35, 1, 'admin/units', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 15:52:26', '2024-01-23 15:52:26'),
	(36, 1, 'admin/auth/menu', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 15:53:51', '2024-01-23 15:53:51'),
	(37, 1, 'admin/auth/menu', 'POST', '::1', '{"parent_id":"0","title":"Time Slots","icon":"fa-calendar-times-o","uri":"\\/time-slots","roles":[null],"permission":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 15:54:45', '2024-01-23 15:54:45'),
	(38, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2024-01-23 15:54:46', '2024-01-23 15:54:46'),
	(39, 1, 'admin/auth/menu', 'POST', '::1', '{"parent_id":"0","title":"Meal Categories","icon":"fa-sticky-note","uri":"\\/meal-categories","roles":[null],"permission":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 15:58:06', '2024-01-23 15:58:06'),
	(40, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2024-01-23 15:58:07', '2024-01-23 15:58:07'),
	(41, 1, 'admin/auth/menu', 'POST', '::1', '{"parent_id":"0","title":"Food Items","icon":"fa-apple","uri":"\\/food-iems","roles":[null],"permission":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 15:59:06', '2024-01-23 15:59:06'),
	(42, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2024-01-23 15:59:07', '2024-01-23 15:59:07'),
	(43, 1, 'admin/auth/menu/18/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 15:59:12', '2024-01-23 15:59:12'),
	(44, 1, 'admin/auth/menu/18', 'PUT', '::1', '{"parent_id":"0","title":"Food Items","icon":"fa-apple","uri":"\\/food-items","roles":[null],"permission":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt","_method":"PUT","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/auth\\/menu"}', '2024-01-23 15:59:19', '2024-01-23 15:59:19'),
	(45, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2024-01-23 15:59:19', '2024-01-23 15:59:19'),
	(46, 1, 'admin/auth/menu', 'POST', '::1', '{"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt","_order":"[{\\"id\\":1},{\\"id\\":16},{\\"id\\":15},{\\"id\\":17},{\\"id\\":18},{\\"id\\":2,\\"children\\":[{\\"id\\":3},{\\"id\\":4},{\\"id\\":5},{\\"id\\":6},{\\"id\\":7}]},{\\"id\\":8},{\\"id\\":14},{\\"id\\":9,\\"children\\":[{\\"id\\":10},{\\"id\\":11},{\\"id\\":12},{\\"id\\":13}]}]"}', '2024-01-23 15:59:42', '2024-01-23 15:59:42'),
	(47, 1, 'admin/auth/menu', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 15:59:43', '2024-01-23 15:59:43'),
	(48, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2024-01-23 15:59:46', '2024-01-23 15:59:46'),
	(49, 1, 'admin/time-slots', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 15:59:54', '2024-01-23 15:59:54'),
	(50, 1, 'admin/units', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 15:59:56', '2024-01-23 15:59:56'),
	(51, 1, 'admin/meal-categories', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 15:59:58', '2024-01-23 15:59:58'),
	(52, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:00:00', '2024-01-23 16:00:00'),
	(53, 1, 'admin/units', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:00:11', '2024-01-23 16:00:11'),
	(54, 1, 'admin/units/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:00:13', '2024-01-23 16:00:13'),
	(55, 1, 'admin/time-slots', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:00:15', '2024-01-23 16:00:15'),
	(56, 1, 'admin/time-slots/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:00:17', '2024-01-23 16:00:17'),
	(57, 1, 'admin/time-slots', 'POST', '::1', '{"name":null,"time_frame":null,"status":"on","remarks":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/time-slots"}', '2024-01-23 16:00:26', '2024-01-23 16:00:26'),
	(58, 1, 'admin/time-slots/create', 'GET', '::1', '[]', '2024-01-23 16:00:27', '2024-01-23 16:00:27'),
	(59, 1, 'admin/units', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:00:38', '2024-01-23 16:00:38'),
	(60, 1, 'admin/units/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:00:40', '2024-01-23 16:00:40'),
	(61, 1, 'admin/units', 'POST', '::1', '{"name":null,"status":"on","remarks":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/units"}', '2024-01-23 16:00:42', '2024-01-23 16:00:42'),
	(62, 1, 'admin/units/create', 'GET', '::1', '[]', '2024-01-23 16:00:43', '2024-01-23 16:00:43'),
	(63, 1, 'admin/meal-categories', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:00:51', '2024-01-23 16:00:51'),
	(64, 1, 'admin/meal-categories/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:00:54', '2024-01-23 16:00:54'),
	(65, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:01:06', '2024-01-23 16:01:06'),
	(66, 1, 'admin/food-items/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:01:08', '2024-01-23 16:01:08'),
	(67, 1, 'admin/time-slots', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:01:22', '2024-01-23 16:01:22'),
	(68, 1, 'admin/time-slots/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:01:26', '2024-01-23 16:01:26'),
	(69, 1, 'admin/time-slots/create', 'GET', '::1', '[]', '2024-01-23 16:04:58', '2024-01-23 16:04:58'),
	(70, 1, 'admin/time-slots', 'POST', '::1', '{"name":null,"time_frame":null,"status":"on","remarks":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 16:05:02', '2024-01-23 16:05:02'),
	(71, 1, 'admin/time-slots/create', 'GET', '::1', '[]', '2024-01-23 16:05:03', '2024-01-23 16:05:03'),
	(72, 1, 'admin/time-slots/create', 'GET', '::1', '[]', '2024-01-23 16:05:50', '2024-01-23 16:05:50'),
	(73, 1, 'admin/time-slots', 'POST', '::1', '{"name":null,"time_frame":null,"status":"on","remarks":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 16:05:53', '2024-01-23 16:05:53'),
	(74, 1, 'admin/time-slots/create', 'GET', '::1', '[]', '2024-01-23 16:05:54', '2024-01-23 16:05:54'),
	(75, 1, 'admin/time-slots', 'POST', '::1', '{"name":"Breakfast","time_frame":"8am - 9am","status":"on","remarks":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 16:06:32', '2024-01-23 16:06:32'),
	(76, 1, 'admin/time-slots', 'GET', '::1', '[]', '2024-01-23 16:06:33', '2024-01-23 16:06:33'),
	(77, 1, 'admin/time-slots/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:06:37', '2024-01-23 16:06:37'),
	(78, 1, 'admin/time-slots', 'POST', '::1', '{"name":"Breakfast","time_frame":null,"status":"on","remarks":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/time-slots"}', '2024-01-23 16:06:47', '2024-01-23 16:06:47'),
	(79, 1, 'admin/time-slots/create', 'GET', '::1', '[]', '2024-01-23 16:06:48', '2024-01-23 16:06:48'),
	(80, 1, 'admin/time-slots/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:06:53', '2024-01-23 16:06:53'),
	(81, 1, 'admin/time-slots', 'POST', '::1', '{"name":"Lunch","time_frame":"2pm - 3pm","status":"on","remarks":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 16:07:23', '2024-01-23 16:07:23'),
	(82, 1, 'admin/time-slots', 'GET', '::1', '[]', '2024-01-23 16:07:24', '2024-01-23 16:07:24'),
	(83, 1, 'admin/time-slots/2/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:07:27', '2024-01-23 16:07:27'),
	(84, 1, 'admin/time-slots/2', 'PUT', '::1', '{"name":"Breakfast","time_frame":"2pm - 3pm","status":"on","remarks":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt","_method":"PUT","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/time-slots"}', '2024-01-23 16:07:43', '2024-01-23 16:07:43'),
	(85, 1, 'admin/time-slots/2/edit', 'GET', '::1', '[]', '2024-01-23 16:07:44', '2024-01-23 16:07:44'),
	(86, 1, 'admin/time-slots/2', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:08:41', '2024-01-23 16:08:41'),
	(87, 1, 'admin/time-slots/2', 'GET', '::1', '[]', '2024-01-23 16:10:14', '2024-01-23 16:10:14'),
	(88, 1, 'admin/time-slots', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:10:15', '2024-01-23 16:10:15'),
	(89, 1, 'admin/time-slots', 'GET', '::1', '[]', '2024-01-23 16:10:31', '2024-01-23 16:10:31'),
	(90, 1, 'admin/time-slots', 'GET', '::1', '[]', '2024-01-23 16:10:46', '2024-01-23 16:10:46'),
	(91, 1, 'admin/units', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:32:43', '2024-01-23 16:32:43'),
	(92, 1, 'admin/units/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:32:46', '2024-01-23 16:32:46'),
	(93, 1, 'admin/units/create', 'GET', '::1', '[]', '2024-01-23 16:34:54', '2024-01-23 16:34:54'),
	(94, 1, 'admin/units', 'POST', '::1', '{"name":null,"status":"on","remarks":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 16:34:57', '2024-01-23 16:34:57'),
	(95, 1, 'admin/units/create', 'GET', '::1', '[]', '2024-01-23 16:34:58', '2024-01-23 16:34:58'),
	(96, 1, 'admin/units', 'POST', '::1', '{"name":"gm","status":"on","remarks":"servings per gm","_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 16:35:15', '2024-01-23 16:35:15'),
	(97, 1, 'admin/units', 'GET', '::1', '[]', '2024-01-23 16:35:15', '2024-01-23 16:35:15'),
	(98, 1, 'admin/units', 'GET', '::1', '[]', '2024-01-23 16:35:49', '2024-01-23 16:35:49'),
	(99, 1, 'admin/units', 'GET', '::1', '[]', '2024-01-23 16:38:42', '2024-01-23 16:38:42'),
	(100, 1, 'admin/meal-categories', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:38:44', '2024-01-23 16:38:44'),
	(101, 1, 'admin/meal-categories/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:38:47', '2024-01-23 16:38:47'),
	(102, 1, 'admin/meal-categories', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:38:59', '2024-01-23 16:38:59'),
	(103, 1, 'admin/time-slots', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:39:01', '2024-01-23 16:39:01'),
	(104, 1, 'admin/meal-categories', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:39:04', '2024-01-23 16:39:04'),
	(105, 1, 'admin/meal-categories/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:39:09', '2024-01-23 16:39:09'),
	(106, 1, 'admin/meal-categories/create', 'GET', '::1', '[]', '2024-01-23 16:41:48', '2024-01-23 16:41:48'),
	(107, 1, 'admin/meal-categories', 'POST', '::1', '{"name":null,"time_slot_id":null,"status":"on","remarks":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 16:41:50', '2024-01-23 16:41:50'),
	(108, 1, 'admin/meal-categories/create', 'GET', '::1', '[]', '2024-01-23 16:41:51', '2024-01-23 16:41:51'),
	(109, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:42:02', '2024-01-23 16:42:02'),
	(110, 1, 'admin/food-items/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:42:09', '2024-01-23 16:42:09'),
	(111, 1, 'admin/auth/setting', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:42:46', '2024-01-23 16:42:46'),
	(112, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2024-01-23 16:43:30', '2024-01-23 16:43:30'),
	(113, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2024-01-23 16:44:24', '2024-01-23 16:44:24'),
	(114, 1, 'admin/auth/setting', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:44:28', '2024-01-23 16:44:28'),
	(115, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2024-01-23 16:54:33', '2024-01-23 16:54:33'),
	(116, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-23 16:56:29', '2024-01-23 16:56:29'),
	(117, 1, 'admin/food-items/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 16:56:32', '2024-01-23 16:56:32'),
	(118, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 16:57:41', '2024-01-23 16:57:41'),
	(119, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 16:58:19', '2024-01-23 16:58:19'),
	(120, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:01:36', '2024-01-23 17:01:36'),
	(121, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:01:57', '2024-01-23 17:01:57'),
	(122, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:02:05', '2024-01-23 17:02:05'),
	(123, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:03:02', '2024-01-23 17:03:02'),
	(124, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:03:11', '2024-01-23 17:03:11'),
	(125, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:03:16', '2024-01-23 17:03:16'),
	(126, 1, 'admin/food-items', 'POST', '::1', '{"name":null,"unit_id":null,"protein":"0","carbs":"0","fat":"0","calories":"0","status":"on","remarks":null,"_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 17:03:19', '2024-01-23 17:03:19'),
	(127, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:03:20', '2024-01-23 17:03:20'),
	(128, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:04:28', '2024-01-23 17:04:28'),
	(129, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:04:37', '2024-01-23 17:04:37'),
	(130, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:04:48', '2024-01-23 17:04:48'),
	(131, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:04:56', '2024-01-23 17:04:56'),
	(132, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:09:22', '2024-01-23 17:09:22'),
	(133, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:11:21', '2024-01-23 17:11:21'),
	(134, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:11:25', '2024-01-23 17:11:25'),
	(135, 1, 'admin/units', 'GET', '::1', '[]', '2024-01-23 17:14:26', '2024-01-23 17:14:26'),
	(136, 1, 'admin/units/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 17:14:31', '2024-01-23 17:14:31'),
	(137, 1, 'admin/units', 'POST', '::1', '{"name":"pc","status":"on","remarks":"servings per piece","_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/units"}', '2024-01-23 17:14:46', '2024-01-23 17:14:46'),
	(138, 1, 'admin/units', 'GET', '::1', '[]', '2024-01-23 17:14:46', '2024-01-23 17:14:46'),
	(139, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:14:48', '2024-01-23 17:14:48'),
	(140, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:17:09', '2024-01-23 17:17:09'),
	(141, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:19:35', '2024-01-23 17:19:35'),
	(142, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:21:23', '2024-01-23 17:21:23'),
	(143, 1, 'admin/food-items', 'POST', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 17:23:42', '2024-01-23 17:23:42'),
	(144, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:23:43', '2024-01-23 17:23:43'),
	(145, 1, 'admin/food-items', 'POST', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 17:24:22', '2024-01-23 17:24:22'),
	(146, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:24:23', '2024-01-23 17:24:23'),
	(147, 1, 'admin/food-items', 'POST', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 17:30:34', '2024-01-23 17:30:34'),
	(148, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:30:35', '2024-01-23 17:30:35'),
	(149, 1, 'admin/food-items', 'POST', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt"}', '2024-01-23 17:32:39', '2024-01-23 17:32:39'),
	(150, 1, 'admin/food-items/create', 'GET', '::1', '[]', '2024-01-23 17:32:40', '2024-01-23 17:32:40'),
	(151, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-23 17:43:50', '2024-01-23 17:43:50'),
	(152, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-23 17:44:16', '2024-01-23 17:44:16'),
	(153, 1, 'admin/food-items/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 17:44:17', '2024-01-23 17:44:17'),
	(154, 1, 'admin/food-items', 'POST', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/food-items"}', '2024-01-23 17:45:07', '2024-01-23 17:45:07'),
	(155, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-23 17:45:07', '2024-01-23 17:45:07'),
	(156, 1, 'admin/food-items/1', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 17:45:17', '2024-01-23 17:45:17'),
	(157, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 17:45:20', '2024-01-23 17:45:20'),
	(158, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 17:46:55', '2024-01-23 17:46:55'),
	(159, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"YLV59ZqoTe2YOwV4FLJ1Zk6965oSsmJmqr36GTTt","_method":"PUT","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/food-items"}', '2024-01-23 17:47:07', '2024-01-23 17:47:07'),
	(160, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-23 17:47:08', '2024-01-23 17:47:08'),
	(161, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 17:47:56', '2024-01-23 17:47:56'),
	(162, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-23 17:47:57', '2024-01-23 17:47:57'),
	(163, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-23 17:48:00', '2024-01-23 17:48:00'),
	(164, 1, 'admin', 'GET', '::1', '[]', '2024-01-24 04:15:51', '2024-01-24 04:15:51'),
	(165, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:15:55', '2024-01-24 04:15:55'),
	(166, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:16:01', '2024-01-24 04:16:01'),
	(167, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:16:06', '2024-01-24 04:16:06'),
	(168, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:18:18', '2024-01-24 04:18:18'),
	(169, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:21:23', '2024-01-24 04:21:23'),
	(170, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:21:55', '2024-01-24 04:21:55'),
	(171, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:22:34', '2024-01-24 04:22:34'),
	(172, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:22:38', '2024-01-24 04:22:38'),
	(173, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"iOFwQYM3QrH8j0ksk7fmuSoQhWraCPZy0dOgnMOn","_method":"PUT","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/food-items"}', '2024-01-24 04:22:46', '2024-01-24 04:22:46'),
	(174, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:22:46', '2024-01-24 04:22:46'),
	(175, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:23:54', '2024-01-24 04:23:54'),
	(176, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:27:18', '2024-01-24 04:27:18'),
	(177, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:27:31', '2024-01-24 04:27:31'),
	(178, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:27:35', '2024-01-24 04:27:35'),
	(179, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:28:02', '2024-01-24 04:28:02'),
	(180, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:28:07', '2024-01-24 04:28:07'),
	(181, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 04:31:27', '2024-01-24 04:31:27'),
	(182, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:31:30', '2024-01-24 04:31:30'),
	(183, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:38:17', '2024-01-24 04:38:17'),
	(184, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:38:18', '2024-01-24 04:38:18'),
	(185, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:38:18', '2024-01-24 04:38:18'),
	(186, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:39:08', '2024-01-24 04:39:08'),
	(187, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:39:32', '2024-01-24 04:39:32'),
	(188, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:43:13', '2024-01-24 04:43:13'),
	(189, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:43:59', '2024-01-24 04:43:59'),
	(190, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:44:10', '2024-01-24 04:44:10'),
	(191, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:44:16', '2024-01-24 04:44:16'),
	(192, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:44:38', '2024-01-24 04:44:38'),
	(193, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:45:19', '2024-01-24 04:45:19'),
	(194, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:45:30', '2024-01-24 04:45:30'),
	(195, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:46:06', '2024-01-24 04:46:06'),
	(196, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:47:04', '2024-01-24 04:47:04'),
	(197, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:47:19', '2024-01-24 04:47:19'),
	(198, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:47:23', '2024-01-24 04:47:23'),
	(199, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:47:31', '2024-01-24 04:47:31'),
	(200, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:47:37', '2024-01-24 04:47:37'),
	(201, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:47:46', '2024-01-24 04:47:46'),
	(202, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:48:09', '2024-01-24 04:48:09'),
	(203, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:48:16', '2024-01-24 04:48:16'),
	(204, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 04:49:53', '2024-01-24 04:49:53'),
	(205, 1, 'admin/food-items/1', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:49:56', '2024-01-24 04:49:56'),
	(206, 1, 'admin/food-items/1', 'GET', '::1', '[]', '2024-01-24 04:51:18', '2024-01-24 04:51:18'),
	(207, 1, 'admin/food-items/1', 'GET', '::1', '[]', '2024-01-24 04:51:24', '2024-01-24 04:51:24'),
	(208, 1, 'admin/food-items/1', 'GET', '::1', '[]', '2024-01-24 04:51:40', '2024-01-24 04:51:40'),
	(209, 1, 'admin/food-items/1', 'GET', '::1', '[]', '2024-01-24 04:52:02', '2024-01-24 04:52:02'),
	(210, 1, 'admin/food-items/1', 'GET', '::1', '[]', '2024-01-24 04:52:10', '2024-01-24 04:52:10'),
	(211, 1, 'admin/food-items/1', 'GET', '::1', '[]', '2024-01-24 04:52:32', '2024-01-24 04:52:32'),
	(212, 1, 'admin/food-items/1', 'GET', '::1', '[]', '2024-01-24 04:52:45', '2024-01-24 04:52:45'),
	(213, 1, 'admin/food-items/1', 'GET', '::1', '[]', '2024-01-24 04:52:48', '2024-01-24 04:52:48'),
	(214, 1, 'admin/food-items/1', 'GET', '::1', '[]', '2024-01-24 04:52:48', '2024-01-24 04:52:48'),
	(215, 1, 'admin/food-items/1', 'GET', '::1', '[]', '2024-01-24 04:52:48', '2024-01-24 04:52:48'),
	(216, 1, 'admin/food-items/1', 'GET', '::1', '[]', '2024-01-24 04:52:58', '2024-01-24 04:52:58'),
	(217, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:53:05', '2024-01-24 04:53:05'),
	(218, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 04:53:09', '2024-01-24 04:53:09'),
	(219, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 04:55:34', '2024-01-24 04:55:34'),
	(220, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 04:55:43', '2024-01-24 04:55:43'),
	(221, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 04:57:34', '2024-01-24 04:57:34'),
	(222, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 04:58:10', '2024-01-24 04:58:10'),
	(223, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:00:26', '2024-01-24 05:00:26'),
	(224, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:00:37', '2024-01-24 05:00:37'),
	(225, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:00:46', '2024-01-24 05:00:46'),
	(226, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:01:09', '2024-01-24 05:01:09'),
	(227, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:01:13', '2024-01-24 05:01:13'),
	(228, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:01:52', '2024-01-24 05:01:52'),
	(229, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:01:57', '2024-01-24 05:01:57'),
	(230, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:04:36', '2024-01-24 05:04:36'),
	(231, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:04:38', '2024-01-24 05:04:38'),
	(232, 1, 'admin/food-items/1', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:04:42', '2024-01-24 05:04:42'),
	(233, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:06:34', '2024-01-24 05:06:34'),
	(234, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"iOFwQYM3QrH8j0ksk7fmuSoQhWraCPZy0dOgnMOn","_method":"PUT","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/food-items"}', '2024-01-24 05:06:43', '2024-01-24 05:06:43'),
	(235, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:06:44', '2024-01-24 05:06:44'),
	(236, 1, 'admin/food-items/1', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:06:49', '2024-01-24 05:06:49'),
	(237, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:06:52', '2024-01-24 05:06:52'),
	(238, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:06:55', '2024-01-24 05:06:55'),
	(239, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:07:14', '2024-01-24 05:07:14'),
	(240, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:17:28', '2024-01-24 05:17:28'),
	(241, 1, 'admin/food-items/1', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:17:36', '2024-01-24 05:17:36'),
	(242, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:17:40', '2024-01-24 05:17:40'),
	(243, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:21:42', '2024-01-24 05:21:42'),
	(244, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:21:43', '2024-01-24 05:21:43'),
	(245, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:24:23', '2024-01-24 05:24:23'),
	(246, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:24:42', '2024-01-24 05:24:42'),
	(247, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:24:53', '2024-01-24 05:24:53'),
	(248, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:24:58', '2024-01-24 05:24:58'),
	(249, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:25:16', '2024-01-24 05:25:16'),
	(250, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:26:37', '2024-01-24 05:26:37'),
	(251, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:26:43', '2024-01-24 05:26:43'),
	(252, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:26:52', '2024-01-24 05:26:52'),
	(253, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:32:49', '2024-01-24 05:32:49'),
	(254, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"UCvSRpehT9VhRt2pH40erX6jisLoOfAbZ2Nh3kCc","_method":"PUT","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/food-items"}', '2024-01-24 05:32:55', '2024-01-24 05:32:55'),
	(255, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:32:56', '2024-01-24 05:32:56'),
	(256, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:33:32', '2024-01-24 05:33:32'),
	(257, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"UCvSRpehT9VhRt2pH40erX6jisLoOfAbZ2Nh3kCc","_method":"PUT"}', '2024-01-24 05:33:39', '2024-01-24 05:33:39'),
	(258, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:33:40', '2024-01-24 05:33:40'),
	(259, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:35:11', '2024-01-24 05:35:11'),
	(260, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"UCvSRpehT9VhRt2pH40erX6jisLoOfAbZ2Nh3kCc","_method":"PUT"}', '2024-01-24 05:35:20', '2024-01-24 05:35:20'),
	(261, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:35:21', '2024-01-24 05:35:21'),
	(262, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:36:11', '2024-01-24 05:36:11'),
	(263, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:36:50', '2024-01-24 05:36:50'),
	(264, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:37:07', '2024-01-24 05:37:07'),
	(265, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:39:04', '2024-01-24 05:39:04'),
	(266, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:39:18', '2024-01-24 05:39:18'),
	(267, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"UCvSRpehT9VhRt2pH40erX6jisLoOfAbZ2Nh3kCc","_method":"PUT"}', '2024-01-24 05:39:22', '2024-01-24 05:39:22'),
	(268, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:39:22', '2024-01-24 05:39:22'),
	(269, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:40:06', '2024-01-24 05:40:06'),
	(270, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"UCvSRpehT9VhRt2pH40erX6jisLoOfAbZ2Nh3kCc","_method":"PUT","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/food-items"}', '2024-01-24 05:40:14', '2024-01-24 05:40:14'),
	(271, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:40:15', '2024-01-24 05:40:15'),
	(272, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:41:06', '2024-01-24 05:41:06'),
	(273, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"UCvSRpehT9VhRt2pH40erX6jisLoOfAbZ2Nh3kCc","_method":"PUT"}', '2024-01-24 05:41:12', '2024-01-24 05:41:12'),
	(274, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:41:12', '2024-01-24 05:41:12'),
	(275, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:43:09', '2024-01-24 05:43:09'),
	(276, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:43:43', '2024-01-24 05:43:43'),
	(277, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"UCvSRpehT9VhRt2pH40erX6jisLoOfAbZ2Nh3kCc","_method":"PUT"}', '2024-01-24 05:43:50', '2024-01-24 05:43:50'),
	(278, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:43:51', '2024-01-24 05:43:51'),
	(279, 1, 'admin/food-items/1', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:43:59', '2024-01-24 05:43:59'),
	(280, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:44:03', '2024-01-24 05:44:03'),
	(281, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:44:33', '2024-01-24 05:44:33'),
	(282, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"UCvSRpehT9VhRt2pH40erX6jisLoOfAbZ2Nh3kCc","_method":"PUT"}', '2024-01-24 05:44:38', '2024-01-24 05:44:38'),
	(283, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:44:39', '2024-01-24 05:44:39'),
	(284, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:44:42', '2024-01-24 05:44:42'),
	(285, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"UCvSRpehT9VhRt2pH40erX6jisLoOfAbZ2Nh3kCc","_method":"PUT","_previous_":"http:\\/\\/localhost\\/Fit\\/public\\/admin\\/food-items"}', '2024-01-24 05:45:04', '2024-01-24 05:45:04'),
	(286, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:45:04', '2024-01-24 05:45:04'),
	(287, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:45:13', '2024-01-24 05:45:13'),
	(288, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:47:18', '2024-01-24 05:47:18'),
	(289, 1, 'admin/food-items/1', 'PUT', '::1', '{"name":"Apple","unit_id":"2","unit_value":"1","protein":"0.36","carbs":"25","fat":"0.23","calories":"103.51","status":"on","remarks":null,"created_by":"1","_token":"UCvSRpehT9VhRt2pH40erX6jisLoOfAbZ2Nh3kCc","_method":"PUT"}', '2024-01-24 05:47:28', '2024-01-24 05:47:28'),
	(290, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 05:47:28', '2024-01-24 05:47:28'),
	(291, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:47:35', '2024-01-24 05:47:35'),
	(292, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:48:27', '2024-01-24 05:48:27'),
	(293, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:48:32', '2024-01-24 05:48:32'),
	(294, 1, 'admin/food-items/1/edit', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:48:35', '2024-01-24 05:48:35'),
	(295, 1, 'admin/food-items/1', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:48:38', '2024-01-24 05:48:38'),
	(296, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 05:49:21', '2024-01-24 05:49:21'),
	(297, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:52:50', '2024-01-24 05:52:50'),
	(298, 1, 'admin/meal-categories', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 05:53:19', '2024-01-24 05:53:19'),
	(299, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 06:00:50', '2024-01-24 06:00:50'),
	(300, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:00:51', '2024-01-24 06:00:51'),
	(301, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 06:00:52', '2024-01-24 06:00:52'),
	(302, 1, 'admin/food-items/1/edit', 'GET', '::1', '[]', '2024-01-24 06:01:05', '2024-01-24 06:01:05'),
	(303, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:01:09', '2024-01-24 06:01:09'),
	(304, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:01:09', '2024-01-24 06:01:09'),
	(305, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:01:17', '2024-01-24 06:01:17'),
	(306, 1, 'admin/meal-categories', 'GET', '::1', '[]', '2024-01-24 06:02:55', '2024-01-24 06:02:55'),
	(307, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:02:57', '2024-01-24 06:02:57'),
	(308, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:03:15', '2024-01-24 06:03:15'),
	(309, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:03:26', '2024-01-24 06:03:26'),
	(310, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:03:43', '2024-01-24 06:03:43'),
	(311, 1, 'admin/meal-categories', 'GET', '::1', '[]', '2024-01-24 06:04:16', '2024-01-24 06:04:16'),
	(312, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:04:17', '2024-01-24 06:04:17'),
	(313, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:07:20', '2024-01-24 06:07:20'),
	(314, 1, 'admin/meal-categories', 'GET', '::1', '[]', '2024-01-24 06:13:34', '2024-01-24 06:13:34'),
	(315, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:13:36', '2024-01-24 06:13:36'),
	(316, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:13:46', '2024-01-24 06:13:46'),
	(317, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:22:09', '2024-01-24 06:22:09'),
	(318, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:22:19', '2024-01-24 06:22:19'),
	(319, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:22:54', '2024-01-24 06:22:54'),
	(320, 1, 'admin/units/2', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:22:56', '2024-01-24 06:22:56'),
	(321, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:22:58', '2024-01-24 06:22:58'),
	(322, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:23:32', '2024-01-24 06:23:32'),
	(323, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:23:46', '2024-01-24 06:23:46'),
	(324, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:25:06', '2024-01-24 06:25:06'),
	(325, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:25:59', '2024-01-24 06:25:59'),
	(326, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:26:11', '2024-01-24 06:26:11'),
	(327, 1, 'admin/auth/users', 'GET', '::1', '[]', '2024-01-24 06:26:25', '2024-01-24 06:26:25'),
	(328, 1, 'admin/auth/users', 'GET', '::1', '[]', '2024-01-24 06:26:43', '2024-01-24 06:26:43'),
	(329, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:26:44', '2024-01-24 06:26:44'),
	(330, 1, 'admin/auth/users/1', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:26:45', '2024-01-24 06:26:45'),
	(331, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:26:47', '2024-01-24 06:26:47'),
	(332, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:26:53', '2024-01-24 06:26:53'),
	(333, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:26:56', '2024-01-24 06:26:56'),
	(334, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:27:05', '2024-01-24 06:27:05'),
	(335, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:29:20', '2024-01-24 06:29:20'),
	(336, 1, 'admin/food-items/1', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:29:23', '2024-01-24 06:29:23'),
	(337, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:29:32', '2024-01-24 06:29:32'),
	(338, 1, 'admin/auth/users', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:30:10', '2024-01-24 06:30:10'),
	(339, 1, 'admin/auth/roles', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:30:23', '2024-01-24 06:30:23'),
	(340, 1, 'admin/auth/permissions', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:30:26', '2024-01-24 06:30:26'),
	(341, 1, 'admin/helpers/routes', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:30:31', '2024-01-24 06:30:31'),
	(342, 1, 'admin/meal-categories', 'GET', '::1', '[]', '2024-01-24 06:32:24', '2024-01-24 06:32:24'),
	(343, 1, 'admin/helpers/routes', 'GET', '::1', '[]', '2024-01-24 06:32:25', '2024-01-24 06:32:25'),
	(344, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:32:29', '2024-01-24 06:32:29'),
	(345, 1, 'admin/food-items', 'GET', '::1', '[]', '2024-01-24 06:32:50', '2024-01-24 06:32:50'),
	(346, 1, 'admin/auth/users', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:32:58', '2024-01-24 06:32:58'),
	(347, 1, 'admin/time-slots', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:33:00', '2024-01-24 06:33:00'),
	(348, 1, 'admin/meal-categories', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:33:03', '2024-01-24 06:33:03'),
	(349, 1, 'admin/time-slots', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:33:04', '2024-01-24 06:33:04'),
	(350, 1, 'admin/units', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:33:06', '2024-01-24 06:33:06'),
	(351, 1, 'admin/units', 'GET', '::1', '[]', '2024-01-24 06:33:36', '2024-01-24 06:33:36'),
	(352, 1, 'admin/units', 'GET', '::1', '[]', '2024-01-24 06:33:55', '2024-01-24 06:33:55'),
	(353, 1, 'admin/time-slots', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:33:58', '2024-01-24 06:33:58'),
	(354, 1, 'admin/time-slots/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:34:00', '2024-01-24 06:34:00'),
	(355, 1, 'admin/time-slots', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:34:03', '2024-01-24 06:34:03'),
	(356, 1, 'admin/time-slots/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:34:05', '2024-01-24 06:34:05'),
	(357, 1, 'admin/time-slots', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:34:07', '2024-01-24 06:34:07'),
	(358, 1, 'admin/units', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:34:09', '2024-01-24 06:34:09'),
	(359, 1, 'admin/meal-categories', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:34:14', '2024-01-24 06:34:14'),
	(360, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:34:16', '2024-01-24 06:34:16'),
	(361, 1, 'admin/food-items/create', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:34:23', '2024-01-24 06:34:23'),
	(362, 1, 'admin/food-items', 'GET', '::1', '{"_pjax":"#pjax-container"}', '2024-01-24 06:34:39', '2024-01-24 06:34:39');
/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
	(1, 'All permission', '*', '', '*', NULL, NULL),
	(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
	(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
	(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
	(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
	(6, 'Admin Config', 'ext.config', '', '/config*', '2024-01-21 05:34:13', '2024-01-21 05:34:13'),
	(7, 'Admin helpers', 'ext.helpers', '', '/helpers/*', '2024-01-21 05:35:22', '2024-01-21 05:35:22');
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', 'administrator', '2024-01-21 05:26:06', '2024-01-21 05:26:06');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;
INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
	(1, 2, NULL, NULL),
	(1, 14, NULL, NULL);
/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;
INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL);
/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;
INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL);
/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '$2y$10$rolWjJo6mpbpSW1NhILTMOoSrOHV4MQoxnabJ7.pNE948T1pk6dYy', 'Administrator', NULL, 'XGaI5vxFhhCsSlfqdYYOXTu1rxIvuPYwcBYLOPikwoTCOkeBgwcjBfHl2cXU', '2024-01-21 05:26:06', '2024-01-21 05:26:06');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_user_permissions` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `failed_jobs` (
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

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `food_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` int(11) NOT NULL,
  `unit_value` decimal(16,2) NOT NULL DEFAULT '0.00',
  `protein` decimal(16,2) NOT NULL DEFAULT '0.00',
  `carbs` decimal(16,2) NOT NULL DEFAULT '0.00',
  `fat` decimal(16,2) NOT NULL DEFAULT '0.00',
  `calories` decimal(16,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_units_id` (`unit_id`),
  CONSTRAINT `fk_units_id` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `food_items` DISABLE KEYS */;
INSERT INTO `food_items` (`id`, `name`, `unit_id`, `unit_value`, `protein`, `carbs`, `fat`, `calories`, `status`, `remarks`, `image`, `thumbnail`, `created_by`, `created_at`, `updated_at`) VALUES
	(1, 'Apple', 2, 1.00, 0.36, 25.00, 0.23, 103.51, 1, NULL, 'images/photo-1621155346337-1d19476ba7d6.jpg', NULL, 1, '2024-01-23 17:45:07', '2024-01-24 05:47:28');
/*!40000 ALTER TABLE `food_items` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `meal_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_slot_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_time_slots_id` (`time_slot_id`),
  CONSTRAINT `fk_time_slots_id` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `meal_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal_categories` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_01_04_173148_create_admin_tables', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2017_07_17_040159_create_config_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `time_slots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_frame` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `time_slots` DISABLE KEYS */;
INSERT INTO `time_slots` (`id`, `name`, `time_frame`, `status`, `remarks`, `created_at`, `updated_at`) VALUES
	(1, 'Breakfast', '8am - 9am', 1, NULL, '2024-01-23 16:06:32', '2024-01-23 16:06:32'),
	(2, 'Lunch', '2pm - 3pm', 1, NULL, '2024-01-23 16:07:23', '2024-01-23 16:07:23');
/*!40000 ALTER TABLE `time_slots` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` (`id`, `name`, `status`, `remarks`, `created_at`, `updated_at`) VALUES
	(1, 'gm', 1, 'servings per gm', '2024-01-23 16:35:15', '2024-01-23 16:35:15'),
	(2, 'pc', 1, 'servings per piece', '2024-01-23 17:14:46', '2024-01-23 17:14:46');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
