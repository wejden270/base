-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.4.3 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage de la structure de table projet_pfe. admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.admins : ~0 rows (environ)
INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'rayhan', 'rayhan@gmail.com', NULL, '$2y$10$teVIkuF9c5FFv/cs6xZrmOAFwUXoyAeyt5dG4KwGCPaFrxZJMOzGS', NULL, '2025-04-17 19:59:32', '2025-04-17 19:59:32');

-- Listage de la structure de table projet_pfe. cars
CREATE TABLE IF NOT EXISTS `cars` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` bigint unsigned NOT NULL,
  `make` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` year NOT NULL,
  `license_plate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('disponible','en_mission','hors_service') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disponible',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cars_license_plate_unique` (`license_plate`),
  KEY `cars_driver_id_foreign` (`driver_id`),
  CONSTRAINT `cars_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.cars : ~4 rows (environ)
INSERT INTO `cars` (`id`, `driver_id`, `make`, `model`, `year`, `license_plate`, `current_location`, `status`, `created_at`, `updated_at`) VALUES
	(1, 2, 'renault', 'clio', '2010', '110TUN1463', NULL, 'disponible', '2025-04-18 10:52:29', '2025-04-18 10:52:29'),
	(2, 4, 'peugeot', '208', '1998', '96TUN2436', NULL, 'disponible', '2025-04-18 11:18:27', '2025-04-18 11:18:27'),
	(3, 3, 'toyota', 'corolla', '2020', '214TUN2395', NULL, 'disponible', '2025-04-18 11:20:28', '2025-04-18 11:20:28'),
	(4, 6, 'mercedes', 'aa', '1996', '90TUN1436', NULL, 'disponible', '2025-04-18 11:21:52', '2025-04-18 11:21:52'),
	(5, 1, 'renault', 'bbbb', '2019', '123TUN5268', NULL, 'disponible', '2025-04-18 11:22:52', '2025-04-18 11:22:52');

-- Listage de la structure de table projet_pfe. drivers
CREATE TABLE IF NOT EXISTS `drivers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_plate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('disponible','en mission') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disponible',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `drivers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.drivers : ~5 rows (environ)
INSERT INTO `drivers` (`id`, `name`, `email`, `fcm_token`, `password`, `latitude`, `longitude`, `phone`, `model`, `license_plate`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'wejden', 'wej@gmail.com', '', '$2y$10$OF6FKZZ2Kp6jxa2CdniEQu70GLma6f/Id9/niM4evEr35kmBS5Nu2', 33.8563917, 10.9557417, '52967146', 'mrcedes', '123TUN5268', 'disponible', '2025-04-17 20:00:59', '2025-04-22 14:24:39'),
	(2, 'jamila', 'jamila@gmail.com', NULL, '$2y$10$7oqlKwjc6QPiOtkMsUrISe0tlTvwFzSnNEGvCG2JdMx8R/Q9vuNme', 35.4758963, 10.6035247, '59361478', 'clio', '110TUN1463', 'disponible', '2025-04-17 20:01:45', '2025-04-18 11:19:28'),
	(3, 'wej', 'wej123@gmail.com', NULL, '$2y$10$p385YzXxFbTh4NPbyWeAVO2Y.f6rLuivxqhM0CtB22F.pEk5f5eZ2', 34.1200000, 11.2500000, '52963478', 'corolla', '214TUN2395', 'disponible', '2025-04-17 20:10:45', '2025-04-18 11:20:28'),
	(4, 'ahmed', 'ahmed@gmail.com', NULL, '$2y$10$veVh5TeWCTEljYyPF0hVEuib7KiXSJb85ypXhdPufR..yqIpSr5oq', NULL, NULL, '56987412', '208', '96TUN2436', 'disponible', '2025-04-17 22:00:01', '2025-04-18 11:18:27'),
	(6, 'mohamed', 'med@gmail.com', NULL, '$2y$10$rXAtFnovz/q4R6FddhGsY.pIvgNtJ86Hip985p4aPjZgbcC.HUwEe', NULL, NULL, '96325874', 'aa', '90TUN1436', 'disponible', '2025-04-17 22:09:50', '2025-04-18 11:21:52');

-- Listage de la structure de table projet_pfe. failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.failed_jobs : ~0 rows (environ)

-- Listage de la structure de table projet_pfe. incidents
CREATE TABLE IF NOT EXISTS `incidents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` bigint unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `occurred_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `incidents_driver_id_foreign` (`driver_id`),
  CONSTRAINT `incidents_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.incidents : ~0 rows (environ)

-- Listage de la structure de table projet_pfe. locations
CREATE TABLE IF NOT EXISTS `locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `driver_id` bigint unsigned NOT NULL,
  `latitude` double(10,6) NOT NULL,
  `longitude` double(10,6) NOT NULL,
  `recorded_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locations_driver_id_foreign` (`driver_id`),
  CONSTRAINT `locations_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.locations : ~0 rows (environ)

