-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: shoppingmall
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aisle`
--

DROP TABLE IF EXISTS `aisle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aisle` (
  `aisle_id` int NOT NULL AUTO_INCREMENT,
  `aisle_label` varchar(50) NOT NULL,
  `product_category` int DEFAULT NULL,
  `row_no` int NOT NULL,
  `column_no` int NOT NULL,
  `shelf_count` int NOT NULL,
  `capacity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`aisle_id`),
  UNIQUE KEY `aisle_label` (`aisle_label`),
  KEY `idx_product_category` (`product_category`),
  KEY `idx_aisle_label` (`aisle_label`),
  CONSTRAINT `aisle_ibfk_1` FOREIGN KEY (`product_category`) REFERENCES `category` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aisle`
--

LOCK TABLES `aisle` WRITE;
/*!40000 ALTER TABLE `aisle` DISABLE KEYS */;
/*!40000 ALTER TABLE `aisle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronics'),(2,'Kitchen Appliances/Decors'),(3,'Home Appliances/Decor'),(4,'Beauty'),(5,'Medicine');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `idx_email` (`email`),
  KEY `idx_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `role_id` int DEFAULT NULL,
  `joining_date` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` text,
  `city` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `cnic` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `cnic` (`cnic`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_email` (`email`),
  KEY `idx_phone` (`phone`),
  KEY `idx_cnic` (`cnic`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interaction`
--

DROP TABLE IF EXISTS `interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interaction` (
  `interaction_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `interaction_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `interaction_type` enum('Phone','Email','In-person') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`interaction_id`),
  KEY `idx_customer_id ` (`customer_id`),
  KEY `idx_employee_id` (`employee_id`),
  CONSTRAINT `interaction_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `interaction_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaction`
--

LOCK TABLES `interaction` WRITE;
/*!40000 ALTER TABLE `interaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mall_information`
--

DROP TABLE IF EXISTS `mall_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mall_information` (
  `mall_id` int NOT NULL,
  `mall_name` varchar(200) DEFAULT NULL,
  `mall_contact_number` varchar(200) DEFAULT NULL,
  `mall_address` varchar(200) DEFAULT NULL,
  `mall_timings` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`mall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mall_information`
--

LOCK TABLES `mall_information` WRITE;
/*!40000 ALTER TABLE `mall_information` DISABLE KEYS */;
INSERT INTO `mall_information` VALUES (1,'Peshawar mall','051-98767589','University Road Peshawar','9 am to 11 pm');
/*!40000 ALTER TABLE `mall_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `category_id` int DEFAULT NULL,
  `rack_id` int DEFAULT NULL,
  `inventory_count` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text,
  `alert_threshold` int DEFAULT '10',
  `subcategory_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  KEY `rack_id` (`rack_id`),
  KEY `subcategory_id` (`subcategory_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`rack_id`) REFERENCES `racks` (`rack_id`),
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Washing Machine',1,1,10,55000.00,'Top Load Washing Machine with 7 kg capacity.',5,1),(2,'Refrigerator',1,1,5,75000.00,'Double Door Refrigerator with 300 L capacity.',5,1),(3,'Microwave Oven',1,1,15,12000.00,'Convection Microwave Oven with 25 L capacity.',5,1),(4,'Air Conditioner',1,1,8,50000.00,'Split Air Conditioner with 1.5 Ton capacity.',5,1),(5,'Electric Kettle',1,1,20,2500.00,'1.7 L Electric Kettle with auto shut-off.',5,1),(6,'Dishwasher',1,1,3,70000.00,'Fully Automatic Dishwasher with 12 place settings.',5,1),(7,'Blender',1,1,12,5000.00,'500W Blender with multiple speed settings.',5,1),(8,'Toaster',1,1,9,3000.00,'2 Slice Toaster with adjustable browning control.',5,1),(9,'Rice Cooker',1,1,6,4000.00,'Electric Rice Cooker with 1.5 L capacity.',5,1),(10,'Juicer',1,1,14,6000.00,'Centrifugal Juicer with 800W motor.',5,1),(11,'Deep Freezer',1,1,2,60000.00,'Upright Deep Freezer with 200 L capacity.',5,1),(12,'Induction Cooktop',1,1,7,4000.00,'Portable Induction Cooktop with 2000W power.',5,1),(13,'Electric Iron',1,1,18,3000.00,'Steam Iron with non-stick soleplate.',5,1),(14,'Food Processor',1,1,4,8000.00,'Multi-Functional Food Processor with attachments.',5,1),(15,'Vacuum Cleaner',1,1,11,15000.00,'Bagless Vacuum Cleaner with powerful suction.',5,1),(16,'Electric Pressure Cooker',1,1,5,7000.00,'Electric Pressure Cooker with multiple cooking modes.',5,1),(17,'Coffee Maker',1,1,13,5500.00,'Coffee Maker with programmable timer.',5,1),(18,'Air Fryer',1,1,1,10000.00,'Air Fryer with 3.5 L capacity and digital controls.',5,1),(19,'Slow Cooker',1,1,15,8000.00,'Slow Cooker with 6.5 QT capacity.',5,1),(20,'Bread Maker',1,1,17,12000.00,'Automatic Bread Maker with multiple settings.',5,1),(21,'iPhone 14',1,2,15,200000.00,'Latest iPhone with A15 chip and 128GB storage.',5,2),(22,'Samsung Galaxy S23',1,2,20,180000.00,'Premium smartphone with Snapdragon 8 Gen 2.',5,2),(23,'OnePlus 11',1,2,20,120000.00,'Flagship smartphone with 120Hz display.',5,2),(24,'Google Pixel 7',1,2,18,150000.00,'Camera-focused smartphone with Google Tensor chip.',5,2),(25,'Xiaomi 13',1,2,20,70000.00,'High-performance smartphone with great battery life.',5,2),(26,'Realme GT 2 Pro',1,2,22,90000.00,'Flagship smartphone with 65W fast charging.',5,2),(27,'Oppo Find X5',1,2,20,110000.00,'Stylish smartphone with unique design and features.',5,2),(28,'Vivo X80',1,2,20,95000.00,'Smartphone with advanced camera system and display.',5,2),(29,'Nokia G50',1,2,20,20000.00,'Affordable smartphone with 5G connectivity.',5,2),(30,'Sony Xperia 10 IV',1,2,20,60000.00,'Smartphone with a unique 21:9 display for entertainment.',5,2),(31,'Honor 70',1,2,20,55000.00,'Mid-range smartphone with sleek design and features.',5,2),(32,'Motorola Edge 30',1,2,20,80000.00,'Smartphone with high refresh rate display and performance.',5,2),(33,'Asus ROG Phone 6',1,2,20,220000.00,'Gaming smartphone with top-tier specs.',5,2),(34,'TCL 30 SE',1,2,20,30000.00,'Budget-friendly smartphone with good features.',5,2),(35,'Samsung Galaxy Z Flip4',1,2,20,230000.00,'Foldable smartphone with compact design.',5,2),(36,'Xiaomi Redmi Note 11',1,2,20,40000.00,'Value-for-money smartphone with great features.',5,2),(37,'Huawei P50',1,2,20,200000.00,'Flagship smartphone with exceptional camera capabilities.',5,2),(38,'LG Velvet',1,2,20,80000.00,'Smartphone with a unique design and dual-screen accessory.',5,2),(39,'ZTE Axon 20',1,2,20,60000.00,'Smartphone with an under-display camera.',5,2),(40,'Poco F4',1,2,20,45000.00,'Affordable flagship smartphone with great performance.',5,2),(41,'LED TV',1,3,100,50000.00,'55 inch Full HD LED TV',10,3),(42,'Smart TV',1,3,80,75000.00,'65 inch Smart TV with Wi-Fi',10,3),(43,'4K TV',1,3,60,100000.00,'75 inch 4K Ultra HD TV',5,3),(44,'Curved TV',1,3,50,85000.00,'55 inch Curved LED TV',7,3),(45,'OLED TV',1,3,40,120000.00,'65 inch OLED Smart TV',3,3),(46,'Television Accessories',1,3,200,2000.00,'TV Mounts and Cables',20,3),(47,'Soundbar',1,3,150,15000.00,'Bluetooth Soundbar',15,3),(48,'HDMI Cable',1,3,300,500.00,'High-Speed HDMI Cable',30,3),(49,'TV Stand',1,3,50,10000.00,'Modern TV Stand',5,3),(50,'Projector',1,3,30,40000.00,'Portable Projector',2,3),(51,'Portable TV',1,3,70,20000.00,'10 inch Portable LED TV',10,3),(52,'Smart TV Box',1,3,90,12000.00,'Streaming Device for TVs',15,3),(53,'TV Wall Mount',1,3,120,3000.00,'Adjustable Wall Mount',20,3),(54,'LCD TV',1,3,50,40000.00,'32 inch LCD TV',8,3),(55,'DLP TV',1,3,25,60000.00,'50 inch DLP TV',4,3),(56,'LED Backlit TV',1,3,35,55000.00,'43 inch Backlit LED TV',6,3),(57,'Wireless Speakers',1,4,150,12000.00,'Portable wireless speakers with high-quality sound.',10,4),(58,'Bluetooth Headphones',1,4,100,8000.00,'Over-ear Bluetooth headphones with noise cancellation.',5,4),(59,'Soundbar',1,4,80,25000.00,'High-performance soundbar for an immersive audio experience.',10,4),(60,'Portable Bluetooth Speaker',1,4,120,7000.00,'Compact Bluetooth speaker for on-the-go use.',8,4),(61,'Home Theater System',1,4,50,50000.00,'Complete home theater system with surround sound.',5,4),(62,'Audio Receiver',1,4,70,15000.00,'High-fidelity audio receiver for home systems.',7,4),(63,'Microphone',1,4,90,3000.00,'High-quality microphone for recording and streaming.',12,4),(64,'DJ Mixer',1,4,40,20000.00,'Professional DJ mixer for mixing and effects.',5,4),(65,'Turntable',1,4,30,15000.00,'Classic turntable for vinyl records.',5,4),(66,'Subwoofer',1,4,60,22000.00,'Powerful subwoofer for deep bass.',10,4),(67,'Sound Isolating Earbuds',1,4,110,5000.00,'In-ear earbuds with sound isolation technology.',10,4),(68,'Home Audio System',1,4,30,35000.00,'Complete home audio system with multiple speakers.',5,4),(69,'Portable CD Player',1,4,110,6000.00,'Compact CD player for music on the go.',10,4),(70,'Streaming Device',1,4,90,15000.00,'Device for streaming music and audio content.',5,4),(71,'Car Audio System',1,4,50,18000.00,'High-quality audio system for vehicles.',5,4),(72,'Headphone Amplifier',1,4,40,10000.00,'Amplifier for enhancing headphone sound quality.',5,4),(73,'Soundproofing Panels',1,4,25,3000.00,'Panels for soundproofing rooms.',5,4),(74,'Smartwatch Series 6',1,5,50,30000.00,'The latest smartwatch with enhanced features',5,5),(75,'Fitness Tracker Pro',1,5,40,15000.00,'Advanced fitness tracker with heart rate monitor',5,5),(76,'Wireless Earbuds',1,5,70,8000.00,'High-quality wireless earbuds with noise cancellation',10,5),(77,'Smart Glasses',1,5,30,50000.00,'Innovative smart glasses with augmented reality',5,5),(78,'Smart Ring',1,5,20,12000.00,'Stylish smart ring for notifications and tracking',3,5),(79,'Sleep Monitor Headband',1,5,25,7000.00,'Wearable headband for sleep tracking',4,5),(80,'Heart Rate Monitor Chest Strap',1,5,15,10000.00,'Chest strap for accurate heart rate monitoring',5,5),(81,'Smart Necklace',1,5,18,18000.00,'Trendy necklace with smart features',2,5),(82,'Activity Tracker Watch',1,5,35,25000.00,'Durable watch for activity tracking',5,5),(83,'Smart Clothing',1,5,10,45000.00,'Wearable technology integrated into clothing',3,5),(84,'Nonstick Frying Pan',2,6,50,1500.00,'Durable nonstick pan for everyday cooking',10,6),(85,'Stainless Steel Cookware Set',2,6,30,7500.00,'Premium cookware set with various sizes',5,6),(86,'Cast Iron Skillet',2,6,20,3200.00,'Heavy-duty skillet for high-heat cooking',5,6),(87,'Ceramic Casserole Dish',2,6,15,2500.00,'Oven-safe casserole dish for baking',3,6),(88,'Blender',2,7,40,4500.00,'High-speed blender for smoothies and more',7,7),(89,'Electric Kettle',2,7,70,3000.00,'Quick-boiling kettle with auto shut-off',10,7),(90,'Toaster Oven',2,7,25,8500.00,'Compact toaster oven with multiple functions',5,7),(91,'Stand Mixer',2,7,15,12500.00,'Heavy-duty stand mixer for baking',2,7),(92,'Airtight Storage Containers',2,8,60,3500.00,'Set of 5 containers with airtight seals',12,8),(93,'Spice Rack Organizer',2,8,40,1200.00,'Compact rack for organizing spices',5,8),(94,'Pantry Organization Bins',2,8,25,2000.00,'Bins for pantry or fridge storage',4,8),(95,'Drawer Organizer for Cutlery',2,8,35,1100.00,'Expandable drawer organizer for utensils',8,8),(96,'Dinner Plate Set',2,9,50,4500.00,'Porcelain plate set with 12 pieces',10,9),(97,'Glass Tumblers',2,9,60,2500.00,'Set of 6 glass tumblers for beverages',12,9),(98,'Stainless Steel Cutlery Set',2,9,30,5500.00,'24-piece cutlery set',5,9),(99,'Serving Bowl Set',2,9,20,3500.00,'Set of 3 bowls for serving dishes',5,9),(100,'Vegetable Peeler',2,10,70,800.00,'Ergonomic peeler for vegetables and fruits',10,10),(101,'Garlic Press',2,10,50,1200.00,'Stainless steel garlic press',5,10),(102,'Measuring Cups & Spoons',2,10,40,1500.00,'Complete set for baking and cooking',4,10),(103,'Grater with Multiple Blades',2,10,25,1800.00,'Grater with interchangeable blades',5,10),(104,'Decorative Curtains',3,16,30,5000.00,'Stylish curtains for windows.',5,11),(105,'Table Centerpiece',3,16,25,1500.00,'Beautiful centerpieces for dining.',5,11),(106,'Wall Clock',3,16,20,3000.00,'Elegant clocks for wall decoration.',5,11),(107,'Cushion Covers',3,16,15,2000.00,'Colorful covers for your cushions.',5,11),(108,'Indoor Plants',3,16,10,800.00,'Brings greenery to your home.',5,11),(109,'Bedding Set',3,17,30,15000.00,'Complete bedding for comfort.',5,12),(110,'Wall Shelves',3,17,25,4000.00,'Space-saving shelves for decor.',5,12),(111,'Table Lamp',3,18,20,2500.00,'Stylish table lamp for lighting.',5,13),(112,'Ceiling Light',3,18,20,8000.00,'Elegant ceiling lights for ambiance.',5,13),(113,'Decorative Tray',3,18,10,3000.00,'Stylish trays for serving.',5,13),(114,'Hand Mixer',3,19,15,5000.00,'Convenient for mixing ingredients.',5,14),(115,'Slow Cooker',3,19,10,6000.00,'Perfect for slow-cooked meals.',5,14),(116,'Electric Kettle',3,19,10,4000.00,'Quickly boils water for tea.',5,14),(117,'Blender',3,19,5,7000.00,'Ideal for smoothies and soups.',5,14),(118,'Rice Cooker',3,19,5,8000.00,'Cook rice perfectly every time.',5,14),(119,'Decorative Vases',3,20,30,1500.00,'Vases for flowers and decor.',5,15),(120,'Picture Frames',3,20,25,2000.00,'Frames for your favorite memories.',5,15),(121,'Throw Blankets',3,20,20,3000.00,'Cozy blankets for comfort.',5,15),(122,'Wall Art',3,20,15,4000.00,'Art for decorating your walls.',5,15),(123,'Scented Candles',3,20,10,1200.00,'Candles that provide fragrance.',5,15),(124,'Moisturizing Cream',4,21,50,2500.00,'Hydrating cream for all skin types.',5,16),(125,'Sunscreen Lotion',4,21,30,1800.00,'SPF 50 sunscreen for sun protection.',5,16),(126,'Face Serum',4,21,20,3000.00,'Nourishing serum for glowing skin.',5,16),(127,'Cleanser',4,21,25,1200.00,'Gentle cleanser for daily use.',5,16),(128,'Face Mask',4,21,15,800.00,'Hydrating face mask for dry skin.',5,16),(129,'Foundation',4,22,40,3500.00,'Liquid foundation for flawless skin.',5,17),(130,'Lipstick',4,22,35,1200.00,'Long-lasting lipstick in various shades.',5,17),(131,'Mascara',4,22,30,1500.00,'Waterproof mascara for voluminous lashes.',5,17),(132,'Eyeshadow Palette',4,22,20,4500.00,'Versatile eyeshadow palette with 12 shades.',5,17),(133,'Blush',4,22,15,1000.00,'Natural blush for a healthy glow.',5,17),(134,'Shampoo',4,23,50,2000.00,'Nourishing shampoo for healthy hair.',5,18),(135,'Conditioner',4,23,30,2200.00,'Moisturizing conditioner for dry hair.',5,18),(136,'Hair Oil',4,23,25,1500.00,'Hair oil for nourishment and shine.',5,18),(137,'Hair Mask',4,23,20,1800.00,'Deep conditioning hair mask for repair.',5,18),(138,'Styling Gel',4,23,15,1200.00,'Hold and define your hairstyle.',5,18),(139,'Perfume',4,24,40,4000.00,'Long-lasting fragrance for daily wear.',5,19),(140,'Eau de Toilette',4,24,30,3000.00,'Light and refreshing scent.',5,19),(141,'Body Spray',4,24,25,1500.00,'Refreshing body spray for all-day freshness.',5,19),(142,'Essential Oil',4,24,20,2500.00,'Pure essential oil for aromatherapy.',5,19),(143,'Cologne',4,24,15,3500.00,'Masculine scent for men.',5,19),(144,'Nail Polish',4,25,50,800.00,'Vibrant nail polish in various colors.',5,20),(145,'Nail File',4,25,30,500.00,'Quality nail file for shaping nails.',5,20),(146,'Cuticle Oil',4,25,25,600.00,'Nourishing oil for healthy cuticles.',5,20),(147,'Nail Art Kit',4,25,20,2000.00,'Complete kit for nail art designs.',5,20),(148,'Nail Clipper',4,25,15,300.00,'Sturdy nail clipper for neat nails.',5,20),(149,'Exfoliating Scrub',4,21,10,950.00,'Scrub for removing dead skin cells.',5,16),(150,'Hydrating Toner',4,21,10,1350.00,'Toner for balanced skin hydration.',5,16),(151,'Facial Mist',4,21,10,1200.00,'Refreshing facial mist for hydration.',5,16),(152,'Night Cream',4,21,10,3000.00,'Nourishing cream for overnight repair.',5,16),(153,'Cleansing Balm',4,21,10,2200.00,'Balm for removing makeup and impurities.',5,16),(154,'Eye Cream',4,22,10,2800.00,'Cream for reducing dark circles.',5,17),(155,'Lip Balm',4,22,10,500.00,'Hydrating balm for soft lips.',5,17),(156,'Setting Spray',4,22,10,1500.00,'Spray for long-lasting makeup.',5,17),(157,'Highlighter',4,22,10,1800.00,'Cream or powder for highlighting.',5,17),(158,'Concealer',4,22,10,1200.00,'Cream for covering blemishes.',5,17),(159,'Hair Spray',4,23,10,1300.00,'Spray for holding hairstyles in place.',5,18),(160,'Hair Treatment',4,23,10,2500.00,'Treatment for damaged hair.',5,18),(161,'Detangler',4,23,10,1500.00,'Spray for easy combing.',5,18),(162,'Dry Shampoo',4,23,10,1200.00,'Shampoo for refreshing hair without water.',5,18),(163,'Hair Serum',4,23,10,2000.00,'Serum for smooth and shiny hair.',5,18),(164,'Body Butter',4,24,10,2000.00,'Rich cream for body hydration.',5,19),(165,'Bath Bomb',4,24,10,800.00,'Fizzing bomb for relaxing bath experience.',5,19),(166,'Foot Cream',4,24,10,1000.00,'Cream for soft and smooth feet.',5,19),(167,'Aftershave Balm',4,24,10,1200.00,'Balm for soothing skin post-shave.',5,19),(168,'Shaving Gel',4,24,10,1400.00,'Gel for smooth shaving experience.',5,19),(169,'Gel Nail Polish',4,25,10,1200.00,'Long-lasting gel polish for nails.',5,20),(170,'Nail Art Stickers',4,25,10,500.00,'Stickers for easy nail art designs.',5,20),(171,'Nail Strengthener',4,25,10,700.00,'Strengthening formula for weak nails.',5,20),(172,'Foot Scrub',4,25,10,950.00,'Exfoliating scrub for feet.',5,20),(173,'Nail Buffer',4,25,10,600.00,'Buffer for smoothening nail surface.',5,20);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racks`
--

