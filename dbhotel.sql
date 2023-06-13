# ************************************************************
# Sequel Ace SQL dump
# Version 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.31)
# Database: tmdt_data
# Generation Time: 2023-06-07 09:14:00 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table blog_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blog_comments`;

CREATE TABLE `blog_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messages` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table blogs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blogs`;

CREATE TABLE `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;

INSERT INTO `blogs` (`id`, `user_id`, `title`, `subtitle`, `image`, `category`, `content`, `created_at`, `updated_at`)
VALUES
	(1,3,'The Personality Trait That Makes People Happier','','blog-1.jpg','TRAVEL','',NULL,NULL),
	(2,3,'This was one of our first days in Hawaii last week.','','blog-2.jpg','CodeLeanON','',NULL,NULL),
	(3,3,'Last week I had my first work trip of the year to Sonoma Valley','','blog-3.jpg','TRAVEL','',NULL,NULL),
	(4,3,'Happppppy New Year! I know I am a little late on this post','','blog-4.jpg','CodeLeanON','',NULL,NULL),
	(5,3,'Absolue collection. The Lancome team has been one…','','blog-5.jpg','MODEL','',NULL,NULL),
	(6,3,'Writing has always been kind of therapeutic for me','','blog-6.jpg','CodeLeanON','',NULL,NULL);

/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table brands
# ------------------------------------------------------------

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'room type 4',NULL,'2023-06-07 08:29:24'),
	(2,'room type 3',NULL,'2023-06-07 08:29:16'),
	(3,'room type 2',NULL,'2023-06-07 08:29:10'),
	(4,'room type 1',NULL,'2023-06-07 08:29:05');

/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
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



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(5,'2020_12_09_085528_create_orders_table',1),
	(6,'2020_12_09_085832_create_order_details_table',1),
	(7,'2020_12_09_085936_create_products_table',1),
	(8,'2020_12_09_090029_create_brands_table',1),
	(9,'2020_12_09_090110_create_product_categories_table',1),
	(10,'2020_12_09_090148_create_product_images_table',1),
	(11,'2020_12_09_090228_create_product_details_table',1),
	(12,'2020_12_09_090308_create_product_comments_table',1),
	(13,'2020_12_09_090355_create_blogs_table',1),
	(14,'2020_12_09_090437_create_blog_comments_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `qty` int NOT NULL,
  `amount` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `qty`, `amount`, `total`, `created_at`, `updated_at`)
VALUES
	(1,1,1,1,495,495,'2023-06-02 20:42:55','2023-06-02 20:42:55'),
	(2,2,3,1,34,34,'2023-06-02 20:43:23','2023-06-02 20:43:23'),
	(3,3,8,1,35,35,'2023-06-07 07:02:02','2023-06-07 07:02:02'),
	(4,4,2,1,13,13,'2023-06-07 07:11:10','2023-06-07 07:11:10'),
	(5,4,3,1,34,34,'2023-06-07 07:11:10','2023-06-07 07:11:10');

/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode_zip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `user_id`, `first_name`, `last_name`, `company_name`, `country`, `street_address`, `postcode_zip`, `town_city`, `email`, `phone`, `payment_type`, `status`, `created_at`, `updated_at`)
VALUES
	(3,1,'phong','Thieu','thieuphong','vietnam','Thanh Xuan','10000','Ha Noi','thieuphong0011@gmail.com','0345025547','pay_later',1,'2023-06-07 07:02:02','2023-06-07 07:02:02'),
	(4,6,'Mai','Luong','Luong Mai','Vietnam','Thanh Xuan','10000','Ha Noi','mai@gmail.com','0343810923','online_payment',1,'2023-06-07 07:11:10','2023-06-07 07:11:10');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table product_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;

INSERT INTO `product_categories` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Twin room',NULL,'2023-06-07 08:14:27'),
	(2,'Single room',NULL,'2023-06-07 08:14:18'),
	(3,'Double room',NULL,'2023-06-07 08:14:07');

/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_comments`;

CREATE TABLE `product_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messages` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_comments` WRITE;
/*!40000 ALTER TABLE `product_comments` DISABLE KEYS */;

INSERT INTO `product_comments` (`id`, `product_id`, `user_id`, `email`, `name`, `messages`, `rating`, `created_at`, `updated_at`)
VALUES
	(1,1,4,'BrandonKelley@gmail.com','Brandon Kelley','Nice !',4,NULL,NULL),
	(2,1,5,'RoyBanks@gmail.com','Roy Banks','Nice !',4,NULL,NULL);

