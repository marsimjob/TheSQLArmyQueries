# TheSQLArmyQueries
Jag tyckte det kunde vara intressant att bryta iväg från det mer ordinarie ämnena  
men ändå leta efter något lite mer praktiskt.

Sedan ville jag söka mig till ett område som hade någorlunda behov av struktur  
där databaser kunde komma till bra användning!

**Soldater, enheter, rank, vapen, fordon och uppdrag!**  
Jag tycker militär‑ämnet är rätt lättförklarligt på ytan och det fanns rätt typ av data att hantera för att få min databas 
att bli intressant för den som än kollade på det.

## Mina tabeller
### **Rank**
Olika rankar och deras titlar.

### **Unit**
Ett gäng soldater som hör ihop! Här finns både namn på enheten och var deras bas befinner sig.

### **Weapon**
Tabell för vapen som håller kolumner med data om deras styrka, räckvidd och såklart namn.

### **Soldier**
Soldaterna har mest data i hela databasen.  
Ett viktigt element är en 'BIT'‑kolumn som talar om ifall de är **döda eller ej**.

### **SoldierWeapon**
Kombinerar ett vapen och en soldat i en egen tabell för att stödja relationsdata korrekt.

### **Mission**
Soldaters uppdrag!

### **MissionUnit**
Visar vilka enheter som är med i ett uppdrag och skapar en egen tabell  
för relationsdata.

## Repots innehåll:

x **SQL Queries I Databas**
   1. Seed‑data
   2. CRUD‑operationer
      Insert,
      Select,
      Update,
      Delete
   4. Avancerade frågor med JOINs
      Aggregationer (HAVING, WHERE),
      CTE
   6. Views och Stored PROCEDURE

## Vad för sorts queries hade jag valt?
Man kan dra fram olika typer av data på olika sätt från den här databasen:

x Lista alla soldater med deras ranker
x Räkna hur många vapen varje soldat har
x Kolla vilka enheter som är på olika uppdrag
...och mycket mer beroende på vad man vill utforska!

## Vad ska bli nästa steg?
Bygga vidare till en större fullstack applikation som används av svenska Försvarsmakten

---

**Now we head out for our next mission, soldiers!**
