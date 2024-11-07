DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NOT NULL,        -- E.g., "Drinks", "Coffee", "Tea", "Food", "Ingredients"
  `image` VARCHAR(200) DEFAULT NULL,
  `description` VARCHAR(200) DEFAULT NULL,
  `slug` VARCHAR(50) DEFAULT NULL,
  `position` INT DEFAULT '0',
  `parent_id` VARCHAR(36) DEFAULT NULL,
  `status` ENUM('active','inactive','deleted') DEFAULT 'active',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `images` JSON DEFAULT NULL,
  `content` TEXT,
  `description` TEXT,
  `is_available_for_sale` BOOLEAN DEFAULT FALSE,
  `origin` VARCHAR(100) DEFAULT NULL,
  `supplier` VARCHAR(100) DEFAULT NULL,
  `rating` FLOAT DEFAULT 0,
  `sale_count` INT UNSIGNED DEFAULT 0,
  `status` ENUM('active', 'inactive', 'deleted') DEFAULT 'active',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`),
  KEY `category_id` (`category_id`) USING BTREE,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `product_id` VARCHAR(36) NOT NULL,
  `category_id` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`),
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` VARCHAR(36) NOT NULL,
  `name` VARCHAR(50) NOT NULL,         -- E.g., "Glass-S", "Bottle-100ml", "Bag-500g", "Bottle-1ml", "Bag-1g"
  `description` VARCHAR(255) DEFAULT NULL,
  `status` ENUM('active','inactive','deleted') DEFAULT 'active',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `product_details`;
CREATE TABLE `product_details` (
  `id` VARCHAR(36) NOT NULL,
  `product_id` VARCHAR(36) NOT NULL,
  `type_id` VARCHAR(36) NOT NULL,
  `roast_levels` ENUM('light', 'medium', 'dark') DEFAULT NULL,
  `price` DECIMAL(10, 2) DEFAULT NULL,
  `status` ENUM('active','inactive','deleted') DEFAULT 'active',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`),
  FOREIGN KEY (`type_id`) REFERENCES `types`(`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks` (
  `id` VARCHAR(36) NOT NULL,
  `product_id` VARCHAR(36) NOT NULL,
  `type_id` VARCHAR(36) NOT NULL,
  `quantity` INT NOT NULL,
  `status` ENUM('active','inactive','deleted') DEFAULT 'active',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products`(`id`),
  FOREIGN KEY (`type_id`) REFERENCES `types`(`id`),
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `type_id` (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;