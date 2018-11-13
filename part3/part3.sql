CREATE TABLE User_Account
    (
        Id INT UNSIGNED NOT NULL auto_increment,
        Email VARCHAR(256) NOT NULL UNIQUE,
        FirstName VARCHAR(255) NOT NULL,
        LastNAme VARCHAR(255) NOT NULL,
        Phone TINYINT UNSIGNED NOT NULL,
        StreetAddress VARCHAR(256) NOT NULL,
        City VARCHAR(255) NOT NULL,
        Zip MEDIUMINT UNSIGNED NOT NULL,
        Salt CHAR(10) NOT NULL,
        Hash CHAR(40) NOT NULL,
        PRIMARY KEY (Id)
    );
-- subscription_type table here
CREATE TABLE Payment_Method
    (

    );
-- invoice table here
-- profile table here
-- movie table here
-- genre table here
-- type_of table here
-- views_mobie table here
-- person table here
-- directed_by_mov table here