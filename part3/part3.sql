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
        Id INT UNISIGNED NOT NULL auto_increment,
        InvoiceID INT UNSIGNED NOT NULL UNIQUE auto_increment, --is auto_increment ok here? 
        ServiceStart DATE NOT NULL,
        AccID INT UNSIGNED NOT NULL,
        SubID INT UNSIGNED NOT NULL,
        PaymentID INT UNSIGNED NOT NULL,
        PurchaseAmount DECIMAL (4, 2) NOT NULL,
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
        PercentComplete DECIMAL (5, 2) NOT NULL,
        PRIMARY KEY (MovieID, ProfileID),
        FOREIGN KEY (MovieID) REFERENCES Movie(Id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (ProfileID) REFERENCES Profile(Id) ON UPDATE CASCADE ON DELETE CASCADE
    );
-- INSERTS GO HERE
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "emmekemammo-4655@yopmail.com", "Kieran", "Moses", "7632135215", "1069  Cherry Tree Drive", "Jacksonville", "FL", 32204, "9c8ffcdf2b", SHA1("9c8ffcdf2bpassword"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "ulatr@laparbgt.ga", "Dianne", "Altreche", "2706015202", "2982 Suscipit Ave","Galzignano Terme","Veneto",28277, "vu2tdahq2m" , SHA1("vu2tdahq2mpassword"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "babde-1@bohani.tk", "Noe", "Freelon", "3876308409", "Ap #742-354 Phasellus St.","Salamanca","CL",29715, "tg7gpln2j2", SHA1("tg7gpln2j2password"));
INSERT INTO User_Account (ID, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "TheFloweryGamer@gmail.com", "Bob", "Claswell", "7025197831", "440-1535 Enim, Av.","Benalla","Victoria",14574, "7cs634v0e4", SHA1("7cs634v0e4password"));
INSERT INTO User_Account (Id, Email, FirstName, LastName, Phone, StreetAddress, City, State, Zip, Salt, Hash)
VALUES (NULL, "ziiasxdb@imgof.com", "Tahani", "Moe", "8164589215", "Ap #735-4347 Placerat. Road","Pontevedra","GA",4761, "5mcjzx4pjd", SHA1("5mcjzx4pjdpassword"));
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
-- can do all users with the same credit card expiration date

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
VALUES (NULL, NULL);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (NULL, NULL);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (NULL, NULL);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (NULL, NULL);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (NULL, NULL);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (NULL, NULL);
INSERT INTO Type_Of (MovieID, GenreID)
VALUES (NULL, NULL);

INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AcctID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, NULL, 20151225, 1, 2, 1, 7.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AcctID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, NULL, 20130303, 2, 1, 2, 10.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AcctID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, NULL, 20150419, 3, 2, 3, 7.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AcctID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, NULL, 20181013, 4, 3, 4, 13.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AcctID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, NULL, 20171205, 5, 1, 5, 10.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AcctID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, NULL, 20160618, 6, 1, 6, 10.99);
INSERT INTO Invoice (Id, InvoiceID, ServiceStart, AcctID, SubID, PaymentID, PurchaseAmount)
VALUES (NULL, NULL, 20180812, 7, 3, 7, 13.99);
                                                                                                                                       
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, MosesK, 1);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, AltrecheD, 2);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, FreelonN, 3);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, ClaswellB, 4);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, MoeT, 5);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, NganiC, 6);
INSERT INTO Profile (Id, Name, AccID)
VALUES (NULL, KnopeL, 7);                                                                                                                                       

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
VALUES (6, "Hurricane Biance", 2016, 84, "A teacher from New York moves to a small town in Texas and is quickly fired for being gay. He soon returns dressed as a mean lady to get revenge on the nasty townspeople.");
INSERT INTO Movie (Id, Name, YearReleased, RunTime, Description)
VALUES (7, "Star Wars: The Last Jedi", 2017, 156, "Luke Skywalker's peaceful and solitary existence gets upended when he encounters Rey, a young woman who shows strong signs of the Force. Her desire to learn the ways of the Jedi forces Luke to make a decision that changes their lives forever. Meanwhile, Kylo Ren and General Hux lead the First Order in an all-out assault against Leia and the Resistance for supremacy of the galaxy.");                                                                                                                                       

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
--can do a join on people have subscription types greater than $10 and live in florida
-- People that have viewed the same movie
