# eval

Postupak za evaluator:

0. Sam folder eval staviti direktno u C:\
1. Folder s testnim podacima stavlja se u folder C:\eval\test
2. Za kod koji se želi testirati ime.cpp IZVRŠNU DATOTEKU ime.exe treba kopirati u C:\eval
3. Win + R -> cmd
   pomoću naredbi cd\ i cd eval dođe se do foldera c:\eval
   (ili na bilo koji drugi način ući u cmd i doći do c:\eval)

t ime n
ime je ime zadatka, a n je broj testnog podatka.
Tesni podaci moraju biti oblika (input) "ime.in.n" (output) "ime.out.n" (bez navodnika), gdje je n broj testnog podatka
Testni podaci moraju biti u folderu naslovljenom kao ime zadatka, unutar foldera test
-> ovo je standardni tip ako se koriste na školskom/...

p ime n
ime je ime zadatka, a ne je broj testnog podatka. Koristi se za evaluiranje ime.py
Tesni podaci moraju biti oblika (input) "ime.in.n" (output) "ime.out.n" (bez navodnika), gdje je n broj testnog podatka
Testni podaci moraju biti u folderu naslovljenom kao ime zadatka, unutar foldera test
-> ovo je standardni tip ako se koriste na školskom/...

k ime n l 
ime je ime zadatka, n je broj KLASTERA, l je podzadatak (slovo) u klasteru
Tesni podaci moraju biti oblika (input) "ime.in.nl" (output) "ime.out.nl" (bez navodnika), gdje je n broj klastera + l broj primjera
Testni podaci moraju biti u folderu naslovljenom kao ime zadatka, unutar foldera test
-> standardan tip podataka na HONI/HIO/... gdje god postoje klasteri

m ime n
ime je ime zadatka, a n je broj testnog primjera.
Tesni podaci moraju biti oblika (input) "n.in" (output) "n.out" (bez navodnika), gdje je n broj testnog podatka
Testni podaci moraju biti u folderu naslovljenom kao ime zadatka, unutar foldera test
-> nestandaran tip podataka


*** ŠTO JE CHECKER?
Checker je program koji čita input i output i određuje radi li se o točnom rješenju. 
Defaultni checker je deff.exe i podržava gore navedene naredbe, no njegov je nedostatak da točnim rješenjem smatra samo ono što je i službeno rješenje.
Ukoliko u zadatku postoji više točnih rješenja, ili čak parcijalni bodovi unutar zadatka, diff.exe najvjerojatnije neće zadovoljiti potrebe evaluacije.
Dakle, u tom slučaju napišite svoj vlastiti checker. Argumenti koje prima je input file i output file. Pogledajte template.cpp
Povratni kod mora biti broj bodova koje rješenje zaslužuje (npr. return 1;)


tc ime n
ime je ime zadatka, a n je broj testnog podatka.
Sličan kao t ime n, no radi sa custom checkerom umjesto diff.exe
Checker mora biti naslovljen "ime.exe" i stavljen u folder check 

pc ime n
ime je ime zadatka, a ne je broj testnog podatka. Koristi se za evaluiranje ime.py
Sličan kao p ime n, no radi sa custom checkerom umjesto diff.exe
Checker mora biti naslovljen "ime.exe" i stavljen u folder check 

kc ime n l
ime je ime zadatka, n je broj KLASTERA, l je podzadatak (slovo) u klasteru
Sličan kao k ime n l, no radi sa custom checkerom umjesto diff.exe
Checker mora biti naslovljen "ime.exe" i stavljen u folder check 
*Rezultat na jednom klasteru je minimum osvojenih bodova na testnim podacima unutar tog klastera, a ukupan broj bodova je zbroj bodova po klasterima

mc ime n
ime je ime zadatka, a n je broj testnog primjera.
Tesni podaci moraju biti oblika (input) "n.in" (output) "n.out" (bez navodnika), gdje je n broj testnog podatka
Sličan kao m ime n, no radi sa custom checkerom umjesto diff.exe
Checker mora biti naslovljen "ime.exe" i stavljen u folder check 
