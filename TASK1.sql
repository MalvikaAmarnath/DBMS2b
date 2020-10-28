CREATE DATABASE IF NOT EXISTS oktomook;
SHOW DATABASES;
USE oktomook;

	CREATE TABLE IF NOT EXISTS`customers` (
	  `customerNumber` INT NOT NULL,
	  `firstName` VARCHAR(45) NOT NULL,
	  `lastName` VARCHAR(45) NOT NULL,
	  `Address` VARCHAR(45) NOT NULL,
	  `city` VARCHAR(45) NOT NULL,
	  `State` ENUM('QLD', 'VIC', 'NSW', 'WA', 'TAS', 'NT', 'SA') NOT NULL,
	  `postcode` INT NOT NULL,
	  `region` VARCHAR(45) NOT NULL,
	  `email` VARCHAR(45) NOT NULL,
	  `Customerscol` VARCHAR(45) NOT NULL,
	  PRIMARY KEY (`customerNumber`)
	  )CHARACTER SET utf8;

DROP TABLE IF EXISTS `ordersitemss` ;
FLUSH TABLES `ordersitems` ;      
	
    CREATE TABLE IF NOT EXISTS `ordersitems` (
	  `orderNumber` INT NOT NULL,
	  `itemrNumber` INT NOT NULL,
	  `ISBN` INT(13) NOT NULL,
	  `quantity` INT(1) NOT NULL DEFAULT 1,
	  `paidEach` INT NOT NULL,
	  PRIMARY KEY (`orderNumber`)
	  )CHARACTER SET utf8;

     
	CREATE TABLE IF NOT EXISTS `author` (
	  `authorID` INT(11) NOT NULL,
	  `firstName` VARCHAR(45) NOT NULL,
	  `lastName` VARCHAR(45) NOT NULL,
	  PRIMARY KEY (`authorID`),
	  UNIQUE INDEX `authorID_UNIQUE` (`authorID` ASC)
	  )CHARACTER SET utf8;
 

	CREATE TABLE IF NOT EXISTS `publishers` (
	  `pubID` INT NOT NULL,
	  `name` VARCHAR(45) NOT NULL,
	  `contact` INT(20) NOT NULL,
	  `phone` INT(20) NOT NULL,
	  PRIMARY KEY (`pubID`),
	  UNIQUE INDEX `authorID_UNIQUE` (`name` ASC),
	  UNIQUE INDEX `ISBN_UNIQUE` (`pubID` ASC),
	  UNIQUE INDEX `contact_UNIQUE` (`contact` ASC),
	  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC)
      )CHARACTER SET utf8;

DROP TABLE IF EXISTS `orders` ;
FLUSH TABLES `orders` ;      
	CREATE TABLE `orders` (
	  `orderNumber` INT NOT NULL,
	  `customerNumber` INT NOT NULL,
	  `orderDate` DATE NOT NULL,
	  `shipDate` DATE NOT NULL,
	  `street` VARCHAR(45) NOT NULL,
	  `city` VARCHAR(45) NOT NULL,
	  `state` ENUM('QLD', 'VIC', 'NSW', 'WA', 'TAS', 'NT', 'SA') NOT NULL,
	  `postCode` INT NOT NULL,
	  `shipCost` INT NOT NULL,
	  PRIMARY KEY (`orderNumber`),
	  INDEX `customerNumber_idx` (`customerNumber` ASC),
	  CONSTRAINT `customerNumber`
		FOREIGN KEY (`customerNumber`)
		REFERENCES `customers` (`customerNumber`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
        FOREIGN KEY (orderNumber) REFERENCES ordersitems (orderNumber)
        ON DELETE CASCADE
		ON UPDATE CASCADE)CHARACTER SET utf8;

	
    CREATE TABLE IF NOT EXISTS `books` (
	  `ISBN` INT(13) NOT NULL,
	  `title` VARCHAR(45) NOT NULL,
	  `pubDate` DATE NOT NULL,
	  `pubID` INT NOT NULL,
	  `Cost` INT NOT NULL,
	  `Retail` VARCHAR(45) NOT NULL,
	  `Discount` VARCHAR(45) NOT NULL,
	  `category` ENUM('Fitness', 'Children', 'Computer', 'Cooking', 'Business', 'Literature') NOT NULL,
	  PRIMARY KEY (`ISBN`),
      CONSTRAINT `pubID`
	  FOREIGN KEY (pubID) REFERENCES publishers (pubID)
	  ON DELETE CASCADE
	  ON UPDATE CASCADE)CHARACTER SET utf8;
      
	CREATE TABLE IF NOT EXISTS `wrote` (
	  `ISBN` INT(13) NOT NULL,
	  `authorID` INT(11) NOT NULL,
	  PRIMARY KEY (`authorID`, `ISBN`),
	  UNIQUE INDEX `authorID_UNIQUE` (`authorID` ASC),
	  UNIQUE INDEX `ISBN_UNIQUE` (`ISBN` ASC),
      FOREIGN KEY (authorID) REFERENCES author (authorID)
        ON DELETE CASCADE
		ON UPDATE CASCADE,
	  FOREIGN KEY (ISBN) REFERENCES books (ISBN)
        ON DELETE CASCADE
		ON UPDATE CASCADE
	  )CHARACTER SET utf8;
 

      
	
			
	
	

      
	
      
	