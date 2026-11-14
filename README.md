# FailSafe IT – Databasprojekt

## Om projektet

I det här projektet har jag skapat en relationsdatabas för IT-företaget FailSafe IT.

Tanken med databasen är att samla information om företagets kunder, konsulter och uppdrag på ett bättre och mer strukturerat sätt. Databasen är skapad i SQL Server och använder primärnycklar och främmande nycklar för att koppla ihop tabellerna.

## ER-diagram

ER-diagrammet visar hur databasen är uppbyggd och hur de olika tabellerna hänger ihop.

Databasen består av tre tabeller:

- **Kunder** – sparar information om företagets kunder.
- **Konsulter** – sparar information om konsulterna.
- **Uppdrag** – innehåller information om uppdragen och kopplar ihop kunder med konsulter.

En kund kan ha flera uppdrag och en konsult kan också vara kopplad till flera uppdrag.

## Normalisering

Jag har delat upp informationen i olika tabeller för att undvika att samma information behöver sparas på flera ställen.

**1NF (Första normalformen)**

Varje kolumn innehåller ett värde och varje rad har en primärnyckel som gör att den kan identifieras. Jag har till exempel inte lagt flera telefonnummer eller andra värden i samma kolumn.

**2NF (Andra normalformen)**

Alla tabeller har en primärnyckel som består av en enda kolumn. Det innebär att det inte finns några partiella beroenden och att tabellerna uppfyller andra normalformen.

**3NF (Tredje normalformen)**

Jag har lagt kundernas och konsult­ernas information i separata tabeller. I tabellen Uppdrag används främmande nycklar för att koppla ihop dem. På så sätt behöver jag inte spara kundens eller konsultens information flera gånger, vilket gör databasen enklare att uppdatera.

## SQL och funktioner

I SQL-scriptet skapar jag tabellerna och lägger in testdata. Jag har även skrivit SQL-frågor för att testa att databasen fungerar.

Följande saker går att göra med scriptet:

- Visa konsulter som har ett timpris över 1200 kr.
- Visa uppdrag tillsammans med kundens och konsultens namn.
- Räkna hur många aktiva uppdrag varje kund har.
- Uppdatera timpriset för en konsult.
- Ta bort en kund som inte har några kopplade uppdrag.

## DevSecOps och säkerhet

För att skydda databasen mot SQL-injektion bör applikationen använda parametriserade SQL-frågor. Då behandlas det som användaren skriver in som data och inte som en del av själva SQL-kommandot.

Jag har också gjort organisationsnumret unikt med hjälp av UNIQUE. SQL Server skapar då ett unikt index som gör det enklare att söka efter organisationsnummer och förhindrar att samma organisationsnummer registreras flera gånger.

## Verktyg

- SQL Server Management Studio
- SQL Server
- Lucidchart
- GitHub
