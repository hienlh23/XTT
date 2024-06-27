create database webaccount
USE webaccount
go

drop database webaccount



CREATE TABLE [Role]
(
  role_id INT IDENTITY(1,1) NOT NULL,
  role_name NVARCHAR(50) NOT NULL,
  PRIMARY KEY (role_id)
);

CREATE TABLE [User] 
(
	user_id int identity(1,1) primary key,
    username NVARCHAR(50) NOT NULL,
    password NVARCHAR(50) NOT NULL,
    nickname NVARCHAR(100),
    email NVARCHAR(100),
	user_picture nvarchar(500),
    role_id INT NOT NULL,
	active bit not null,
  FOREIGN KEY (role_id) REFERENCES Role(role_id)
);

CREATE TABLE Category
(
  category_id INT IDENTITY(1,1) NOT NULL,
  category_name NVARCHAR(100) NOT NULL,
  PRIMARY KEY (category_id)
);
CREATE TABLE Product
(
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name NVARCHAR(100) NOT NULL,
	product_status int not null,
	product_date DATE not null,
    product_price float NOT NULL,
	product_title nvarchar(50) not null,
	product_note nvarchar(MAX),
	user_id int not null,
	product_picture nvarchar(500),
	category_id INT,
	FOREIGN KEY (user_id) REFERENCES [User](user_id),
	FOREIGN KEY (category_id) REFERENCES Category(category_id)
);


CREATE TABLE [Order]
(
	order_id int identity(1,1) primary key,
	checkout_date DATE not null,
	order_status int not null,
	user_id int not null,
	 product_id INT not null,
	 FOREIGN KEY (product_id) REFERENCES Product(product_id),
	FOREIGN KEY (user_id) REFERENCES [User](user_id)

);

Create table [Notification](
	notification_id int identity(1,1) primary key,
	notification_title nvarchar(200) not null,
	notification_body nvarchar(max) not null,
	notification_picture nvarchar(500),
	notification_date DATE NOT NULL,
	user_id int not null,
	FOREIGN KEY (user_id) REFERENCES [User](user_id)
);

create table Wallet 
(
	wallet_id int identity(1,1) primary key,
	wallet_money float,
	wallet_sol float,
	user_id int not null,
	FOREIGN KEY (user_id) REFERENCES [User](user_id)

);