DROP TABLE IF EXISTS `racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `racks` (
  `rack_id` int NOT NULL AUTO_INCREMENT,
  `rack_label` varchar(255) NOT NULL,
  `location_description` varchar(255) NOT NULL,
  `floor` varchar(45) NOT NULL,
  PRIMARY KEY (`rack_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racks`
--

LOCK TABLES `racks` WRITE;
/*!40000 ALTER TABLE `racks` DISABLE KEYS */;
INSERT INTO `racks` VALUES (1,'Electronics','Electronics Products Area','1'),(2,'Electronics','Mobile Phones Display Area','1'),(3,'Electronics','Television LED/LCD Devices','1'),(4,'Electronics: Audio Equipment Rack','Aisle 2, Left Side of the Mall','Ground'),(5,'Wearable Technology','Rack: Left side of the Mall, near the Electronics Section','1st Floor'),(6,'Kitchen Appliances: Cookware','Aisle B, Left side of the Mall','2nd Floor'),(7,'Kitchen Appliances: Small Kitchen Appliances','Aisle B, Right side of the Mall','2nd Floor'),(8,'Kitchen Appliances: Storage & Organization','Aisle C, Left side of the Mall','2nd Floor'),(9,'Kitchen Appliances: Tableware','Aisle C, Right side of the Mall','2nd Floor'),(10,'Kitchen Appliances: Tools & Gadgets','Aisle D, Left side of the Mall','2nd Floor'),(11,'Home Appliances: Kitchen Essentials','Rack: A Left side of the Mall','1st Floor'),(12,'Home Decor: Living Room','Rack: B Center of the Mall','1st Floor'),(13,'Cleaning Tools: Kitchen','Rack: C Right side of the Mall','1st Floor'),(14,'Bedding: Linen and Pillows','Rack: D Top Floor of the Mall','2nd Floor'),(15,'Furniture: Bedroom','Rack: E Ground floor of the Mall','Ground Floor'),(16,'Home Appliances: Home Decor','Rack: A Right side of the Mall, Aisle 1','1st Floor'),(17,'Home Appliances: Bedding and Linens','Rack: B Left side of the Mall, Aisle 2','2nd Floor'),(18,'Home Appliances: Lighting','Rack: B Right side of the Mall, Aisle 3','2nd Floor'),(19,'Home Appliances: Small Appliances','Rack: C Left side of the Mall, Aisle 4','3rd Floor'),(20,'Home Appliances: Home Accessories','Rack: C Right side of the Mall, Aisle 5','3rd Floor'),(21,'Beauty: Skincare','Rack: D Left side of the Mall, Aisle 1','1st Floor'),(22,'Beauty: Makeup','Rack: D Right side of the Mall, Aisle 2','1st Floor'),(23,'Beauty: Hair Care','Rack: E Left side of the Mall, Aisle 3','2nd Floor'),(24,'Beauty: Fragrances','Rack: E Right side of the Mall, Aisle 4','2nd Floor'),(25,'Beauty: Nail Care','Rack: F Left side of the Mall, Aisle 5','3rd Floor'),(26,'Pain Relief Rack','Aisle 1 near the entrance','1'),(27,'Prescription Rack','Aisle 2 next to the pharmacy','1'),(28,'Herbal Supplements Rack','Aisle 3, shelf near herbal products','1'),(29,'Vitamins Rack','Aisle 4, shelf at the back','1'),(30,'Medical Supplies Rack','Aisle 5, shelf near medical supplies','1');
/*!40000 ALTER TABLE `racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund` (
  `refund_id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `refund_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `reason` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`refund_id`),
  KEY `idx_transaction_id` (`transaction_id`),
  KEY `idx_product_id` (`product_id`),
  CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE,
  CONSTRAINT `refund_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restocks`
--

DROP TABLE IF EXISTS `restocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restocks` (
  `restock_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `restock_date` datetime NOT NULL,
  PRIMARY KEY (`restock_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `restocks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restocks`
--

LOCK TABLES `restocks` WRITE;
/*!40000 ALTER TABLE `restocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `restocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `role_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`),
  KEY `idx_role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `salary_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `salary_amount` decimal(10,2) NOT NULL,
  `pay_grade` varchar(10) NOT NULL,
  `effective_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`salary_id`),
  KEY `idx_employee_id` (`employee_id`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sales_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `sales_date` datetime NOT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sales_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_receive`
--

DROP TABLE IF EXISTS `stock_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_receive` (
  `receive_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `receive_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `supplier` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`receive_id`),
  KEY `idx_product_id` (`product_id`),
  CONSTRAINT `stock_receive_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_receive`
--

LOCK TABLES `stock_receive` WRITE;
/*!40000 ALTER TABLE `stock_receive` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) NOT NULL,
  `store_location` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Electronics Products','First Floor, Left Side'),(2,'Electronics Products','Left Side of the Mall'),(3,'LED/LCD Television Devices','Right side of the Mall'),(4,'Audio Equipment Center','Left side of the Mall'),(5,'Wearable Tech Devices','Left side of the Mall, near the Electronics Section'),(6,'Kitchen Appliances & Decor','Left side of the Mall'),(7,'Cleaning Supplies & Tools','Right side of the Mall'),(8,'Home Decor & Furnishings','Center of the Mall'),(9,'Bedding & Linen','Top floor of the Mall'),(10,'Furniture Gallery','Ground floor of the Mall'),(11,'Home Appliances Store','First Floor, Main Mall Area'),(12,'Decor Hub','Second Floor, Corner Section'),(13,'Bedding & Lighting Outlet','First Floor, Near Entrance'),(14,'Accessory World','Second Floor, Side Aisle'),(15,'Small Appliances Depot','Third Floor, Central Area'),(16,'Skincare Store','First Floor, Near Entrance'),(17,'Makeup Haven','First Floor, Central Area'),(18,'Hair Care Hub','Second Floor, Side Aisle'),(19,'Fragrance World','Second Floor, Corner Section'),(20,'Nail Care Studio','Third Floor, Central Area'),(21,'HealthPlus Pharmacy','First Floor, Near Entrance'),(22,'Medicure Store','First Floor, Near Entrance'),(23,'Wellness Drugs','First Floor, Near Entrance'),(24,'PharmaDirect','First Floor, Near Entrance'),(25,'CareMed Dispensary','First Floor, Near Entrance');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `subcategory_id` int NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(255) NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`subcategory_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'Home Appliances',1),(2,'Mobile Phones',1),(3,'Television',1),(4,'Audio Equipment',1),(5,'Wearable Technology',1),(6,'Cookware',2),(7,'Small Kitchen Appliances',2),(8,'Kitchen Storage & Organization',2),(9,'Tableware',2),(10,'Kitchen Tools & Gadgets',2),(11,'Home Decor',3),(12,'Bedding and Linens',3),(13,'Lighting',3),(14,'Small Appliances',3),(15,'Home Accessories',3),(16,'Skincare',4),(17,'Makeup',4),(18,'Hair Care',4),(19,'Fragrances',4),(20,'Nail Care',4),(21,'Over-the-Counter Medication',5),(22,'Prescription Medication',5),(23,'Herbal Supplements',5),(24,'Vitamins & Minerals',5),(25,'Medical Supplies',5);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `transaction_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_price` decimal(10,2) NOT NULL,
  `payment_method` enum('Cash','Card','Online') NOT NULL,
  `status` enum('Pending','Success','Failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  KEY `idx_customer_id` (`customer_id`),
  KEY `idx_variant_id` (`variant_id`),
  KEY `idx_employee_id` (`employee_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`variant_id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_item`
--

DROP TABLE IF EXISTS `transaction_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_item` (
  `transaction_item_id` int NOT NULL AUTO_INCREMENT,
  `transaction_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_item_id`),
  KEY `idx_transaction_id` (`transaction_id`),
  KEY `idx_product_id` (`product_id`),
  CONSTRAINT `transaction_item_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_item`
--

LOCK TABLES `transaction_item` WRITE;
/*!40000 ALTER TABLE `transaction_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variants` (
  `variant_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `variant_type` varchar(255) DEFAULT NULL,
  `variant_value` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`variant_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES (1,1,'Size','7 kg',55000.00,1),(2,1,'Size','8 kg',58000.00,1),(3,1,'Color','White - 7 kg',55000.00,1),(4,1,'Color','Silver - 8 kg',58000.00,1),(5,2,'Color','Black',75000.00,1),(6,2,'Color','Stainless Steel',78000.00,1),(7,2,'Model','Double Door 300L',78000.00,1),(8,2,'Model','Single Door 200L',73000.00,1),(9,3,'Size','25 L',12000.00,1),(10,3,'Size','30 L',13000.00,1),(11,3,'Color','Black - 25 L',12000.00,1),(12,3,'Color','Silver - 30 L',13500.00,1),(13,4,'Capacity','1.5 Ton',50000.00,1),(14,4,'Capacity','2 Ton',60000.00,1),(15,4,'Color','White - 1.5 Ton',50000.00,1),(16,4,'Color','Silver - 2 Ton',60000.00,1),(17,5,'Capacity','1.7 L',2500.00,1),(18,5,'Color','Black - 1.7 L',2500.00,1),(19,6,'Model','12 Place Settings',70000.00,1),(20,6,'Model','14 Place Settings',80000.00,1),(21,7,'Color','Black',5000.00,1),(22,7,'Color','White',5200.00,1),(23,8,'Color','Red',3000.00,1),(24,8,'Color','Black',3200.00,1),(25,9,'Size','1.5 L',4000.00,1),(26,9,'Size','2 L',4200.00,1),(27,10,'Size','800 ml',6000.00,1),(28,10,'Size','1.2 L',6500.00,1),(29,11,'Capacity','200 L',60000.00,1),(30,11,'Capacity','250 L',65000.00,1),(31,12,'Color','Black',4000.00,1),(32,12,'Color','Silver',4200.00,1),(33,13,'Color','Blue',3000.00,1),(34,13,'Color','Pink',3200.00,1),(35,14,'Capacity','6.5 QT',8000.00,1),(36,14,'Capacity','8 QT',9000.00,1),(37,15,'Color','Red',15000.00,1),(38,15,'Color','Black',15500.00,1),(39,16,'Size','6 L',7000.00,1),(40,16,'Size','8 L',7500.00,1),(41,17,'Color','Black',5500.00,1),(42,17,'Color','White',5700.00,1),(43,18,'Size','3.5 L',10000.00,1),(44,18,'Size','4.2 L',11000.00,1),(45,19,'Size','6.5 QT',8000.00,1),(46,19,'Size','8 QT',8500.00,1),(47,20,'Model','Model A',12000.00,1),(48,20,'Model','Model B',13000.00,1),(49,21,'RAM','6GB',200000.00,1),(50,21,'Color','Black',200000.00,1),(51,21,'Color','White',200000.00,1),(52,22,'RAM','8GB',180000.00,1),(53,22,'Color','Gray',180000.00,1),(54,22,'Color','Gold',180000.00,1),(55,23,'RAM','8GB',120000.00,1),(56,23,'Color','Blue',120000.00,1),(57,23,'Color','Black',120000.00,1),(58,24,'RAM','8GB',150000.00,1),(59,24,'Color','White',150000.00,1),(60,24,'Color','Black',150000.00,1),(61,25,'RAM','6GB',70000.00,1),(62,25,'Color','Red',70000.00,1),(63,25,'Color','Green',70000.00,1),(64,26,'RAM','8GB',90000.00,1),(65,26,'Color','Black',90000.00,1),(66,26,'Color','Silver',90000.00,1),(67,27,'RAM','12GB',110000.00,1),(68,27,'Color','Blue',110000.00,1),(69,27,'Color','Gold',110000.00,1),(70,28,'RAM','8GB',95000.00,1),(71,28,'Color','Purple',95000.00,1),(72,28,'Color','Black',95000.00,1),(73,29,'RAM','4GB',20000.00,1),(74,29,'Color','Gray',20000.00,1),(75,29,'Color','Blue',20000.00,1),(76,30,'RAM','6GB',60000.00,1),(77,30,'Color','Black',60000.00,1),(78,30,'Color','White',60000.00,1),(79,31,'RAM','8GB',55000.00,1),(80,31,'Color','Green',55000.00,1),(81,31,'Color','Black',55000.00,1),(82,32,'RAM','12GB',80000.00,1),(83,32,'Color','Gray',80000.00,1),(84,32,'Color','Red',80000.00,1),(85,33,'RAM','16GB',220000.00,1),(86,33,'Color','Black',220000.00,1),(87,33,'Color','White',220000.00,1),(88,34,'RAM','4GB',30000.00,1),(89,34,'Color','Blue',30000.00,1),(90,34,'Color','Red',30000.00,1),(91,35,'RAM','8GB',230000.00,1),(92,35,'Color','Gold',230000.00,1),(93,35,'Color','Black',230000.00,1),(94,36,'RAM','6GB',40000.00,1),(95,36,'Color','Black',40000.00,1),(96,36,'Color','Blue',40000.00,1),(97,37,'RAM','8GB',200000.00,1),(98,37,'Color','White',200000.00,1),(99,37,'Color','Black',200000.00,1),(100,38,'RAM','8GB',80000.00,1),(101,38,'Color','Gray',80000.00,1),(102,38,'Color','Pink',80000.00,1),(103,39,'RAM','6GB',60000.00,1),(104,39,'Color','Blue',60000.00,1),(105,39,'Color','Black',60000.00,1),(106,40,'RAM','8GB',45000.00,1),(107,40,'Color','Red',45000.00,1),(108,40,'Color','White',45000.00,1),(109,41,'Size','55 inch',50000.00,1),(110,41,'Color','Black',50000.00,1),(111,42,'Size','65 inch',75000.00,1),(112,42,'Color','Silver',75000.00,1),(113,43,'Size','75 inch',100000.00,1),(114,43,'Color','Black',100000.00,1),(115,44,'Size','55 inch',85000.00,1),(116,44,'Color','Gray',85000.00,1),(117,45,'Size','65 inch',120000.00,1),(118,45,'Color','Black',120000.00,1),(119,46,'Type','TV Mount',2000.00,1),(120,46,'Type','HDMI Cable',500.00,1),(121,47,'Type','Soundbar',15000.00,1),(122,48,'Type','HDMI Cable',500.00,1),(123,49,'Type','TV Stand',10000.00,1),(124,50,'Type','Projector',40000.00,1),(125,51,'Size','10 inch',20000.00,1),(126,52,'Type','Smart TV Box',12000.00,1),(127,53,'Type','Wall Mount',3000.00,1),(128,54,'Size','32 inch',40000.00,1),(129,55,'Size','50 inch',60000.00,1),(130,56,'Size','43 inch',55000.00,1),(131,57,'Color','Black',12000.00,1),(132,57,'Color','White',12000.00,1),(133,58,'Color','Black',8000.00,1),(134,58,'Color','Blue',8000.00,1),(135,59,'Size','2.1 Channel',25000.00,1),(136,60,'Color','Red',7000.00,1),(137,60,'Color','Grey',7000.00,1),(138,61,'Size','5.1 Channel',50000.00,1),(139,62,'Color','Silver',15000.00,1),(140,63,'Type','Dynamic',3000.00,1),(141,64,'Channel','4 Channel',20000.00,1),(142,65,'Color','Wood',15000.00,1),(143,66,'Power','200W',22000.00,1),(144,67,'Color','Black',5000.00,1),(145,68,'Size','3 Speakers',35000.00,1),(146,69,'Color','Blue',6000.00,1),(147,70,'Type','Streaming',15000.00,1),(148,71,'Size','4 Speakers',18000.00,1),(149,72,'Power','20W',10000.00,1),(150,73,'Type','Acoustic',3000.00,1),(151,74,'Color','Black',30000.00,1),(152,74,'Color','Silver',30000.00,1),(153,75,'Color','Blue',15000.00,1),(154,75,'Color','Black',15000.00,1),(155,76,'Color','White',8000.00,1),(156,76,'Color','Black',8000.00,1),(157,77,'Color','Black',50000.00,1),(158,77,'Color','White',50000.00,1),(159,78,'Size','Small',12000.00,1),(160,78,'Size','Large',12000.00,1),(161,79,'Size','Standard',7000.00,1),(162,80,'Size','Regular',10000.00,1),(163,81,'Color','Gold',18000.00,1),(164,82,'Color','Black',25000.00,1),(165,83,'Size','M',45000.00,1),(166,83,'Size','L',45000.00,1),(167,84,'Size','10-inch',1500.00,1),(168,84,'Size','12-inch',1800.00,1),(169,85,'Pieces','5-Piece Set',7500.00,1),(170,85,'Pieces','7-Piece Set',8500.00,1),(171,86,'Size','8-inch',3200.00,1),(172,86,'Size','10-inch',3800.00,1),(173,87,'Size','2-quart',2500.00,1),(174,87,'Size','3-quart',3000.00,1),(175,88,'Color','Black',4500.00,1),(176,88,'Color','Silver',4700.00,1),(177,89,'Capacity','1.5 liters',3000.00,1),(178,89,'Capacity','2 liters',3500.00,1),(179,90,'Size','4-slice',8500.00,1),(180,90,'Size','6-slice',9500.00,1),(181,91,'Color','White',12500.00,1),(182,91,'Color','Red',13000.00,1),(183,92,'Set','5-piece',3500.00,1),(184,93,'Material','Wood',1200.00,1),(185,94,'Size','Large',2000.00,1),(186,95,'Material','Plastic',1100.00,1),(187,96,'Material','Porcelain',4500.00,1),(188,97,'Set','6-piece',2500.00,1),(189,98,'Material','Stainless Steel',5500.00,1),(190,99,'Material','Glass',3500.00,1),(191,100,'Material','Stainless Steel',800.00,1),(192,101,'Material','Stainless Steel',1200.00,1),(193,102,'Material','Plastic',1500.00,1),(194,103,'Material','Stainless Steel',1800.00,1),(195,104,'Color','Blue',5000.00,1),(196,104,'Color','Red',5000.00,1),(197,105,'Size','Small',1500.00,1),(198,105,'Size','Large',1500.00,1),(199,106,'Type','Analog',3000.00,1),(200,106,'Type','Digital',3000.00,1),(201,107,'Color','Green',2000.00,1),(202,107,'Color','Yellow',2000.00,1),(203,108,'Size','Medium',800.00,1),(204,108,'Size','Large',800.00,1),(205,109,'Color','White',15000.00,1),(206,109,'Color','Grey',15000.00,1),(207,110,'Material','Wood',4000.00,1),(208,110,'Material','Metal',4000.00,1),(209,111,'Color','Black',2500.00,1),(210,111,'Color','White',2500.00,1),(211,112,'Size','Medium',8000.00,1),(212,112,'Size','Large',8000.00,1),(213,113,'Material','Plastic',3000.00,1),(214,113,'Material','Metal',3000.00,1),(215,114,'Color','Silver',5000.00,1),(216,114,'Color','Black',5000.00,1),(217,115,'Color','White',6000.00,1),(218,115,'Color','Black',6000.00,1),(219,116,'Type','Basic',7000.00,1),(220,116,'Type','Deluxe',7000.00,1),(221,117,'Color','Red',1500.00,1),(222,117,'Color','Blue',1500.00,1),(223,118,'Color','Gold',2000.00,1),(224,118,'Color','Silver',2000.00,1),(225,119,'Size','Small',1500.00,1),(226,119,'Size','Large',1500.00,1),(227,120,'Material','Ceramic',4000.00,1),(228,120,'Material','Glass',4000.00,1),(229,121,'Size','Small',3000.00,1),(230,121,'Size','Medium',3000.00,1),(231,122,'Scent','Lavender',1200.00,1),(232,122,'Scent','Vanilla',1200.00,1),(233,124,'Size','50ml',2500.00,1),(234,124,'Size','100ml',4000.00,1),(235,124,'Fragrance','Rose',2500.00,1),(236,125,'Size','100ml',1800.00,1),(237,125,'Size','200ml',3200.00,1),(238,125,'Fragrance','Coconut',1800.00,1),(239,126,'Size','30ml',3000.00,1),(240,126,'Size','50ml',5000.00,1),(241,126,'Type','Hydrating',3000.00,1),(242,127,'Size','150ml',1200.00,1),(243,127,'Size','250ml',1800.00,1),(244,127,'Type','Foaming',1200.00,1),(245,128,'Type','Sheet Mask',800.00,1),(246,128,'Type','Clay Mask',1200.00,1),(247,128,'Type','Peel-off Mask',1000.00,1),(248,129,'Shade','Beige',3500.00,1),(249,129,'Shade','Natural',3500.00,1),(250,129,'Finish','Matte',3500.00,1),(251,130,'Shade','Red',1200.00,1),(252,130,'Shade','Pink',1200.00,1),(253,130,'Finish','Glossy',1200.00,1),(254,131,'Shade','Black',1500.00,1),(255,131,'Shade','Brown',1500.00,1),(256,131,'Type','Waterproof',1500.00,1),(257,132,'Shade','Warm',4500.00,1),(258,132,'Shade','Cool',4500.00,1),(259,132,'Type','Matte',4500.00,1),(260,133,'Type','Repair',1000.00,1),(261,133,'Type','Moisturizing',2000.00,1),(262,133,'Type','Anti-Dandruff',1200.00,1),(263,134,'Type','Deep Conditioning',2200.00,1),(264,134,'Type','Leave-in',2000.00,1),(265,134,'Type','Repair',2400.00,1),(266,135,'Type','Light',1500.00,1),(267,135,'Type','Medium',1700.00,1),(268,135,'Type','Heavy',1900.00,1),(269,136,'Type','Moisturizing',1200.00,1),(270,136,'Type','Repairing',1500.00,1),(271,136,'Type','Color-Safe',1800.00,1),(272,137,'Type','Cream',1800.00,1),(273,137,'Type','Gel',1500.00,1),(274,137,'Type','Foam',2000.00,1),(275,138,'Type','Hydrating',1200.00,1),(276,138,'Type','Nourishing',1300.00,1),(277,138,'Type','Frizz Control',1500.00,1),(278,139,'Type','Floral',4000.00,1),(279,139,'Type','Citrus',4000.00,1),(280,139,'Type','Woody',4000.00,1),(281,140,'Type','Fresh',3000.00,1),(282,140,'Type','Sweet',3000.00,1),(283,140,'Type','Spicy',3000.00,1),(284,141,'Type','Citrus',1500.00,1),(285,141,'Type','Floral',1500.00,1),(286,141,'Type','Mint',1500.00,1),(287,142,'Type','Aromatic',3500.00,1),(288,142,'Type','Citrus',3500.00,1),(289,142,'Type','Woody',3500.00,1),(290,143,'Type','Floral',3000.00,1),(291,143,'Type','Woody',3000.00,1),(292,143,'Type','Citrus',3000.00,1),(293,144,'Type','Matte',800.00,1),(294,144,'Type','Glossy',800.00,1),(295,144,'Type','Sheer',800.00,1),(296,145,'Type','Tinted',500.00,1),(297,145,'Type','Untinted',500.00,1),(298,145,'Type','Flavored',500.00,1),(299,146,'Type','Setting',1500.00,1),(300,146,'Type','Finishing',1500.00,1),(301,146,'Type','Hydrating',1500.00,1),(302,147,'Type','Liquid',1800.00,1),(303,147,'Type','Cream',1800.00,1),(304,147,'Type','Stick',1800.00,1),(305,148,'Type','Medium',1200.00,1),(306,148,'Type','Full',1200.00,1),(307,148,'Type','Light',1200.00,1),(308,149,'Type','Scrub',950.00,1),(309,149,'Type','Gel',950.00,1),(310,149,'Type','Cream',950.00,1),(311,150,'Type','Hydrating',1350.00,1),(312,150,'Type','Refreshing',1350.00,1),(313,150,'Type','Soothing',1350.00,1),(314,151,'Type','Aloe Vera',1200.00,1),(315,151,'Type','Rosewater',1200.00,1),(316,151,'Type','Lavender',1200.00,1),(317,152,'Type','Anti-Aging',2800.00,1),(318,152,'Type','Brightening',2800.00,1),(319,152,'Type','Hydrating',2800.00,1),(320,153,'Type','Balm',2200.00,1),(321,153,'Type','Oil',2200.00,1),(322,153,'Type','Cream',2200.00,1),(323,154,'Type','Matte',1800.00,1),(324,154,'Type','Shimmer',1800.00,1),(325,154,'Type','Liquid',1800.00,1),(326,155,'Type','Hydrating',500.00,1),(327,155,'Type','Nourishing',500.00,1),(328,155,'Type','Repairing',500.00,1),(329,156,'Type','Regular',600.00,1),(330,156,'Type','Extra Strength',700.00,1),(331,156,'Type','Sensitive Skin',800.00,1),(332,157,'Type','Fragrance',2500.00,1),(333,157,'Type','Unscented',2500.00,1),(334,157,'Type','Moisturizing',2500.00,1);
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-30  0:37:34
