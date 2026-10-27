# Prompt

## 1. Grundlagen
Ein Prompt ist eine Eingabe oder Anweisung, mit der wir der NLP (Natural Language Processing) "KI" mitteilen was sie tun soll. 

PRompt -> NLP -> fässt den Textinput in InputTokens zusammen -> Generative KI Arbeit -> OutputTokens -> NLP -> generiert den schön lesbaren Text generiert / ausgibt

Am Beispiel englischer Sprache Schätzwerte:
- 1 Token entspricht 4 Zeichen
- 1 Token entspricht ungefähr drei Vierteln eines Wortes
- 100 Token entsprechen ungefähr 75 Wörtern

[Source openai](https://help.openai.com/de-de/articles/4936856-understanding-and-counting-tokens#englischen-text-grob-sch%C3%A4tzen)

**Einfacher Prompt:**

"Erkläre mit künstliche Intelligenz"

Die KI weiß, welches Thema gemeint ist, aber noch nicht, wie ausführlich oder für welche Zielgruppe Sie antworten soll.

**Verbesserter Prompt:**

"Erkläre künstliche Intelligenz für Mitarbeitende ohne Vorkenntniss, Verwende einfache Sprache, drei Beispiele aus dem Büroalltag und eine kurze Zusammenfassung mit maximal 150 Wörtern."

Kennt die KI die Zielgruppe, Stil, Beispiele und gewünschte Länge.

Merksatz:
Je klarer die Aufgabe und die Rahmenbedinungen, desto besser lässt sich das Ergebnis steuern. Ein langer PRompt ist aber nicht automatisch ein guter Prompt. Da kann es häufig sinnvoll sein, eine große Aufgabe in kleine Teilaufgaben zu zerlegen. 

## 2. Technischer Prompt
Das KI Tool unserer Wahl kann PowerShell-Code erzeugen, aber es kennt nicht automatisch unsere Umgebung, Sicherheitsrichtlinien oder sonstige betriebliche Anforderungen. Außer es handelt es sich ein komplett lokal gehostetet und trainiertes Modell, welches mit zentralen Systemprompt vorkonfiguriert ist. 

**Merksatz: 
Nicht einfach Code anfordern, sondern eine überprüfbare technische Lösung spezifizieren.**

**Schlechter Prompt:**

"Schreibe mir ein Powershell-Skript, das alte Benutzer löscht."

Probleme: keine Definition von "alt", keine Sicherheitsabfragen, keine Ausnahmen, keine Protokollierung und keine Festlegung , was genau gelöscht werden darf.

**Besser:**
"Erstelle ein PowerShell-7-Skript, das Benutzerkonten in einer angegebenen Active Directory OU identifiziert, deren letztes Anmeldedatum mehr als 90 Tage zurückliegt. Das Skript darf keine User löschen oder deaktivieren. Es soll die betroffenen Konten zunächst nur auflisten oder wahlweise als CSV exportieren. Berücksichtige Dienstkonsten und Konten mit gesetztem Ausschlussattribut, protokolliere Fehler und verwende ausschließlich lesende AD-Abfragen, NEnne Voraussetzungen, Grenzen der Anmeldedaten und Testfälle"

**Lernpunkt: Ein guter Prompt beschreibt nicht nur das gewünschte Ergebnis, sondern auch die erlaubten Aktionen, die Rahmenbedingungen und die Kriterien für das konkrete Ergebnis. Und auch das zu verwendende System.**

## 3. 10 Bausteine Modell eines guten Prompts
Dieses Modell / Unterteilung bietet den Vorteil, das wir eine wiederverwendbare Vorlage haben, die wir für verschiedene Aufgaben verwenden können.

#### 01 Rolle
Welche Expertise soll die KI einnehmen?  
zb: Du bist erfahrener PowerShell - und Windows Administrator  
zb: Du bist Senior PowerShell Skript Entwickler
#### 02 Aufgabe
Was soll das Skript konkret erledigen?  
zb: Erstelle einen Bericht über inaktive Computerobjekte  
zb: Erstelle TestFiles im System nach folgenden Schema ...  
#### 03 Umgebung
Welche Plattformen, Versionen und Module gelten?  
zb: Windows Server 2025, PowerShell 7.4, ActiveDirectory-Modul  
zb: Innovaphone 13, Powershell 5, RestAPI , Windows 11 Client
#### 04 Eingaben
Welche Parameter und Daten werden / sollen übergeben werden?  
zb: OU  
zb: Schwellenwert in Tagen  
zb: Credentials
#### 05 Ausgabe
Wie muss das Ergenis aussehen?  
zb: CSV-Datei  
zb: Konsolenzusammenfassung mit Exitcode
zb: Pipelinefähiges Custom PowerShell Objekt  
#### 06 Fehlerbehandlung
Wie werden Fehler erkannt und behandelt?  
zb: Try/Catch
zb: aussagekräftige Meldungen   
zb: Fehlerprotokoll (Eventlog oder eine LogDatei)  
#### 07 Sicherheit
Welche Aktionen sind erlaubt und verboten  
zb: Keine Löschungen
zb: keine Kennwörter im Klartext
zb: Least Privlige, RBAC, JiT, JeA, ZeroTrust
#### 08 Qualitätsstandard
Welche Codequalität / Coding Guidelines werden erwartet  
zb: StrictMode    
zb: cmdletBinding  
zb: Parameterprüfung und Kommentare  
zb: Comment Based Help  
#### 09 TestStrategie
Wie wird die Lösung überprüft  
zb: Positiv- , Negativ-, Grenz-, Fehlerfälle  
zb: Verwendung [Pester](https://pester.dev/) (Referenz zum Pester Test Definition)  
#### 10 Lieferumfang
Was soll die KI neben dem Code liefern?  
zb: Vollständiger Code  
zb: Voraussetzungen  für das generierte Skript  
zb: Risiken des generierten Inhalts  
zb: Testanleitungen


