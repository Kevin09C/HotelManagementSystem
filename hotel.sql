create database if not exists hotel;
use hotel;

CREATE TABLE User(
  employeeID INT NOT NULL AUTO_INCREMENT,
  Name varchar(25) NOT NULL,
  Surname varchar(25) NOT NULL,
  PhoneNo INT NOT NULL,
  StreetNo INT NOT NULL,
  ApartamentNo INT NOT NULL,
  Role ENUM('ht_manager', 'rs_manager', 'waiter', 'receptionist', 'other') NOT NULL,
  Descrition varchar(255),
  Email varchar(50) NOT NULL,
  Password varchar(255) NOT NULL,
  PRIMARY KEY (employeeID)
);

CREATE TABLE RestaurantInvoice
(
  rInvoiceID INT auto_increment,
  rinvtime TIME NOT NULL,
  rinvdate DATE NOT NULL,
  employeeID INT NOT NULL,
  PRIMARY KEY (rInvoiceID),
  FOREIGN KEY (employeeID) REFERENCES User(employeeID)
);

CREATE TABLE Products 
(
	productID INT auto_increment, 
	sellingPrice INT NOT NULL,
	purchasePrice INT NOT NULL,
	description CHAR(255) NOT NULL,
	productName CHAR(50) NOT NULL,
    PRIMARY KEY (productID) 
);

CREATE TABLE Inventory
(
  productID INT auto_increment,
  productName CHAR(50) NOT NULL,
  productQuantity BIGINT NOT NULL,
  description CHAR(255) NOT NULL,
  sellingPrice INT NOT NULL,
  PRIMARY KEY (productID)
);

CREATE TABLE ManageSupplies
(
  transactionID INT auto_increment,
  manageSuppliesDate DATE NOT NULL,
  Quantity INT NOT NULL,
  purchasePrice INT NOT NULL,
  productName CHAR(50) NOT NULL,
  action ENUM('add', 'remove') NOT NULL,
  productID INT NOT NULL,
  employeeID INT NOT NULL,
  PRIMARY KEY (transactionID),
  FOREIGN KEY (productID) REFERENCES Inventory(productID),
  FOREIGN KEY (employeeID) REFERENCES User(employeeID)
);

CREATE TABLE RoomType
(
  price INT NOT NULL,
  typeName CHAR(20) NOT NULL,
  typeID INT auto_increment,
  PRIMARY KEY (typeID)
);

CREATE TABLE Client
(
  TimeOfRegs TIME NOT NULL,
  DateOfRegs DATE NOT NULL,
  clientID INT auto_increment,
  clientName CHAR(50) NOT NULL,
  Surname CHAR(50) NOT NULL,
  employeeID INT NOT NULL,
  PRIMARY KEY (clientID),
  FOREIGN KEY (employeeID) REFERENCES User(employeeID)
);

CREATE TABLE Room
(
  RoomID INT auto_increment,
  RoomNo varchar(20) NOT NULL,
  Floor INT NOT NULL,
  Status varchar(20) NOT NULL,
  typeID INT NOT NULL,
  PRIMARY KEY (RoomID),
  FOREIGN KEY (typeID) REFERENCES RoomType(typeID)
);

CREATE TABLE OrderProduct
(
  rInvoiceID INT NOT NULL,
  productID INT,
  PRIMARY KEY (rInvoiceID, productID),
  FOREIGN KEY (rInvoiceID) REFERENCES RestaurantInvoice(rInvoiceID),
  FOREIGN KEY (productID) REFERENCES Products(productID)
);

CREATE TABLE ClientRoom
(
  RequestTime TIME NOT NULL,
  stayStartDate DATE NOT NULL,
  stayEndDate DATE NOT NULL,
  requestID INT auto_increment,
  clientID INT,
  RoomID INT,
  employeeID INT NOT NULL,
  PRIMARY KEY (requestID),
  FOREIGN KEY (clientID) REFERENCES Client(clientID),
  FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
  FOREIGN KEY (employeeID) REFERENCES User(employeeID)
);