-- Listage de la structure de table projet_pfe. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.migrations : ~25 rows (environ)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2019_08_19_000000_create_failed_jobs_table', 1),
	(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(10, '2025_02_18_181042_add_columns_to_users_table', 2),
	(11, '2025_02_22_133312_create_admins_table', 2),
	(12, '2025_03_08_205650_remove_role_from_users_table', 2),
	(13, '2025_04_17_202300_create_drivers_table', 3),
	(14, '2025_04_17_202838_create_incidents_table', 4),
	(15, '2025_04_17_202950_create_locations_table', 4),
	(16, '2025_04_17_203041_create_services_table', 4),
	(17, '2025_04_17_203244_create_cars_table', 4),
	(18, '2025_04_17_205224_create_service_requests_table', 4),
	(19, '2025_04_17_210512_add_lat_lng_to_drivers_table', 5),
	(20, '2025_04_18_114347_add_driver_id_to_cars_table', 6),
	(21, '2025_04_18_114941_remove_user_id_from_cars_table', 7),
	(22, '2025_04_06_171656_create_drivers_table', 10),
	(23, '2025_04_06_171656_create_drivers_table', 10),
	(24, '2025_04_21_211253_add_fcm_token_to_users_table', 11),
	(25, '2025_04_21_211546_add_fcm_token_to_drivers_table', 11);

-- Listage de la structure de table projet_pfe. oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.oauth_access_tokens : ~0 rows (environ)

-- Listage de la structure de table projet_pfe. oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.oauth_auth_codes : ~0 rows (environ)

-- Listage de la structure de table projet_pfe. oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.oauth_clients : ~0 rows (environ)

-- Listage de la structure de table projet_pfe. oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.oauth_personal_access_clients : ~0 rows (environ)

-- Listage de la structure de table projet_pfe. oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.oauth_refresh_tokens : ~0 rows (environ)

-- Listage de la structure de table projet_pfe. password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.password_resets : ~0 rows (environ)

-- Listage de la structure de table projet_pfe. personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.personal_access_tokens : ~7 rows (environ)
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
	(5, 'App\\Models\\Driver', 3, 'authToken', '0cd40402e6d5865e32849cb8e9af167bb717d62b757aaaa91e10f95d2d59773e', '["*"]', NULL, '2025-04-17 20:13:53', '2025-04-17 20:13:53'),
	(11, 'App\\Models\\Driver', 2, 'authToken', '22e071b964f0886b68a40a1729e25e67fe0ffacd4847d54b9ee1b55582acae0a', '["*"]', NULL, '2025-04-17 20:33:45', '2025-04-17 20:33:45'),
	(14, 'App\\Models\\Driver', 1, 'authToken', '017369d422f56c70b1a73569a1e1e2804036526322f76ac82821567f03e773a3', '["*"]', NULL, '2025-04-17 21:11:37', '2025-04-17 21:11:37'),
	(15, 'App\\Models\\Driver', 4, 'authToken', 'ed47490fcaa82047ecbdf7f7c1ccd1bfb634de71a69ba6afdf76425350e4ce98', '["*"]', NULL, '2025-04-17 22:00:01', '2025-04-17 22:00:01'),
	(16, 'App\\Models\\Driver', 5, 'authToken', '41ab2345f9f7837b96fce038a6713b7ffa762be2799dd5843fbfb6bf0ed19a60', '["*"]', NULL, '2025-04-17 22:04:54', '2025-04-17 22:04:54'),
	(17, 'App\\Models\\Driver', 6, 'authToken', '6a4f35668f872c55f815ffd487cf9d3ce3a5da710eca616cde86743d14759cfd', '["*"]', NULL, '2025-04-17 22:09:50', '2025-04-17 22:09:50'),
	(107, 'App\\Models\\User', 1, 'authToken', '3ff50d191e3dc3ba7f1cc6ec273125535588027c63c7dfd332c5844120e61c24', '["*"]', NULL, '2025-04-24 11:05:44', '2025-04-24 11:05:44');

-- Listage de la structure de table projet_pfe. services
CREATE TABLE IF NOT EXISTS `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.services : ~0 rows (environ)

-- Listage de la structure de table projet_pfe. service_requests
CREATE TABLE IF NOT EXISTS `service_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `driver_id` bigint unsigned DEFAULT NULL,
  `client_latitude` decimal(10,7) NOT NULL,
  `client_longitude` decimal(10,7) NOT NULL,
  `status` enum('en attente','accepté','refusé') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en attente',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_requests_client_id_foreign` (`client_id`),
  KEY `service_requests_driver_id_foreign` (`driver_id`),
  CONSTRAINT `service_requests_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `service_requests_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.service_requests : ~0 rows (environ)

-- Listage de la structure de table projet_pfe. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table projet_pfe.users : ~2 rows (environ)
INSERT INTO `users` (`id`, `name`, `phone`, `email`, `fcm_token`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'wej@gmail.com', '59361478', 'wej@gmail.com', NULL, NULL, '$2y$10$KOpDuDbHHCWmZbNAaCjmuO4prCytPge1VbAwB3cZMishEBRB8lxXO', NULL, '2025-04-17 20:16:43', '2025-04-18 12:21:30', NULL),
	(2, 'ahmed', '52967146', 'ahmed@gmail.com', NULL, NULL, '$2y$10$DJZ89bS45fmeTJIH4PBmQeYRPT884UfQD4mLOQVrfvCzo76TfjPCO', NULL, '2025-04-17 22:35:31', '2025-04-17 22:35:31', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
