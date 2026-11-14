
USE FailSafeIT;
GO

DROP TABLE IF EXISTS Uppdrag;
DROP TABLE IF EXISTS Konsulter;
DROP TABLE IF EXISTS Kunder;
GO

CREATE TABLE Kunder (
    KundID INT IDENTITY(1,1) PRIMARY KEY,
    Organisationsnummer VARCHAR(20) NOT NULL UNIQUE,
    Foretagsnamn NVARCHAR(100) NOT NULL,
    Epost NVARCHAR(100) NOT NULL,
    Telefonnummer VARCHAR(20) NOT NULL
);
GO

CREATE TABLE Konsulter (
    KonsultID INT IDENTITY(1,1) PRIMARY KEY,
    Personnummer VARCHAR(13) NOT NULL UNIQUE,
    Namn NVARCHAR(100) NOT NULL,
    Timpris DECIMAL(10,2) NOT NULL,
    Specialitet NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE Uppdrag (
    UppdragID INT IDENTITY(1,1) PRIMARY KEY,
    KundID INT NOT NULL,
    KonsultID INT NOT NULL,
    Startdatum DATE NOT NULL,
    Slutdatum DATE NOT NULL,
    Rollbeskrivning NVARCHAR(200) NOT NULL,

    FOREIGN KEY (KundID) REFERENCES Kunder(KundID),
    FOREIGN KEY (KonsultID) REFERENCES Konsulter(KonsultID),

    CHECK (Slutdatum >= Startdatum)
);
GO

INSERT INTO Kunder
(Organisationsnummer, Foretagsnamn, Epost, Telefonnummer)
VALUES
('556100-1001', 'Tech Solutions AB', 'info@techsolutions.se', '0701111111'),
('556200-2002', 'Nordic Security AB', 'kontakt@nordicsecurity.se', '0702222222'),
('556300-3003', 'Digital Future AB', 'info@digitalfuture.se', '0703333333'),
('556400-4004', 'Testbolaget AB', 'info@testbolaget.se', '0704444444');
GO

INSERT INTO Konsulter
(Personnummer, Namn, Timpris, Specialitet)
VALUES
('19900101-1234', 'Anna Andersson', 1500, 'Cybersecurity'),
('19920502-5678', 'Erik Johansson', 1100, 'DevOps'),
('19880303-9012', 'Sara Nilsson', 1800, 'C# Developer');
GO

INSERT INTO Uppdrag
(KundID, KonsultID, Startdatum, Slutdatum, Rollbeskrivning)
VALUES
(1, 1, '2026-01-01', '2026-12-31', 'Säkerhetsgranskning av API'),
(1, 2, '2026-02-01', '2026-08-31', 'DevOps och molnmiljö'),
(2, 3, '2026-03-01', '2026-12-31', 'Utveckling i C#'),
(2, 1, '2026-04-01', '2026-11-30', 'Säkerhetsanalys'),
(1, 3, '2026-05-01', '2026-10-31', 'Systemutveckling');
GO

SELECT Namn, Timpris
FROM Konsulter
WHERE Timpris > 1200
ORDER BY Timpris DESC;
GO

SELECT
    u.UppdragID,
    k.Foretagsnamn,
    ko.Namn AS Konsultnamn,
    u.Startdatum,
    u.Slutdatum
FROM Uppdrag u
INNER JOIN Kunder k
    ON u.KundID = k.KundID
INNER JOIN Konsulter ko
    ON u.KonsultID = ko.KonsultID;
GO

SELECT
    k.KundID,
    k.Foretagsnamn,
    COUNT(u.UppdragID) AS AntalAktivaUppdrag
FROM Kunder k
LEFT JOIN Uppdrag u
    ON k.KundID = u.KundID
    AND CAST(GETDATE() AS DATE)
    BETWEEN u.Startdatum AND u.Slutdatum
GROUP BY
    k.KundID,
    k.Foretagsnamn;
GO

UPDATE Konsulter
SET Timpris = 1250
WHERE KonsultID = 2;

SELECT *
FROM Konsulter
WHERE KonsultID = 2;
GO

DELETE FROM Kunder
WHERE KundID = 4
AND NOT EXISTS (
    SELECT 1
    FROM Uppdrag
    WHERE Uppdrag.KundID = Kunder.KundID
);

SELECT * FROM Kunder;
GO