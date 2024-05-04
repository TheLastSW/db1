CREATE TABLE Coaches (
IdCoach bigint PRIMARY KEY IDENTITY(1,1) NOT NULL,
NameCoach Nvarchar(50) NOT NULL,
DateCoach Datetime NOT NULL,
SpecCoach Nvarchar(20) NOT NULL,
GenderCoach Bit NOT NULL
);

CREATE TABLE Trainings (
IdTrain bigint PRIMARY KEY IDENTITY(1,1) NOT NULL,
IdCoach bigint FOREIGN KEY REFERENCES Coaches(IdCoach)
);

CREATE TABLE Subscriptions (
IdSub bigint PRIMARY KEY IDENTITY(1,1) NOT NULL,
IdTrain bigint FOREIGN KEY REFERENCES Trainings(IdTrain) NOT NULL,
DurationSub bigint NOT NULL,
PriceSub bigint NOT NULL
);

CREATE TABLE Receipts (
IdReceipt bigint NOT NULL,
IdSub bigint FOREIGN KEY REFERENCES Subscriptions(IdSub),
SurnameConsumer Nvarchar(30) NOT NULL,
DiscountReceipt bigint,
DateReceipt Datetime NOT NULL
);

ALTER TABLE Subscriptions
ADD CONSTRAINT CheckNumberLessThan12
CHECK (DurationSub <= 12);

ALTER TABLE Subscriptions
ADD CONSTRAINT CheckNumberLessThan8000
CHECK (PriceSub <= 8000);

ALTER TABLE Receipts
ADD CONSTRAINT CheckNumberLessThan50
CHECK (DiscountReceipt <= 50);

ALTER TABLE Coaches
ADD CONSTRAINT CheckStringNoDigits
CHECK (NameCoach NOT LIKE '%[0-9]%');

ALTER TABLE Coaches
ADD CONSTRAINT CheckStringNoDigits1
CHECK (SpecCoach NOT LIKE '%[0-9]%');

ALTER TABLE Receipts
ADD CONSTRAINT CheckStringNoDigits2
CHECK (SurnameConsumer NOT LIKE '%[0-9]%');

insert into Coaches (NameCoach, DateCoach, SpecCoach, GenderCoach) values
('Тимур', '12.03.95','Бокс', 1);

select * from Coaches;