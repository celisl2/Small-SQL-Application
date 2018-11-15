CREATE TABLE User_Account
    (
        Id INT UNSIGNED NOT NULL auto_increment,
        Email VARCHAR(256) NOT NULL UNIQUE,
        FirstName VARCHAR(255) NOT NULL,
        LastName VARCHAR(255) NOT NULL,
        Phone VARCHAR(20) NOT NULL,
        StreetAddress VARCHAR(256) NOT NULL,
        City VARCHAR(255) NOT NULL,
        State VARCHAR(255) NOT NULL,
        Zip MEDIUMINT UNSIGNED NOT NULL,
        Salt CHAR(10) NOT NULL,
        Hash CHAR(40) NOT NULL,
        PRIMARY KEY (Id)
    );
CREATE TABLE Subscription_Type
    (
        Id INT UNSIGNED NOT NULL auto_increment,
        Name VARCHAR(255) NOT NULL UNIQUE,
        Screens TINYINT UNSIGNED NOT NULL,
        Price DECIMAL(5,2) NOT NULL,
        Description VARCHAR(500) NOT NULL,
        PRIMARY KEY (Id)
    );
CREATE TABLE Payment_Method
    (
        Id INT UNSIGNED NOT NULL auto_increment,
        CreditCardNumber VARCHAR(20) NOT NULL UNIQUE,
        CVV VARCHAR(4) NOT NULL,
        ExpirationDate DATE NOT NULL,
        AccID INT UNSIGNED NOT NULL,
        PRIMARY KEY (Id),
        FOREIGN KEY (AccID) REFERENCES User_Account(Id) ON UPDATE CASCADE ON DELETE CASCADE,
        UNIQUE KEY (CreditCardNumber, AccID)
    );
-- things to note, there can only be one auto_increment in each table acording to sql
    -- so if it is a foreign key that points to a primary key just dont put auto_increment
        -- because the primary key will handle the auto_increment
-- invoice table here = kim
-- profile table here = kim
-- movie table here  = kim
CREATE TABLE Genre
    (
        Id INT UNSIGNED NOT NULL auto_increment,
        Genre VARCHAR(255) NOT NULL UNIQUE,
        PRIMARY KEY (Id)
    );
CREATE TABLE Type_Of
    (
        MovieID INT UNSIGNED NOT NULL,
        GenreID INT UNSIGNED NOT NULL,
        PRIMARY KEY (MovieID, GenreID),
        FOREIGN KEY (MovieID) REFERENCES Movie(Id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (GenreID) REFERENCES Genre(Id) ON UPDATE CASCADE ON DELETE CASCADE
    );
-- views_movie table here = kim
-- directed_by_mov table here = kim
-- INSERTS GO HERE
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "emmekemammo-4655@yopmail.com", "Kieran", "Moses", "7632135215", "1069  Cherry Tree Drive", "Jacksonville", "FL", "32204", "9c8ffcdf2b", SHA1("9c8ffcdf2bpassword"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "ulatr@laparbgt.ga", "Dianne", "Altreche", "2706015202", "2982 Suscipit Ave","Galzignano Terme","Veneto","RT9 6CM", "vu2tdahq2m" , SHA1("vu2tdahq2mpassword"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "babde-1@bohani.tk", "Noe", "Freelon", "3876308409", "Ap #742-354 Phasellus St.","Salamanca","CL","33800-094", "tg7gpln2j2", SHA1("tg7gpln2j2password"));
INSERT INTO User_Account (ID, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "TheFloweryGamer@gmail.com", "Bob", "Claswell", "7025197831", "440-1535 Enim, Av.","Benalla","Victoria","14574", "7cs634v0e4", SHA1("7cs634v0e4password"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "ziiasxdb@imgof.com", "Tahani", "Moe", "8164589215", "Ap #735-4347 Placerat. Road","Pontevedra","GA","4761", "5mcjzx4pjd", SHA1("5mcjzx4pjdpassword"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "zoopjcym@abyssmail.com", "Chidi", "Ngani", "9178835792", "P.O. Box 130, 4895 In, St.","St. Petersburg","FL","78757", "ndenf7xy9b", SHA1("ndenf7xy9bpassword"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "zdixskyj@boximail.com", "Lesley", "Knope", "5012398162", "8749 Rutrum. Avenue","Kraków","MP","1570", "vxhcujlh6d", SHA1("vxhcujlh6dpassword"));