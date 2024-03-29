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
CREATE TABLE Invoice
    (
        Id INT UNSIGNED NOT NULL auto_increment,
        InvoiceID INT UNSIGNED NOT NULL UNIQUE,
        ServiceStart DATE NOT NULL,
        AccID INT UNSIGNED NOT NULL,
        SubID INT UNSIGNED NOT NULL,
        PaymentID INT UNSIGNED NOT NULL,
        PurchaseAmount DECIMAL (5, 2) NOT NULL,
        PRIMARY KEY (Id),
        FOREIGN KEY (AccID) REFERENCES User_Account(Id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (SubID) REFERENCES Subscription_Type(Id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (PaymentID) REFERENCES Payment_Method(Id) ON UPDATE CASCADE ON DELETE CASCADE
    );
CREATE TABLE Profile
    (
        Id INT UNSIGNED NOT NULL auto_increment,
        Name VARCHAR(255) NOT NULL,
        AccID INT UNSIGNED NOT NULL,
        PRIMARY KEY (Id),
        FOREIGN KEY (AccID) REFERENCES User_Account(Id) ON UPDATE CASCADE ON DELETE CASCADE,
        UNIQUE KEY (AccID, Name)
    );
CREATE TABLE Movie
    (
        Id INT UNSIGNED NOT NULL auto_increment,
        Name VARCHAR(255) NOT NULL,
        YearReleased SMALLINT(4) NOT NULL,
        RunTime SMALLINT (3) NOT NULL,
        Description MEDIUMTEXT,
        PRIMARY KEY (Id),
        UNIQUE KEY (Name, YearReleased)
    );   
CREATE TABLE Genre
    (
        Id INT UNSIGNED NOT NULL auto_increment,
        Genre VARCHAR(255) NOT NULL UNIQUE,
        PRIMARY KEY (Id)
    );
CREATE TABLE Type_Of
    (
        MovieID INT UNSIGNED,
        GenreID INT UNSIGNED,
        PRIMARY KEY (MovieID, GenreID),
        FOREIGN KEY (MovieID) REFERENCES Movie(Id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (GenreID) REFERENCES Genre(Id) ON UPDATE CASCADE ON DELETE CASCADE
    );
CREATE TABLE Views_Movie
    (
        MovieID INT UNSIGNED,
        ProfileID INT UNSIGNED,
        PercentComplete DECIMAL (4, 2) NOT NULL,
        PRIMARY KEY (MovieID, ProfileID),
        FOREIGN KEY (MovieID) REFERENCES Movie(Id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (ProfileID) REFERENCES Profile(Id) ON UPDATE CASCADE ON DELETE CASCADE
    );
CREATE TABLE Person
    (
        Id INT UNSIGNED NOT NULL auto_increment,
        FirstName VARCHAR(255) NOT NULL,
        LastName VARCHAR(255) NOT NULL,
        Sex CHAR(1),
        PRIMARY KEY (Id)
    );
CREATE TABLE Directed_By_Mov
    (
        MovieID INT UNSIGNED,
        PersonID INT UNSIGNED,
        PRIMARY KEY (MovieID, PersonID),
        FOREIGN KEY (MovieID) REFERENCES Movie(Id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (PersonID) REFERENCES Person(Id) ON UPDATE CASCADE ON DELETE CASCADE
    ); 

-- INSERTS GO HERE
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "emmekemammo-4655@yopmail.com", "Kieran", "Moses", "7632135215", "1069  Cherry Tree Drive", "Jacksonville", "NC", 32204, "9c8ffcdf2b", SHA1("9c8ffcdf2bpassword"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "ulatr@laparbgt.ga", "Dianne", "Altreche", "2706015202", "2982 Suscipit Ave","Galzignano Terme","Veneto",28277, "vu2tdahq2m" , SHA1("vu2tdahq2mpassword"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "babde-1@bohani.tk", "Noe", "Freelon", "3876308409", "Ap #742-354 Phasellus St.","Salamanca","CL",29715, "tg7gpln2j2", SHA1("tg7gpln2j2password"));
INSERT INTO User_Account (ID, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "TheFloweryGamer@gmail.com", "Bob", "Claswell", "7025197831", "440-1535 Enim, Av.","Benalla","Victoria",14574, "7cs634v0e4", SHA1("7cs634v0e4password"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "ziiasxdb@imgof.com", "Tahani", "Moe", "8164589215", "Ap #735-4347 Placerat. Road","Pontevedra","FL",4761, "5mcjzx4pjd", SHA1("5mcjzx4pjdpassword"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "zoopjcym@abyssmail.com", "Chidi", "Ngani", "9178835792", "P.O. Box 130, 4895 In, St.","St. Petersburg","FL",78757, "ndenf7xy9b", SHA1("ndenf7xy9bpassword"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "zdixskyj@boximail.com", "Lesley", "Knope", "5012398162", "8749 Rutrum. Avenue","Kraków","MP","1570", "vxhcujlh6d", SHA1("vxhcujlh6dpassword"));                                                                                                                                      

INSERT INTO Subscription_Type (Id, Name, Screens, Price, Description)
VALUES (NULL, "Standard", 2, 10.99, "Two screens with HD and downloads");
INSERT INTO Subscription_Type (Id, Name, Screens, Price, Description)
VALUES (NULL, "Basic", 1, 7.99, "One screen basic");
INSERT INTO Subscription_Type (Id, Name, Screens, Price, Description)
VALUES (NULL, "Premium", 4, 13.99, "4 screens with Ultra HD and downloads");


INSERT INTO Payment_Method (Id, CreditCardNumber, CVV, ExpirationDate, AccID)
VALUES (NULL, "4790660089521535", "884", 20230501, 1);
INSERT INTO Payment_Method (Id, CreditCardNumber, CVV, ExpirationDate, AccID)
VALUES (NULL, "5528379801057043", "063", 20260401, 2);
INSERT INTO Payment_Method (Id, CreditCardNumber, CVV, ExpirationDate, AccID)
VALUES (NULL, "5038616215469295", "130", 20281201, 3);
INSERT INTO Payment_Method (Id, CreditCardNumber, CVV, ExpirationDate, AccID)
VALUES (NULL, "348770964799265", "8705", 20280401, 4);
INSERT INTO Payment_Method (Id, CreditCardNumber, CVV, ExpirationDate, AccID)
VALUES (NULL, "6011175300693334", "442", 20270301, 5);
INSERT INTO Payment_Method (Id, CreditCardNumber, CVV, ExpirationDate, AccID)
VALUES (NULL, "6211175300693334", "442", 20270301, 6);
INSERT INTO Payment_Method (Id, CreditCardNumber, CVV, ExpirationDate, AccID)
VALUES (NULL, "5028379801057043", "063", 20260401, 7);
                                                                                                                                       
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AccID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, 123456, 20151225, 1, 2, 1, 7.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AccID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, 987654, 20130303, 2, 1, 2, 10.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AccID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, 246802, 20150419, 3, 2, 3, 7.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AccID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, 135791, 20181013, 4, 3, 4, 13.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AccID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, 030398, 20171205, 5, 1, 5, 10.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AccID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, 120592, 20160618, 6, 1, 6, 10.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AccID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, 061864, 20180812, 7, 3, 7, 13.99);  
                                                                                                                                       
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, "MosesK", 1);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, "AltrecheD", 2);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, "FreelonN", 3);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, "ClaswellB", 4);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, "MoeT", 5);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, "NganiC", 6);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, "KnopeL", 7);                                                                                                                                       

INSERT INTO Movie (Id, Name, YearReleased, RunTime, Description)
VALUES (1, "Mean Girls", 2004, 97, "Cadie unwittingly finds herself in the good graces of an elite group of cool students dubbed The Plastics, but Cady soon realizes how her shallow group of new friends earned this nickname.");
INSERT INTO Movie (Id, Name, YearReleased, RunTime, Description)
VALUES (2, "Get Out", 2017, 104, "At first, Chris reads the family's overly accommodating behavior as nervous attempts to deal with their daughter's interracial relationship, but as the weekend progresses, a series of increasingly disturbing discoveries lead him to a truth that he never could have imagined.");
INSERT INTO Movie (Id, Name, YearReleased, RunTime, Description)
VALUES (3, "The Lion King", 1994, 89, "This Disney animated feature follows the adventures of the young lion Simba, the heir of his father, Mufasa. Simba's wicked uncle, Scar, plots to usurp Mufasa's throne by luring father and son into a stampede of wildebeests. But Simba escapes, and only Mufasa is killed. Simba returns as an adult to take back his homeland from Scar with the help of his friends Timon and Pumbaa.");
INSERT INTO Movie (Id, Name, YearReleased, RunTime, Description)
VALUES (4, "Harry Potter and the Goblet of Fire", 2005, 157, "The fourth movie in the Harry Potter franchise sees Harry returning for his fourth year at Hogwarts School of Witchcraft and Wizardry, along with his friends, Ron and Hermione. There is an upcoming tournament between the three major schools of magic, with one participant selected from each school by the Goblet of Fire. When Harry's name is drawn, even though he is not eligible and is a fourth player, he must compete in the dangerous contest.");
INSERT INTO Movie (Id, Name, YearReleased, RunTime, Description)
VALUES (5, "Zootopia", 2016, 110, "From the largest elephant to the smallest shrew, the city of Zootopia is a mammal metropolis where various animals live and thrive. When Judy Hopps becomes the first rabbit to join the police force, she quickly learns how tough it is to enforce the law. Determined to prove herself, Judy jumps at the opportunity to solve a mysterious case. Unfortunately, that means working with Nick Wilde, a wily fox who makes her job even harder.");
INSERT INTO Movie (Id, Name, YearReleased, RunTime, Description)
VALUES (6, "Hurricane Bianca", 2016, 84, "A teacher from New York moves to a small town in Texas and is quickly fired for being gay. He soon returns dressed as a mean lady to get revenge on the nasty townspeople.");
INSERT INTO Movie (Id, Name, YearReleased, RunTime, Description)
VALUES (7, "Star Wars: The Last Jedi", 2017, 156, "Luke Skywalker's peaceful and solitary existence gets upended when he encounters Rey, a young woman who shows strong signs of the Force. Her desire to learn the ways of the Jedi forces Luke to make a decision that changes their lives forever. Meanwhile, Kylo Ren and General Hux lead the First Order in an all-out assault against Leia and the Resistance for supremacy of the galaxy.");                                                                                                                                                                                                                                                                              

INSERT INTO Genre (Id, Genre)
VALUES(NULL, "Horror");
INSERT INTO Genre (Id, Genre)
VALUES(NULL, "Comedy");
INSERT INTO Genre (Id, Genre)
VALUES(NULL, "Romantic");
INSERT INTO Genre (Id, Genre)
VALUES(NULL, "Sci-Fi");
INSERT INTO Genre (Id, Genre)
VALUES(NULL, "LGTBQ");
INSERT INTO Genre (Id, Genre)
VALUES(NULL, "Thriller");
INSERT INTO Genre (Id, Genre)
VALUES(NULL, "Adventure");

INSERT INTO Type_Of (MovieID, GenreID)
VALUES (1, 2);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (2, 6);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (3, 7);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (4, 6);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (5, 7);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (6, 5);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (7, 4);
                                                                                                                                       

INSERT INTO Views_Movie (MovieID, ProfileID, PercentComplete) 
VALUES (1, 3, 100.00); 
INSERT INTO Views_Movie (MovieID, ProfileID, PercentComplete) 
VALUES (2, 6, 65.00); 
INSERT INTO Views_Movie (MovieID, ProfileID, PercentComplete) 
VALUES (3, 5, 12.00); 
INSERT INTO Views_Movie (MovieID, ProfileID, PercentComplete) 
VALUES (4, 1, 98.00); 
INSERT INTO Views_Movie (MovieID, ProfileID, PercentComplete) 
VALUES (2, 2, 26.00);                                                                                                                                        
INSERT INTO Views_Movie (MovieID, ProfileID, PercentComplete) 
VALUES (6, 2, 100.00); 
INSERT INTO Views_Movie (MovieID, ProfileID, PercentComplete) 
VALUES (7, 3, 100.00); 
                                                                                                                                       
INSERT INTO Person (Id, FirstName, LastName, Sex) 
VALUES (1, "Mark", "Waters", "M");
INSERT INTO Person (Id, FirstName, LastName, Sex) 
VALUES (2, "Jordan", "Peele", "M"); 
INSERT INTO Person (Id, FirstName, LastName, Sex) 
VALUES (3, "Rob", "Minkoff", "M"); 
INSERT INTO Person (Id, FirstName, LastName, Sex) 
VALUES (4, "Roger", "Allers", "M"); 
INSERT INTO Person (Id, FirstName, LastName, Sex) 
VALUES (5, "Mike", "Newell", "M"); 
INSERT INTO Person (Id, FirstName, LastName, Sex) 
VALUES (6, "Byron", "Howard", "M"); 
INSERT INTO Person (Id, FirstName, LastName, Sex) 
VALUES (7, "Rich", "Moore", "M");
INSERT INTO Person (Id, FirstName, LastName, Sex) 
VALUES (8, "Matt", "Kugelman", "M"); 
INSERT INTO Person (Id, FirstName, LastName, Sex) 
VALUES (9, "Rian", "Johnson", "M"); 

INSERT INTO Directed_By_Mov (MovieID, PersonID)
VALUES (1, 1);
INSERT INTO Directed_By_Mov (MovieID, PersonID)
VALUES (2, 2);
INSERT INTO Directed_By_Mov (MovieID, PersonID)
VALUES (3, 3);
INSERT INTO Directed_By_Mov (MovieID, PersonID)
VALUES (3, 4);
INSERT INTO Directed_By_Mov (MovieID, PersonID)
VALUES (4, 5);
INSERT INTO Directed_By_Mov (MovieID, PersonID)
VALUES (5, 6);
INSERT INTO Directed_By_Mov (MovieID, PersonID)
VALUES (5, 7);
INSERT INTO Directed_By_Mov (MovieID, PersonID)
VALUES (6, 8);
INSERT INTO Directed_By_Mov (MovieID, PersonID)
VALUES (7, 9);                                                                                                                                       
-- Question: Give the first names of the people who have paid more than 10.00
SELECT User_Account.FirstName, Invoice.PurchaseAmount
FROM Invoice RIGHT JOIN User_Account ON Invoice.AccID = User_Account.Id WHERE Invoice.PurchaseAmount > 10.00;
-- Question: How many people have paid more than 10.00 and live in Florida
SELECT count(*), User_Account.State, Invoice.PurchaseAmount
FROM Invoice RIGHT JOIN User_Account ON Invoice.AccID = User_Account.Id AND User_Account.State = "FL" 
WHERE Invoice.PurchaseAmount > 10.00
GROUP BY User_Account.State, Invoice.PurchaseAmount;
-- Question: name the cities of all users that share the same expiration date ordered alphabetically
SELECT User_Account.City, Payment_Method.ExpirationDate FROM User_Account RIGHT JOIN Payment_Method
ON User_Account.Id = Payment_Method.AccID
INNER JOIN (SELECT ExpirationDate, count(*) FROM Payment_Method GROUP BY ExpirationDate HAVING count(*) > 1) AS T
ON Payment_Method.ExpirationDate = T.ExpirationDate ORDER BY User_Account.City ASC;
-- Question: Name the profiles that have viewed Get Out
SELECT Movie.Name, Profile.Name AS ViewedBy 
FROM Profile RIGHT JOIN Views_Movie ON Profile.Id = Views_Movie.ProfileID 
RIGHT JOIN Movie ON Movie.Id = Views_Movie.MovieID 
WHERE Movie.Id = 2 ORDER BY ViewedBy ASC;                                                                                                                              
-- QUestion: Name the Movies that have more than 1 director
SELECT Name, count(*) AS Num_Of_Directors FROM Movie
RIGHT JOIN Directed_By_Mov ON Movie.Id = Directed_By_Mov.MovieID 
GROUP BY Name HAVING Num_Of_Directors >1;                                                                                                                                       
