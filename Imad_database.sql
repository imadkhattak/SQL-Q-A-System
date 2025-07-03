-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: imad_database
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
  `aisle_id` int NOT NULL,
  `aisle_label` varchar(50) NOT NULL,
  `product_category` int DEFAULT NULL,
  `row_no` int NOT NULL,
  `column_no` int NOT NULL,
  `shelf_count` int NOT NULL,
  `capacity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`aisle_id`),
  UNIQUE KEY `aisle_label` (`aisle_label`),
  KEY `product_category` (`product_category`),
  CONSTRAINT `aisle_ibfk_1` FOREIGN KEY (`product_category`) REFERENCES `category` (`category_id`)
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
  `category_id` int NOT NULL,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronics'),(2,'Smartphones'),(3,'TVs'),(4,'Audio'),(5,'Wearables'),(6,'Cookware'),(7,'Kitchen Appliances'),(8,'Home Organization'),(9,'Dinnerware'),(10,'Kitchen Tools'),(11,'Home Decor'),(12,'Furniture'),(13,'Lighting'),(14,'Kitchen Gadgets'),(15,'Home Accessories'),(16,'Decorative Items'),(17,'Furniture'),(18,'Lighting'),(19,'Kitchen Appliances'),(20,'Home Decor'),(21,'Skincare'),(22,'Makeup'),(23,'Haircare'),(24,'Fragrances'),(25,'Nailcare');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Ali Khan','ali.khan@example.com','03001234567','123 Main St, Lahore','2025-07-02 07:18:45','2025-07-02 07:18:45'),(2,'Sara Ali','sara.ali@example.com','03007894567','456 Elm St, Karachi','2025-07-02 07:18:45','2025-07-02 07:18:45'),(3,'Ahmed Raza','ahmed.raza@example.com','03005678901','789 Oak St, Islamabad','2025-07-02 07:18:45','2025-07-02 07:18:45'),(4,'Ayesha Khan','ayesha.khan@example.com','03003456789','901 Maple St, Peshawar','2025-07-02 07:18:45','2025-07-02 07:18:45'),(5,'Omar Farooq','omar.farooq@example.com','03002345678','234 Pine St, Quetta','2025-07-02 07:18:45','2025-07-02 07:18:45');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
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
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `cnic` (`cnic`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Ali khan','Ali.khan@example.com','03001234567',1,'2020-01-01','Male','123 Main St','Lahore',30,'4210112345678','2025-07-02 07:18:25','2025-07-02 07:18:25'),(2,'Juniad Afridi','junaid.afridi@example.com','03007894567',2,'2018-06-01','Female','456 Elm St','Karachi',35,'4210112345679','2025-07-02 07:18:25','2025-07-02 07:18:25'),(3,'Salman khan','Salman.khan@example.com','03005678901',3,'2020-03-01','Male','789 Oak St','Islamabad',40,'4210112345680','2025-07-02 07:18:25','2025-07-02 07:18:25'),(4,'Arsalan khattak','Arsalan.Khattak@example.com','03003456789',4,'2019-09-01','Female','901 Maple St','Peshawar',28,'4210112345681','2025-07-02 07:18:25','2025-07-02 07:18:25'),(5,'Hamza khan','Hamza.khan@example.com','03002345678',5,'2020-09-01','Male','234 Pine St','Quetta',32,'4210112345682','2025-07-02 07:18:25','2025-07-02 07:18:25');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interaction`
--

