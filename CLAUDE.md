# NotebookLM MCP - Project Instructions

---

## FUNDAMENTALE REGELN - GELTEN FÜR ALLE INHALTE

**Diese Regeln sind UNVERHANDELBAR und gelten für JEDEN Output: Reports, Slidedecks, Podcasts, Prompts, Texte.**

### 1. IMMER PER DU

- ALLE Texte sind per DU (nie per SIE)
- Du/Dir/Dein/Deine/Euch/Euer werden GROSS geschrieben
- Gilt für: Reports, Slidedecks, Podcasts, Prompts, alle Kommunikation

### 2. NIEMALS "DIE QUELLEN" ERWÄHNEN

- Es geht IMMER um das THEMA, nicht um die Quellen
- VERBOTEN: "Laut den Quellen...", "Die Quellen zeigen...", "Aus den Quellen geht hervor..."
- VERBOTEN: "Im Report steht...", "Das Transkript zeigt...", "Die Dokumente sagen..."
- Das Thema steht im Vordergrund - nicht woher die Information kommt
- Der Zuhörer/Leser soll sich auf den INHALT konzentrieren, nicht auf Meta-Informationen

### 3. IMMER IN DER WIR-FORM SPRECHEN

- NIEMALS über "Justus Hirt", "Armin", "TOB" in der dritten Person sprechen
- IMMER: "Wir bei The Original Body...", "Unser Ansatz...", "Wir haben festgestellt..."
- VERBOTEN: "Justus sagt...", "Laut Armin...", "The Original Body empfiehlt..."
- RICHTIG: "Wir empfehlen...", "Unser Verständnis ist...", "Wir arbeiten so..."
- Der Sprecher/Autor IST Teil von The Original Body und spricht als WIR

### 4. VERBOTENE WÖRTER (IMMER!)

- **"Heilung"** → stattdessen: "Gesundheit", "Regeneration", "Verbesserung"
- **"die Quellen"** → stattdessen: direkt über das Thema sprechen
- **"Reports"** → Teilnehmer wissen nichts von Reports
- **"Transkript"** → internes Dokument, nicht erwähnen
- **"laut [Name]"** → stattdessen WIR-Form verwenden

---

## WICHTIG: IMMER ZUERST FRAGEN!

**Bevor Claude mit einem Workflow startet, MUSS er folgende Fragen klären:**

1. **Welches Notebook?** - Notebook-ID oder Name abfragen
2. **Welche Quellen sollen verwendet werden?** - Bei Unsicherheit IMMER nachfragen
3. **Modus bestätigen:** Video-Kurs oder Workshop?

**Bei Unsicherheit IMMER Rückfragen stellen!** Lieber einmal zu viel fragen als falsche Annahmen treffen.

---

## ZWEI MODI: VIDEO-KURS vs. WORKSHOP

Dieses Projekt hat **zwei verschiedene Workflows**:

| Aspekt | `/video-kurs-lektion` | `/workshop-session-nachbereitung` |
|--------|----------------------|-----------------------------------|
| **Zielgruppe** | BESTEHENDE Kunden | WERBLICHE Audienz (Leads) |
| **Primärquelle** | Video-Skript | Workshop-Transkript |
| **Themen** | NotebookLM entscheidet (3-10) | 5 relevanteste Fragen extrahieren |
| **Reports pro Thema** | 1 Report pro Thema | 3 Reports pro Thema (15 total) |
| **Ton** | Keine Verkaufssprache | 80% Verkäufer-Mentalität |
| **Kernbotschaft** | SICHERHEIT & Verständnis | PROZESS & Selbstarbeit |

---

## VIDEO-SKRIPTE UND IHRE TITEL (WICHTIG!)

**Jedes Video-Skript hat einen INHALTLICHEN TITEL (nicht "Skript X Woche Y")!**

Die Titel findest Du in der Überschrift jedes Skripts im Google Doc "Skripte Modulvideos Arthrose Blueprint":

| Skript | Woche | INHALTLICHER TITEL (für Prompts verwenden!) |
|--------|-------|---------------------------------------------|
| Skript 0 | - | Einführung und Richtlinien der Programmbenutzung |
| Skript 1 | Woche 1 | Zielgerichtetes Tensegrity-basiertes Mechanotransduktionstraining |
| Skript 2 | Woche 1 | Selbstmassage - Einführung und Grundlagen |
| Skript 3 | Woche 1 | Spiralsystem - Die Grundlage verstehen |
| Skript 4 | Woche 1 | Exzentrisch stehen |

**REGELN für Titel:**
- NIEMALS "Skript X" oder "Woche Y" im Titel verwenden
- NIEMALS "Praxisvideo" im Titel
- NUR den inhaltlichen Titel aus der Überschrift des Skripts
- Der Titel beschreibt den INHALT, nicht die Struktur

**Diese Titel werden verwendet für:**
1. **Slidedeck-Prompts:** Das Slidedeck verbildlicht dieses Video
2. **Podcast-Prompts:** "Du hast das Video '[TITEL]' geschaut..."
3. **Report-Themen:** Die Reports vertiefen die Inhalte dieses Videos

---