/*!40000 ALTER TABLE `product_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_details`;

CREATE TABLE `product_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;

INSERT INTO `product_details` (`id`, `product_id`, `color`, `size`, `qty`, `created_at`, `updated_at`)
VALUES
	(1,1,'blue','S',5,NULL,NULL),
	(2,1,'blue','M',5,NULL,NULL),
	(3,1,'blue','L',5,NULL,NULL),
	(4,1,'blue','XS',5,NULL,NULL),
	(5,1,'yellow','S',0,NULL,NULL),
	(6,1,'violet','S',0,NULL,NULL);

/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_images`;

CREATE TABLE `product_images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;

INSERT INTO `product_images` (`id`, `product_id`, `path`, `created_at`, `updated_at`)
VALUES
	(4,2,'product-2.jpg',NULL,NULL),
	(5,3,'product-3.jpg',NULL,NULL),
	(6,4,'product-4.jpg',NULL,NULL),
	(7,5,'product-5.jpg',NULL,NULL),
	(8,6,'product-6.jpg',NULL,NULL),
	(9,7,'product-7.jpg',NULL,NULL),
	(10,8,'product-8.jpg',NULL,NULL),
	(11,9,'product-9.jpg',NULL,NULL),
	(13,1,'women-large_64800e69d5f5d_230607_045817.jpg','2023-06-07 04:58:17','2023-06-07 04:58:17');

/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int unsigned NOT NULL,
  `product_category_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL,
  `qty` int NOT NULL,
  `discount` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `brand_id`, `product_category_id`, `name`, `description`, `content`, `price`, `qty`, `discount`, `weight`, `sku`, `featured`, `tag`, `created_at`, `updated_at`)
VALUES
	(1,1,2,'Pure Pineapple','Lorem ipsum dolor sit amet, consectetur ing elit, sed do eiusmod tempor sum dolor sit amet, consectetur adipisicing elit, sed do mod tempor','',629.99,20,495,1.3,'00012',1,'Luxurious amenities',NULL,NULL),
	(2,2,2,'Guangzhou sweater',NULL,NULL,35,20,13,NULL,NULL,1,'Luxurious amenities',NULL,NULL),
	(3,3,2,'Guangzhou sweater',NULL,NULL,35,20,34,NULL,NULL,1,'Luxurious amenities',NULL,NULL),
	(4,4,1,'Microfiber Wool Scarf',NULL,NULL,64,20,35,NULL,NULL,1,'Private and peaceful rooms',NULL,NULL),
	(5,1,3,'Men\'s Painted Hat',NULL,NULL,44,20,35,NULL,NULL,0,'Private and peaceful rooms',NULL,NULL),
	(6,1,2,'Converse Shoes',NULL,NULL,35,20,34,NULL,NULL,1,'Luxurious amenities',NULL,NULL),
	(7,1,1,'Pure Pineapple',NULL,NULL,64,20,35,NULL,NULL,1,'Close to the beach/entertainment',NULL,NULL),
	(8,1,1,'2 Layer Windbreaker',NULL,NULL,44,20,35,NULL,NULL,1,'Luxurious amenities',NULL,NULL),
	(9,1,1,'Converse Shoes',NULL,NULL,35,20,34,NULL,NULL,1,'tunning views',NULL,NULL);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` tinyint NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode_zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `avatar`, `level`, `description`, `company_name`, `country`, `street_address`, `postcode_zip`, `town_city`, `phone`, `created_at`, `updated_at`)
VALUES
	(1,'phong','thieuphong0011@gmail.com',NULL,'$2y$10$HfE4Id/Ln0j9B47deOc/ZObj613bHJCtJON9BfpVNPEKz.LiRFJyq','Bp5lIKvfsvLfJKCXHre4LLUBDMS5zaSmQzTeLou1rtCHQBEnwAAKdXikLqP4',NULL,2,NULL,'thieuphong','vietnam','Thanh Xuan','10000','Ha Noi','0345025547',NULL,'2023-06-05 19:45:15'),
	(2,'admin','admin@gmail.com',NULL,'$2y$10$SdKQLOgbGWzVCP8mkPWxZeMh6cyFSiDbbbEN0Zp1nDX0R5grIc166','bknSdxI8fgzXl5bueVyrtlr4wy35HaujUcyYzlLkNetpDvPDoS4U8MoElF7f',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,'Shane Lynch','ShaneLynch@gmail.com',NULL,'$2y$10$q/lQsWgFzaRaAPDnLxcJI.d17ogOQmqCTayChgs8Ww/WI/ZKuuwRK',NULL,'avatar-0.png',1,'Aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum bore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud amodo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,'Brandon Kelley','BrandonKelley@gmail.com',NULL,'$2y$10$LG9JAbp5W7m1dzwTKJatSO65Pm7wU/dabj.T5YJbf9kpOBHH3FU8q',NULL,'avatar-1.png',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,'Roy Banks','RoyBanks@gmail.com',NULL,'$2y$10$X4HE0hEfb5UmMZbmEndgzONdkFjQJO032BybQarM4Ciis2b7Oh182',NULL,'avatar-2.png',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,'Mai','mai@gmail.com',NULL,'$2y$10$NhYwmqRGA4.iSFtDK8vJ7.0F5n846WUVrGQxokB1zDNt5IBFRBqny',NULL,NULL,2,'abc','Luong Mai','Vietnam','Thanh Xuan','10000','Ha Noi','0343810923','2023-06-05 10:31:22','2023-06-05 10:31:22'),
	(9,'a','a@gmail.com',NULL,'$2y$10$3n3LIutUar0UGfKXnHbRyuITFG3cYwCB3Xw8S13I4wzGd8tH7w0Eu',NULL,'4_647e53800e065_230605_092832.jpg',2,'qaw','a','a','a','123','a','123456789','2023-06-05 21:28:32','2023-06-05 21:28:32');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
