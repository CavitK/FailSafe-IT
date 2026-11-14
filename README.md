# FailSafe IT – Databasprojekt

## Om projektet

Det här projektet handlar om att skapa en relationsdatabas för IT-företaget FailSafe IT.

Syftet med databasen är att hålla koll på företagets kunder, konsulter och uppdrag. Databasen är skapad i SQL Server och innehåller tabeller med primärnycklar och främmande nycklar för att koppla ihop informationen.

## ER-diagram

ER-diagrammet visar hur databasen är uppbyggd och hur tabellerna hänger ihop.

Databasen består av tre tabeller:

- **Kunder** – innehåller information om företagets kunder.
- **Konsulter** – innehåller information om konsulterna.
- **Uppdrag** – innehåller information om uppdragen och kopplar ihop kunder med konsulter.

En kund kan ha flera uppdrag och en konsult kan också ha flera uppdrag.

## Normalisering

Jag har normaliserat databasen för att minska onödig upprepning av information och göra databasen enklare att hantera.

**1NF (Första normalformen)**

Varje kolumn innehåller ett värde och varje rad kan identifieras med en primärnyckel. Jag har undvikit att lägga flera värden i samma kolumn.

**2NF (Andra normalformen)**

Informationen är uppdelad i olika tabeller. Kundinformation finns i Kunder och konsultinformation finns i Konsulter. På så sätt behöver samma information inte upprepas i flera uppdrag.

**3NF (Tredje normalformen)**

Information som hör till kunder och konsulter lagras i sina egna tabeller. Uppdrag använder främmande nycklar för att koppla ihop informationen. Det minskar risken för onödig duplicering och gör databasen lättare att uppdatera.

## SQL och funktioner

SQL-scriptet skapar tabellerna, lägger in testdata och innehåller olika SQL-frågor.

Följande funktioner finns med:

- Visar konsulter med timpris över 1200 kr.
- Visar uppdrag tillsammans med kundens och konsultens namn.
- Räknar aktiva uppdrag för varje kund.
- Uppdaterar timpriset för en konsult.
- Tar bort en kund som inte har några kopplade uppdrag.

## DevSecOps och säkerhet

För att minska risken för SQL-injektion bör applikationen använda parametriserade SQL-frågor. Det gör att användarens inmatning behandlas som data istället för att kunna påverka själva SQL-kommandot.

Jag har även använt organisationsnummer som ett unikt fält i kundtabellen. Genom att använda UNIQUE skapas ett unikt index i SQL Server. Det gör det enklare att söka efter organisationsnummer och förhindrar att samma organisationsnummer läggs in flera gånger.

## Verktyg

- SQL Server Management Studio
- SQL Server
- Lucidchart
- GitHub