## DER MASTER-WORKFLOW (IMMER BEFOLGEN!)

**Dieser Workflow ist VERBINDLICH für jedes neue Video-Skript.**

### PHASE 1: Video-Skript als Quelle hinzufügen
1. User gibt ein Video-Skript (Text oder Google Doc)
2. Claude fügt das Skript via `notebook_add_text` oder `notebook_add_drive` als Quelle zum Notebook hinzu
3. Bestätigung an User: "Skript wurde als Quelle hinzugefügt"

### PHASE 2: NotebookLM entscheidet Report-Themen
4. Claude fragt NotebookLM Chat via `notebook_query`:
   ```
   Analysiere das Video-Skript [TITEL]. Entscheide: Wie viele Reports sollen erstellt werden (Minimum 3, Maximum 10)?
   Liste für jeden Report:
   - Titel
   - Kernthema (1-2 Sätze)
   - Warum dieses Thema wichtig ist für Teilnehmer

   Kriterien für die Entscheidung:
   - Jeder Report behandelt EIN klar abgrenzbares Konzept
   - Reports bauen logisch aufeinander auf
   - Praktische Anwendbarkeit für Arthrose-Betroffene
   ```
5. Claude dokumentiert die Antwort in `video-X/report-themen.md`

### PHASE 3: Reports erstellen
6. Claude erstellt für JEDEN Report einen Prompt (~2000 Zeichen)
7. Claude speichert jeden Prompt in `video-X/prompts/report-X-prompt.md`
8. Claude erstellt alle Reports via `report_create` (können parallel laufen)
9. Claude wartet auf Fertigstellung via `studio_status`

### PHASE 4: User lädt Reports hoch
10. **USER-AKTION:** User exportiert Reports als Google Docs
11. **USER-AKTION:** User gibt Claude die Google Drive URLs
12. Claude fügt alle Reports als Drive-Quellen hinzu via `notebook_add_drive`
13. Bestätigung: "X Reports wurden als Quellen hinzugefügt"

### PHASE 5: Slidedeck-Prompt schreiben (CLAUDE SELBST!)

**WICHTIG: Das Slidedeck ist eine VERBILDLICHUNG des Video-Skripts!**

14. **CLAUDE LIEST das VIDEO-SKRIPT** - Das Original-Skript ist die HAUPTQUELLE!
15. **CLAUDE DENKT HART NACH** und schreibt den Slidedeck-Prompt selbst:
    - **Das VIDEO-SKRIPT ist die PRIMÄRE QUELLE** (Reihenfolge + Inhalt folgen!)
    - Reports und andere Quellen sind ERWEITERTE KONTEXTINFORMATIONEN
    - Das Slidedeck VERBILDLICHT das Video-Skript
    - Teilnehmer sollen nach dem Video das PDF anschauen und sagen: "Ah ja, das ist das, worum es im Video ging"
    - Visualisierungen für Konzepte, die man visualisieren sollte
    - KEINE konkreten Slide-Anweisungen ("Slide 1:...")
    - Für BESTEHENDE Kunden (keine Verkaufssprache!)
16. Claude fügt die ZWINGENDEN SLIDEDECK-REGELN an
17. Claude speichert den fertigen Prompt in `video-X/prompts/slidedeck-prompt.md`

### PHASE 6: Slidedeck erstellen
17. Claude erstellt das Slidedeck via `slide_deck_create`:
    - **`source_ids=null`** (ALLE Quellen nutzen! NIEMALS explizite IDs!)
    - `length=default`
    - `language=de`
    - `focus_prompt` = der geschriebene Slidedeck-Prompt
18. Claude wartet auf Fertigstellung

### PHASE 6b: FAKTENCHECK (NUR FÜR ARTHROSE BLUEPRINT!)
19. **NACH Slidedeck-Erstellung:** Claude führt einen Faktencheck via `notebook_query` durch:
    ```
    Prüfe das erstellte Slidedeck auf inhaltliche Korrektheit:

    1. Werden alle Zusammenhänge korrekt wiedergegeben?
    2. Stimmen die Aussagen mit dem Video-Skript "[TITEL]" überein?
    3. Gibt es Aussagen, die im Video-Skript NICHT vorkommen?
    4. Gibt es Widersprüche zu den Kernkonzepten?

    Liste alle gefundenen Unstimmigkeiten auf.
    ```
20. **Bei Unstimmigkeiten:** Claude informiert den User und schlägt Korrekturen vor
21. **USER-REVIEW:** User schaut sich das Slidedeck an
22. **ENTSCHEIDUNG:**
    - ✅ Zufrieden → Weiter zu Phase 7
    - ❌ Änderungen nötig → Zurück zu Schritt 14, neue Version erstellen

### PHASE 7: Podcast Deep Dive erstellen (CLAUDE SELBST!)

**WICHTIG: 1 PODCAST PRO VIDEO! NICHT pro Report!**

**ZIEL des Podcasts:** VERTIEFUNG mit ALLEN Kontextinformationen!
- Der Podcast nutzt ALLE verfügbaren Quellen (Reports, Skripte, Rohmaterial)
- Gibt MEHR Informationen als das Video allein
- Für Teilnehmer, die sich die Zeit nehmen wollen, tiefer einzutauchen
- PLUS: Anfängern SICHERHEIT geben