DROP TABLE IF EXISTS `interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interaction` (
  `interaction_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `interaction_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `interaction_type` enum('Phone','Email','In-person') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`interaction_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `interaction_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `interaction_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaction`
--

LOCK TABLES `interaction` WRITE;
/*!40000 ALTER TABLE `interaction` DISABLE KEYS */;
INSERT INTO `interaction` VALUES (1,1,1,'2022-01-01 10:00:00','In-person','2025-07-02 07:21:27','2025-07-02 07:21:27'),(2,2,2,'2022-01-02 11:00:00','Phone','2025-07-02 07:21:27','2025-07-02 07:21:27'),(3,3,3,'2022-01-03 12:00:00','Email','2025-07-02 07:21:27','2025-07-02 07:21:27'),(4,4,4,'2022-01-04 13:00:00','In-person','2025-07-02 07:21:27','2025-07-02 07:21:27'),(5,5,5,'2022-01-05 14:00:00','Phone','2025-07-02 07:21:27','2025-07-02 07:21:27');
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
INSERT INTO `mall_information` VALUES (1,'Peshawar','051-9875643','University raod Peshawar, Pakistan','10:00 AM - 10:00 PM');
/*!40000 ALTER TABLE `mall_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
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
  KEY `subcategory_id` (`subcategory_id`),
  KEY `rack_id` (`rack_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`subcategory_id`),
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`rack_id`) REFERENCES `racks` (`rack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `rack_id` int NOT NULL,
  `rack_label` varchar(255) NOT NULL,
  `location_description` varchar(255) NOT NULL,
  `floor` varchar(45) NOT NULL,
  PRIMARY KEY (`rack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racks`
--

LOCK TABLES `racks` WRITE;
/*!40000 ALTER TABLE `racks` DISABLE KEYS */;
INSERT INTO `racks` VALUES (1,'A1','Main Electronics Section','Ground Floor'),(2,'B2','Smartphone Display Area','First Floor'),(3,'C3','TV and Audio Section','Second Floor'),(4,'D4','Home Appliance Section','Ground Floor'),(5,'E5','Wearables and Accessories','First Floor'),(6,'F6','Cookware and Kitchen Utensils','Second Floor'),(7,'G7','Home Decor and Furniture','Third Floor'),(8,'H8','Beauty and Personal Care','Fourth Floor');
/*!40000 ALTER TABLE `racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund` (
  `refund_id` int NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `refund_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `reason` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`refund_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  CONSTRAINT `refund_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund`
--

LOCK TABLES `refund` WRITE;
/*!40000 ALTER TABLE `refund` DISABLE KEYS */;
INSERT INTO `refund` VALUES (1,1,1,1,'2022-01-06 10:00:00','Defective product','2025-07-02 07:22:20','2025-07-02 07:22:20'),(2,2,2,1,'2022-01-07 11:00:00','Not satisfied with product','2025-07-02 07:22:20','2025-07-02 07:22:20'),(3,3,3,1,'2022-01-08 12:00:00','Product not as described','2025-07-02 07:22:20','2025-07-02 07:22:20');
/*!40000 ALTER TABLE `refund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restocks`
--

DROP TABLE IF EXISTS `restocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restocks` (
  `restock_id` int NOT NULL,
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
INSERT INTO `restocks` VALUES (1,1,10,'2022-01-01 10:00:00'),(2,2,20,'2022-01-02 11:00:00'),(3,3,30,'2022-01-03 12:00:00'),(4,4,40,'2022-01-04 13:00:00'),(5,5,50,'2022-01-05 14:00:00');
/*!40000 ALTER TABLE `restocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `role_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Sales Representative','Responsible for assisting customers and making sales','2025-07-02 07:15:18','2025-07-02 07:15:18'),(2,'Store Manager','Oversees the daily operations of the store','2025-07-02 07:15:18','2025-07-02 07:15:18'),(3,'Customer Service Representative','Handles customer inquiries and issues','2025-07-02 07:15:18','2025-07-02 07:15:18'),(4,'Inventory Manager','Responsible for managing stock levels and ordering supplies','2025-07-02 07:15:18','2025-07-02 07:15:18'),(5,'Security Guard','Ensures the safety and security of the store and its customers','2025-07-02 07:15:18','2025-07-02 07:15:18');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `salary_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `salary_amount` decimal(10,2) NOT NULL,
  `pay_grade` varchar(10) NOT NULL,
  `effective_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`salary_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,1,30000.00,'A','2022-01-01','2025-07-02 07:24:32','2025-07-02 07:24:32'),(2,2,40000.00,'B','2022-01-01','2025-07-02 07:24:32','2025-07-02 07:24:32'),(3,3,35000.00,'A','2022-01-01','2025-07-02 07:24:32','2025-07-02 07:24:32'),(4,4,45000.00,'B','2022-01-01','2025-07-02 07:24:32','2025-07-02 07:24:32'),(5,5,32000.00,'A','2022-01-01','2025-07-02 07:24:32','2025-07-02 07:24:32');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sales_id` int NOT NULL,
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
INSERT INTO `sales` VALUES (1,1,2,'2022-01-01 10:00:00',110000.00),(2,2,1,'2022-01-02 11:00:00',75000.00),(3,3,3,'2022-01-03 12:00:00',36000.00),(4,4,2,'2022-01-04 13:00:00',100000.00),(5,5,1,'2022-01-05 14:00:00',2500.00);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_receive`
--

DROP TABLE IF EXISTS `stock_receive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_receive` (
  `receive_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `receive_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `supplier` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`receive_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `stock_receive_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_receive`
--

LOCK TABLES `stock_receive` WRITE;
/*!40000 ALTER TABLE `stock_receive` DISABLE KEYS */;
INSERT INTO `stock_receive` VALUES (1,1,50,'2022-01-01 10:00:00','ABC Suppliers','2025-07-02 07:24:18','2025-07-02 07:24:18'),(2,2,30,'2022-01-02 11:00:00','XYZ Distributors','2025-07-02 07:24:18','2025-07-02 07:24:18'),(3,3,20,'2022-01-03 12:00:00','PQR Wholesalers','2025-07-02 07:24:18','2025-07-02 07:24:18'),(4,4,40,'2022-01-04 13:00:00','MNO Traders','2025-07-02 07:24:18','2025-07-02 07:24:18'),(5,5,60,'2022-01-05 14:00:00','JKL Suppliers','2025-07-02 07:24:18','2025-07-02 07:24:18');
/*!40000 ALTER TABLE `stock_receive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` int NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `store_location` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Electronic World','Emporium Mall'),(2,'Fashion World','Packages Mall'),(3,'Home Appliances','Fortress Stadium'),(4,'Beauty Zone','Emporium Mall'),(5,'Kids World','Packages Mall');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `subcategory_id` int NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`subcategory_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'Home Appliances',1),(2,'Mobile Phones',2),(3,'Televisions',3),(4,'Speakers and Soundbars',4),(5,'Smartwatches and Fitness Trackers',5),(6,'Cookware and Bakeware',6),(7,'Small Kitchen Appliances',7),(8,'Storage and Organization',8),(9,'Dinnerware and Glassware',9),(10,'Kitchen Tools and Gadgets',10),(11,'Decorative Items',11),(12,'Furniture and Decor',12),(13,'Lighting Fixtures',13),(14,'Kitchen Appliances',14),(15,'Home Accessories',15),(16,'Decorative Items',16),(17,'Furniture',17),(18,'Lighting',18),(19,'Kitchen Appliances',19),(20,'Home Decor',20),(21,'Skincare Products',21),(22,'Makeup and Cosmetics',22),(23,'Haircare Products',23),(24,'Fragrances and Perfumes',24),(25,'Nailcare Products',25);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `variant_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `transaction_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_price` decimal(10,2) NOT NULL,
  `payment_method` enum('Cash','Card','Online') NOT NULL,
  `status` enum('Pending','Success','Failed') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  KEY `customer_id` (`customer_id`),
  KEY `variant_id` (`variant_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`variant_id`),
  CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,1,1,1,'2022-01-01 12:00:00',55000.00,'Cash','Success','2025-07-02 07:20:15','2025-07-02 07:20:15'),(2,2,2,2,1,'2022-01-02 13:00:00',75000.00,'Card','Success','2025-07-02 07:20:15','2025-07-02 07:20:15'),(3,3,3,3,2,'2022-01-03 14:00:00',24000.00,'Cash','Success','2025-07-02 07:20:15','2025-07-02 07:20:15'),(4,4,4,4,1,'2022-01-04 15:00:00',50000.00,'Card','Success','2025-07-02 07:20:15','2025-07-02 07:20:15'),(5,5,5,5,3,'2022-01-05 16:00:00',7500.00,'Cash','Success','2025-07-02 07:20:15','2025-07-02 07:20:15');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_item`
--

DROP TABLE IF EXISTS `transaction_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_item` (
  `transaction_item_id` int NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_item_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `transaction_item_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  CONSTRAINT `transaction_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_item`
--

LOCK TABLES `transaction_item` WRITE;
/*!40000 ALTER TABLE `transaction_item` DISABLE KEYS */;
INSERT INTO `transaction_item` VALUES (1,1,1,1,55000.00,'2025-07-02 07:20:30','2025-07-02 07:20:30'),(2,2,2,1,75000.00,'2025-07-02 07:20:30','2025-07-02 07:20:30'),(3,3,3,2,12000.00,'2025-07-02 07:20:30','2025-07-02 07:20:30'),(4,4,4,1,50000.00,'2025-07-02 07:20:30','2025-07-02 07:20:30'),(5,5,5,3,2500.00,'2025-07-02 07:20:30','2025-07-02 07:20:30');
/*!40000 ALTER TABLE `transaction_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variants` (
  `variant_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `variant_type` varchar(255) DEFAULT NULL,
  `variant_value` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`variant_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES (1,1,'Color','White',55000.00,1),(2,2,'Size','Large',75000.00,1),(3,3,'Storage','128GB',12000.00,1),(4,4,'Color','Black',50000.00,1),(5,5,'Size','Small',2500.00,1);
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

-- Dump completed on 2025-07-02 12:33:05