21. **CLAUDE LIEST ALLE Quellen** - Alle Reports + weitere Kontextinformationen
22. **CLAUDE DENKT HART NACH** und schreibt EINEN Audio-Prompt pro Video (~2000 Zeichen):
    - ALLE verfügbaren Quellen nutzen für maximale VERTIEFUNG
    - Mehr Informationen als im Video allein
    - **Podcast-Ziel 1: VERTIEFUNG** - tiefer eintauchen, mehr erfahren
    - **Podcast-Ziel 2: SICHERHEIT geben** - beruhigend, ermutigend
    - Teilnehmer sollen sich SICHER und WOHL fühlen
    - Alles in der TIEFE verstehen können
    - Keine Hektik, kein Druck
23. Claude fügt die ZWINGENDEN PODCAST-REGELN an
24. Claude speichert den Prompt in `video-X/prompts/audio-prompt.md` (EINER pro Video!)
25. Claude erstellt den Podcast via `audio_overview_create`:
    - **`source_ids=null`** (ALLE Quellen nutzen! NIEMALS explizite IDs!)
    - `format=deep_dive`
    - `length=long`
    - `language=de`
    - `focus_prompt` = der geschriebene Audio-Prompt

### PHASE 8: Dokumentation
25. Claude aktualisiert `REQUEST-TRACKER.md` mit allen IDs

---

## VERBOTEN - Diese Vorgehen sind ZWINGEND VERBOTEN

1. **NIEMALS Slidedecks erstellen ohne Reports als Quellen hinzuzufügen!**
   - `slide_deck_create` darf ERST aufgerufen werden, NACHDEM alle Reports via `notebook_add_drive` als Quellen hinzugefügt wurden
   - focus_prompt alleine reicht NICHT aus

2. **NIEMALS verkäufliche Sprache für BESTEHENDE Kunden verwenden!**
   - Die Zielgruppe hat BEREITS gekauft
   - Keine Überzeugungsrhetorik, kein "warum du kaufen solltest"
   - Fokus auf: Umsetzung, Verständnis, Motivation, Begleitung, SICHERHEIT

3. **NIEMALS kurze Prompts verwenden!**
   - Report-Prompts: IMMER knapp unter 2000 Zeichen (max erlaubt: 2000)
   - Slidedeck-Prompts: IMMER knapp unter 2000 Zeichen
   - Audio-Prompts: IMMER knapp unter 2000 Zeichen
   - **ZIEL: So NAHE wie möglich an 2000 Zeichen (1800-2000 ideal)**
   - Kurze Prompts = schlechte Ergebnisse

4. **NIEMALS Slidedeck-Prompts OHNE die zwingenden Regeln!**
   - JEDER Slidedeck-Prompt MUSS den vollständigen ZWINGENDE_SLIDEDECK_REGELN Block enthalten

5. **NIEMALS Report-Themen selbst entscheiden!**
   - NotebookLM Chat entscheidet Anzahl und Themen der Reports
   - Claude fragt IMMER via `notebook_query` nach

6. **NIEMALS Slidedeck/Podcast-Prompts ohne Reports zu LESEN!**
   - Claude MUSS die Reports in den Kontext holen (LESEN!)
   - Claude schreibt die Prompts SELBST mit hartem Nachdenken
   - NotebookLM Chat wird NICHT für Prompts gefragt

7. **NIEMALS konkrete Slide-Anweisungen in Slidedeck-Prompts!**
   - KEINE "Slide 1: ..., Slide 2: ..." Vorgaben
   - Der Prompt erzählt die VISION und die GROSSE GESCHICHTE
   - Die emotionale Reise des Teilnehmers
   - Der Slide-Agent entscheidet selbst über die konkrete Slide-Struktur

8. **NIEMALS Slidedecks mit length=short erstellen!**
   - `slide_deck_create` mit `length=default` aufrufen (das ist die längste Option)
   - Slidedecks sollen die MAXIMALE Länge haben

9. **NIEMALS mehrere Podcasts pro Video erstellen!**
   - Es gibt IMMER nur 1 Podcast pro Video (~20 Min)
   - Der Podcast fasst ALLE Reports des Videos zusammen
   - NICHT: 1 Podcast pro Report (das wäre FALSCH!)
   - Dateiname: `audio-prompt.md` (NICHT `audio-1-prompt.md`, `audio-2-prompt.md`...)

10. **NIEMALS source_ids explizit setzen bei slide_deck_create oder audio_overview_create!**
    - `source_ids` IMMER auf `null` lassen (oder Parameter weglassen)
    - So werden ALLE Quellen im Notebook verwendet
    - Der `focus_prompt` steuert, welche Quellen PRIORITÄT haben
    - FALSCH: `source_ids=["id1", "id2", "id3"]` → NUR diese 3 Quellen werden genutzt!
    - RICHTIG: `source_ids=null` → ALLE Quellen werden genutzt, focus_prompt gibt Priorität

11. **NIEMALS in Podcasts über "Reports" sprechen!**
    - Das Wort "Report" darf NIEMALS im Podcast erwähnt werden
    - Teilnehmer wissen nichts von Reports - das ist interne Dokumentation
    - Stattdessen: "Du hast das Video '[TITEL]' geschaut..." als Einstieg

12. **NIEMALS "Skript X" oder "Woche Y" als Video-Titel verwenden!**
    - IMMER den INHALTLICHEN Titel aus der Skript-Überschrift nehmen
    - FALSCH: "Skript 1 Woche 1", "Praxisvideo", "Skript 0"
    - RICHTIG: "Einführung und Richtlinien der Programmbenutzung", "Zielgerichtetes Tensegrity-basiertes Mechanotransduktionstraining"
    - Siehe Tabelle oben für alle korrekten Titel!

---

## ARTHROSE BLUEPRINT - VISUELLER STIL (IMMER KOPIEREN)

**Dieser Stil-Block MUSS in JEDEN Slidedeck-Prompt kopiert werden:**

```
VISUELLER STIL - ARTHROSE BLUEPRINT:

FARBPALETTE:
- Hintergrund: Warmes Beige/Creme (wie #F5F3EE)
- Primärfarbe Text: Dunkles Marineblau (wie #1A2B4A)
- Akzentfarbe: Goldgelb/Senfgelb (wie #C9A227) - für Nummern, Trennlinien, Highlights, Kurven, Häkchen
- Signalfarbe: Rot (wie #E63946) NUR für "Falsch/Verboten"-Kreuze (X)
- KEINE anderen Farben verwenden!

TYPOGRAFIE:
- Überschriften: Bold, Sans-Serif, sehr groß, Marineblau
- Fließtext: Regular Sans-Serif, Marineblau
- Nummern (1, 2, 3...): Extra Bold, Goldgelb, sehr groß als Blickfang
- Zitate: Kursiv, Marineblau, in Anführungszeichen

ICONS & GRAFIKEN:
- Stil 1: Line-Art Icons (Outline-Stil) - Marineblau mit Goldgelb-Akzenten
- Stil 2: Stilisierte flächige Illustrationen (abstrakt) - NUR Marineblau + Goldgelb als Füllfarben
- Diagramme/Kurven: Goldgelbe Linien mit Marineblau-Beschriftung (z.B. "Tal der Tränen"-Kurve)
- Komplexität: Einfach, klar, minimalistisch
- KEINE fotorealistischen Bilder, KEINE Fotos von Menschen

HINTERGRUND-ELEMENTE:
- Dezente Architektur-Linienzeichnungen (Bauplan-Stil) - passend zum "Blueprint"-Thema
- Geometrische Strukturen (feine graue Linien, Würfel, Gebäude-Querschnitte)
- Immer sehr dezent/transparent, nie ablenkend

LAYOUT:
- Viel Weißraum (nicht überladen!)
- Klare visuelle Hierarchie
- Goldgelbe horizontale Trennlinien als Akzente
- Zentriert oder linksbündig, konsistent innerhalb einer Slide
- Vergleiche: Links "Falsch" (mit rotem X), Rechts "Richtig" (mit goldenem Häkchen)

VERBOTEN IM STIL:
- Bunte Farben außerhalb der Palette (kein Grün, Blau, Lila, Orange...)
- Fotos oder fotorealistische Grafiken
- Überladene Slides mit zu viel Text
- Yoga/Pilates-Darstellungen
- 3D-Renderings
```

---

## ZWINGENDE SLIDEDECK-REGELN (IMMER KOPIEREN)

**Dieser Block MUSS in JEDEN Slidedeck-Prompt kopiert werden:**

```
ZWINGENDE REGELN FÜR DIESES SLIDE DECK:

FUNDAMENTALE SPRACHREGELN:
1. IMMER per DU (Du/Dir/Dein groß) - NIEMALS per SIE
2. IMMER in der WIR-Form sprechen ("Wir bei The Original Body...", "Unser Ansatz...")
3. NIEMALS über Personen in dritter Person ("Justus sagt...", "Laut Armin...")
4. NIEMALS "die Quellen" erwähnen - das THEMA steht im Vordergrund!
5. NIEMALS Quellenangaben (Verboten: "Aus dem Report xy", "laut Transkript...")

VERBOTENE WÖRTER/PHRASEN:
- "Heilung" → stattdessen: "Gesundheit", "Regeneration"
- "die Quellen zeigen" → VERBOTEN
- "Justus erklärt" → stattdessen: "Wir erklären"
- Schriftarten-Namen als Text auf Slides → NIEMALS!

DESIGN-REGELN:
6. Design erfolgt NICHT über Markdown (Keine "left over" ### am Zeilenanfang)
7. NIEMALS Schriftarten abdrucken, Fonts immer Anwenden
8. KEINE erfundenen Logos, Impressum oder "Letzten Seiten" mit Kontaktinformationen
9. Verzichte auf Fotoreales Rendering
10. Nutze IMMER die maximale Länge an Slides
11. Sprache: Deutsch (einzelne englische Begriffe zulässig)
12. Keine personenbezogenen Daten (Namen kürzen: Armin S., Martina F.)
13. Visualisierungen sind positiv - KEINE Yoga/Pilates-Darstellungen
14. "The Original Body AG" darf erwähnt werden
15. NIEMALS Font-Namen als Text auf Slides ausgeben!
```

---

## NUR ARTHROSE BLUEPRINT: VIDEO-SKRIPT ALS PRIMÄRE QUELLE

**Diese Regel gilt NUR für das Arthrose Blueprint Projekt (Notebook: `be4664aa-f0d4-452c-a09e-508853c08296`).**

**Dieser Block MUSS in JEDEN Slidedeck-Prompt für Arthrose Blueprint kopiert werden:**

```
WICHTIG - INHALTLICHE KORREKTHEIT:

Das Video-Skript "[TITEL]" ist die EINZIGE inhaltliche Wahrheit.
Alle anderen Quellen dienen NUR zur Visualisierung und Vertiefung.

STRENGE REGELN:
- NIEMALS Inhalte hinzufügen, die NICHT im Video-Skript stehen
- NIEMALS eigene Interpretationen oder Schlussfolgerungen machen
- NIEMALS Konzepte kombinieren, die im Video nicht kombiniert werden
- Im ZWEIFEL: WEGLASSEN statt falsch darstellen

Das Slidedeck VERBILDLICHT das Video-Skript - es ERFINDET nichts Neues.
```

---

## ZWINGENDE PODCAST-REGELN (IMMER KOPIEREN)

**Dieser Block MUSS in JEDEN Audio/Podcast-Prompt kopiert werden:**

```
ZWINGENDE REGELN FÜR DIESEN PODCAST:

FUNDAMENTALE SPRACHREGELN:
1. IMMER per DU (Du/Dir/Dein groß) - NIEMALS per SIE
2. IMMER in der WIR-Form sprechen ("Wir bei The Original Body...", "Unser Ansatz...")
3. NIEMALS über Personen in dritter Person ("Justus sagt...", "Laut Armin...")
4. NIEMALS "die Quellen" erwähnen - das THEMA steht im Vordergrund!
5. NIEMALS über "Reports", "Transkripte", "Dokumente" sprechen

VERBOTENE WÖRTER/PHRASEN:
- "Heilung" → stattdessen: "Gesundheit", "Regeneration"
- "die Quellen zeigen" → stattdessen: direkt über das Thema sprechen
- "laut den Unterlagen" → VERBOTEN
- "Justus erklärt" → stattdessen: "Wir erklären"
- "The Original Body empfiehlt" → stattdessen: "Wir empfehlen"

PODCAST-ZIEL:
6. ZIEL: Anfängern SICHERHEIT geben - sie sollen sich SICHER und WOHL fühlen
7. Keine Hektik, kein Druck - nimm Dir Zeit für jedes Konzept
8. Erkläre alles so, als hätte der Zuhörer NULL Vorwissen
9. Wiederhole wichtige Punkte in anderen Worten
10. Nutze Alltagsbeispiele und Metaphern
11. Sprich beruhigend und ermutigend
12. Betone: Es ist OK, wenn nicht alles sofort klar ist
13. Gib dem Zuhörer das Gefühl, dass er/sie auf dem richtigen Weg ist
14. Vermeide Fachjargon oder erkläre jeden Fachbegriff sofort
15. Schließe mit einer ermutigenden Zusammenfassung

FORMAT:
16. Sprache: Deutsch
17. Länge: ca. 20 Minuten Deep Dive
18. PFLICHT-EINSTIEG: "Du hast das Video '[VIDEO-TITEL]' geschaut und jetzt sprechen wir darüber nochmal in der Tiefe."
```

---

## CHECKLISTEN (VOR JEDER AKTION PRÜFEN)

### Checkliste: Neues Video starten
- [ ] Video-Skript als Quelle hinzugefügt?
- [ ] NotebookLM nach Report-Themen gefragt?
- [ ] Themen in `video-X/report-themen.md` dokumentiert?

### Checkliste: Reports erstellen
- [ ] Alle Prompts ~2000 Zeichen?
- [ ] Alle Prompts in `video-X/prompts/` gespeichert?
- [ ] Keine verkäufliche Sprache?
- [ ] Auf SICHERHEIT und VERSTÄNDNIS fokussiert?

### Checkliste: Slidedeck erstellen (VERBILDLICHUNG des Videos!)
- [ ] Alle Reports als Google Docs Quellen hinzugefügt?
- [ ] **VIDEO-SKRIPT ist die PRIMÄRE QUELLE?**
- [ ] **Slidedeck folgt Reihenfolge + Inhalt des Video-Skripts?**
- [ ] **Slidedeck-Prompt SELBST geschrieben (mit hartem Nachdenken)?**
- [ ] Reports als erweiterte Kontextinformationen (nicht Hauptquelle)?
- [ ] KEINE konkreten Slide-Anweisungen im Prompt (keine "Slide 1:")?
- [ ] Visualisierungen für Konzepte aus dem Video?
- [ ] **ZWINGENDE REGELN Block eingefügt?**
- [ ] **[ARTHROSE BLUEPRINT] PRIMÄRQUELLE-Block eingefügt?**
- [ ] Prompt in `video-X/prompts/slidedeck-prompt.md` gespeichert?
- [ ] **`source_ids=null` bei `slide_deck_create`?** (ALLE Quellen nutzen!)
- [ ] `length=default` bei `slide_deck_create`?
- [ ] **[ARTHROSE BLUEPRINT] FAKTENCHECK via `notebook_query` durchgeführt?**

### Checkliste: Podcast erstellen (VERTIEFUNG - 1 PRO VIDEO!)
- [ ] **ALLE Quellen genutzt?** (Reports, Skripte, Rohmaterial für Vertiefung)
- [ ] **EIN Audio-Prompt pro Video SELBST geschrieben (mit hartem Nachdenken)?**
- [ ] **NUR 1 Prompt-Datei: `audio-prompt.md` (NICHT audio-1, audio-2...)?**
- [ ] **Ziel 1: VERTIEFUNG** - mehr Informationen als im Video allein?
- [ ] **Ziel 2: SICHERHEIT** - beruhigend, ermutigend für Anfänger?
- [ ] ZWINGENDE PODCAST-REGELN Block eingefügt?
- [ ] **`source_ids=null` bei `audio_overview_create`?** (ALLE Quellen nutzen!)
- [ ] format=deep_dive, length=long, language=de?

---

## Arthrose Blueprint - Asset Naming Convention

### Format
```
RQ-XXXX__[TYPE]-XXvX - Titel
```

### IDs
- **RQ-XXXX** - Request ID (fortlaufend: RQ-0001, RQ-0002...)
- **RP** - Report
- **SD** - Slide Deck
- **AO** - Audio Overview (Podcast)
- **VO** - Video Overview
- **IF** - Infographic
- **vX** - Version (v1, v2...)

---

## Ordnerstruktur

```
arthrose-blueprint/
├── REQUEST-TRACKER.md
├── video-X/
│   ├── report-themen.md          # NotebookLM's Entscheidung
│   ├── prompts/
│   │   ├── report-1-prompt.md
│   │   ├── report-2-prompt.md
│   │   ├── ...
│   │   ├── slidedeck-prompt.md
│   │   └── audio-prompt.md       # NUR EINER pro Video! (fasst alle Reports zusammen)
│   ├── reports/                   # Optional: Lokale Kopien
│   └── slidedecks/                # Optional: PDFs
```

---

## Prompt-Regeln

### Report-Prompts (~2000 Zeichen)
- Detaillierte Struktur vorgeben
- Konkrete Beispiele fordern
- Metaphern und Analogien einfordern
- Fokus auf VERSTÄNDNIS und SICHERHEIT
- KEINE Verkaufssprache

### Slidedeck-Prompts (~2000 Zeichen)

**ZIEL: VERBILDLICHUNG des Video-Skripts!**

- **CLAUDE schreibt den Prompt SELBST (NICHT NotebookLM Chat fragen!)**
- **Das VIDEO-SKRIPT ist die PRIMÄRE QUELLE!**
  - Das Slidedeck folgt der Reihenfolge und dem Inhalt des Video-Skripts
  - Teilnehmer sollen nach dem Video das PDF anschauen und sagen: "Ah ja, das ist das, worum es im Video ging"
  - Das Slidedeck VERBILDLICHT das Video
- Reports und andere Quellen sind ERWEITERTE KONTEXTINFORMATIONEN
  - Sie helfen, das Ganze "supergeil" darzustellen
  - Aber die STRUKTUR kommt vom Video-Skript
- KEINE konkreten Slide-Anweisungen (keine "Slide 1:", "Slide 2:")
- Visuelle Metaphern für Konzepte aus dem Video
- **Bei `slide_deck_create`: IMMER `source_ids=null` und `length=default`!**

### Audio-Prompts (~2000 Zeichen) - NUR EINER PRO VIDEO!

**ZIEL: VERTIEFUNG mit allen Kontextinformationen!**

- **1 PODCAST PRO VIDEO! NICHT pro Report!**
- **CLAUDE schreibt den Prompt SELBST (NICHT NotebookLM Chat fragen!)**
- **ALLE Quellen nutzen** - Reports, Skripte, Rohmaterial für maximale VERTIEFUNG
- Der Podcast gibt MEHR Informationen als das Video allein
- Für Teilnehmer, die tiefer eintauchen wollen
- **Podcast-Ziel 1: VERTIEFUNG** - mehr erfahren, tiefer verstehen
- **Podcast-Ziel 2: SICHERHEIT** - beruhigend, ermutigend
- ZWINGENDE PODCAST-REGELN einfügen
- Ca. 20 Minuten Deep Dive
- Beruhigend, ermutigend, keine Hektik
- **Dateiname: `audio-prompt.md` (NICHT `audio-1-prompt.md`!)**
- **Bei `audio_overview_create`: IMMER `source_ids=null`!**

---

## Cookie Authentifizierung

Schnellste Methode für Cookie-Extraktion:
```
Cmd+Option+E → "batchexecute" filtern → Cmd+R → Rechtsklick → Copy as cURL → hier einfügen
```

---

## Notebook: Arthrose Blueprint

- ID: `be4664aa-f0d4-452c-a09e-508853c08296`
- URL: https://notebooklm.google.com/notebook/be4664aa-f0d4-452c-a09e-508853c08296
- **Tracker:** `arthrose-blueprint/REQUEST-TRACKER.md`

---

## WORKSHOP-MODUS: DER WORKFLOW

**Befehl:** `/workshop-session-nachbereitung`

### PHASE 1: Transkript als Quelle hinzufügen
1. User gibt Workshop-Transkript (Text)
2. Claude fügt das Transkript via `notebook_add_text` als Quelle hinzu
3. Bestätigung an User

### PHASE 2: 5 Themen extrahieren
4. Claude fragt NotebookLM Chat via `notebook_query`:
   ```
   Analysiere das Workshop-Transkript. Identifiziere die 5 RELEVANTESTEN Fragestellungen/Themen des Abends.

   Für jedes Thema:
   - Titel (prägnant, verkaufsstark)
   - Kernfrage der Teilnehmer
   - Warum dieses Thema für Leads wichtig ist

   Kriterien:
   - Themen die Schmerz/Problem ansprechen
   - Themen die Hoffnung/Lösung zeigen
   - Themen die zum Handeln motivieren
   ```
5. Claude dokumentiert in `workshop-[datum]/themen.md`

### PHASE 3: 15 Reports erstellen (3 pro Thema)
6. Pro Thema 3 Report-Prompts (~2000 Zeichen):
   - **Report 1:** Grundverständnis - Was ist das Problem/Konzept?
   - **Report 2:** Praktische Anwendung - Wie setzt man es um?
   - **Report 3:** FAQ & Missverständnisse - Was wird oft falsch verstanden?
7. Prompts speichern in `workshop-[datum]/prompts/thema-X/report-X-prompt.md`
8. Reports erstellen via `report_create`

### PHASE 4: User lädt Reports hoch
9. User exportiert Reports als Google Docs
10. User gibt Claude die URLs
11. Claude fügt als Quellen hinzu

### PHASE 5: 5 Slidedecks erstellen
12. Pro Thema einen Slidedeck-Prompt (~2000 Zeichen):
    - PRIMÄRQUELLEN: Die 3 Reports zum Thema
    - SEKUNDÄRQUELLEN: Transkript + Manifest-Quellen
    - Verkaufsorientiert aber authentisch
13. ZWINGENDE WORKSHOP-SLIDEDECK-REGELN einfügen
14. Slidedecks erstellen

### PHASE 6: 5 Podcasts erstellen
15. Pro Thema einen Podcast-Prompt (~2000 Zeichen):
    - Für Leads die nicht dabei waren UND Teilnehmer
    - Kernbotschaften verweben (siehe unten)
16. ZWINGENDE WORKSHOP-PODCAST-REGELN einfügen
17. Podcasts erstellen

---

## WORKSHOP: QUELLEN-HIERARCHIE (WICHTIG!)

**PRIMÄRQUELLE (Inhalt extrahieren):**
- Das Workshop-Transkript des jeweiligen Abends
- Aus dieser Quelle werden die 5 Themen EXTRAHIERT
- Der INHALT kommt aus dem Transkript

**SEKUNDÄRQUELLEN (Kontext & Referenz):**
- ALLE anderen Quellen im Notebook dienen als Referenzinformationen
- Sie geben Kontext, Inspiration und Hintergrundwissen
- Speziell wichtig für Ton und Philosophie:
  - `!Summit 2025-11 -- Manifest.pdf`
  - `!!_Das 80% Manifest - v0.5 (2).md`

**Das Prinzip:**
- EXTRAKTION aus dem Transkript (Was wurde an diesem Abend besprochen?)
- ANREICHERUNG durch alle anderen Quellen (Wie ordnen wir es ein? Welcher Kontext?)
- Bei `slide_deck_create` und `audio_overview_create`: IMMER `source_ids=null` → ALLE Quellen werden genutzt
- Der `focus_prompt` steuert die PRIORITÄT auf das jeweilige Thema

---

## WORKSHOP: KERNBOTSCHAFTEN (IMMER VERWEBEN!)

Diese Botschaften MÜSSEN in jedem Workshop-Content vorkommen:

1. **Du musst SELBST arbeiten** - Niemand kann es für Dich tun
2. **Es ist ein PROZESS** - Keine Quick-Fix-Lösung
3. **GEMEINSAM wachsen** - Du bist nicht allein auf diesem Weg
4. **Etwas am LEBEN ändern** - Nicht nur Übungen, sondern Lifestyle
5. **Sich dem Prozess HINGEBEN** - Vertrauen aufbauen
6. **Richtung SCHMERZFREIHEIT** - Das Ziel ist erreichbar

---

## ZWINGENDE WORKSHOP-SLIDEDECK-REGELN (IMMER KOPIEREN)

**Dieser Block MUSS in JEDEN Workshop-Slidedeck-Prompt:**

```
ZWINGENDE REGELN FÜR DIESES WORKSHOP-SLIDEDECK:

FUNDAMENTALE SPRACHREGELN:
1. IMMER per DU (Du/Dir/Dein groß) - NIEMALS per SIE
2. IMMER in der WIR-Form sprechen ("Wir bei The Original Body...", "Unser Ansatz...")
3. NIEMALS über Personen in dritter Person ("Justus sagt...", "Laut Armin...")
4. NIEMALS "die Quellen" erwähnen - das THEMA steht im Vordergrund!
5. NIEMALS Quellenangaben (Verboten: "Aus dem Report xy", "laut Transkript...")

VERBOTENE WÖRTER/PHRASEN:
- "Heilung" → stattdessen: "Gesundheit", "Regeneration"
- "die Quellen zeigen" → VERBOTEN
- "Justus erklärt" → stattdessen: "Wir erklären"
- Schriftarten-Namen als Text auf Slides → NIEMALS!

ZIELGRUPPE & FORMAT:
6. ZIELGRUPPE: Werbliche Audienz (Leads) - 80% Verkäufer-Mentalität!
7. DUAL-PURPOSE: Für Leads die nicht dabei waren UND Teilnehmer
8. Design erfolgt NICHT über Markdown (keine ### am Zeilenanfang)
9. NIEMALS Schriftarten abdrucken, Fonts immer Anwenden
10. KEINE erfundenen Logos, Impressum oder Kontaktseiten
11. Maximale Slides-Länge nutzen
12. Sprache: Deutsch
13. Keine personenbezogenen Daten
14. "The Original Body AG" darf erwähnt werden
15. NIEMALS Font-Namen als Text auf Slides!

KERNBOTSCHAFTEN VERWEBEN:
- Selbstarbeit, Prozess, Gemeinschaft, Lebensänderung

16. CALL-TO-ACTION: Klar machen, dass der nächste Schritt wichtig ist
```

---

## ZWINGENDE WORKSHOP-PODCAST-REGELN (IMMER KOPIEREN)

**Dieser Block MUSS in JEDEN Workshop-Podcast-Prompt:**

```
ZWINGENDE REGELN FÜR DIESEN WORKSHOP-PODCAST:

FUNDAMENTALE SPRACHREGELN:
1. IMMER per DU (Du/Dir/Dein groß) - NIEMALS per SIE
2. IMMER in der WIR-Form sprechen ("Wir bei The Original Body...", "Unser Ansatz...")
3. NIEMALS über Personen in dritter Person ("Justus sagt...", "Laut Armin...")
4. NIEMALS "die Quellen" erwähnen - das THEMA steht im Vordergrund!
5. NIEMALS über "Reports", "Transkripte", "Dokumente" sprechen

VERBOTENE WÖRTER/PHRASEN:
- "Heilung" → stattdessen: "Gesundheit", "Regeneration"
- "die Quellen zeigen" → stattdessen: direkt über das Thema sprechen
- "laut den Unterlagen" → VERBOTEN
- "Justus erklärt" → stattdessen: "Wir erklären"
- "The Original Body empfiehlt" → stattdessen: "Wir empfehlen"

ZIELGRUPPE & FORMAT:
6. ZIELGRUPPE: Werbliche Audienz (Leads) - authentisch aber verkaufsorientiert
7. DUAL-PURPOSE: Für Leads die nicht dabei waren UND Teilnehmer
8. Erkläre alles so, als hätte der Zuhörer NULL Vorwissen
9. Nutze Alltagsbeispiele und Metaphern
10. Sprich motivierend und aktivierend
11. Sprache: Deutsch
12. Länge: ca. 15-20 Minuten

KERNBOTSCHAFTEN VERWEBEN:
- Du musst SELBST arbeiten
- Es ist ein PROZESS
- GEMEINSAM wachsen wir
- Etwas am LEBEN ändern
- Sich dem Prozess HINGEBEN
- Richtung SCHMERZFREIHEIT

13. CALL-TO-ACTION: Am Ende klar machen, dass der nächste Schritt wichtig ist
14. EINSTIEG: "Du hast vom [WORKSHOP-THEMA] gehört und willst mehr erfahren..."
```

---

## WORKSHOP: Ordnerstruktur

```
arthrose-blueprint/
├── workshop-[datum]/
│   ├── themen.md                 # Die 5 extrahierten Themen
│   ├── prompts/
│   │   ├── thema-1/
│   │   │   ├── report-1-prompt.md    # Grundverständnis
│   │   │   ├── report-2-prompt.md    # Praktische Anwendung
│   │   │   ├── report-3-prompt.md    # FAQ & Missverständnisse
│   │   │   ├── slidedeck-prompt.md
│   │   │   └── audio-prompt.md
│   │   ├── thema-2/
│   │   │   └── ...
│   │   └── ...
```

---

## WORKSHOP vs. VIDEO-KURS: Checkliste

### Workshop-Modus Checkliste
- [ ] Transkript als Quelle hinzugefügt?
- [ ] 5 Themen via NotebookLM extrahiert?
- [ ] Themen in `workshop-[datum]/themen.md` dokumentiert?
- [ ] Pro Thema 3 Report-Prompts (~2000 Zeichen)?
- [ ] 80% Verkäufer-Mentalität im Ton?
- [ ] Manifest-Quellen als Sekundärquellen?
- [ ] Kernbotschaften verwoben?
- [ ] Call-to-Action enthalten?
