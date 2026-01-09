# NotebookLM MCP - Project Instructions

---

## VERBOTEN - Diese Vorgehen sind ZWINGEND VERBOTEN

1. **NIEMALS Slidedecks erstellen ohne Reports als Quellen hinzuzufügen!**
   - `slide_deck_create` darf ERST aufgerufen werden, NACHDEM alle zugehörigen Reports via `notebook_add_text` als Quellen hinzugefügt wurden
   - focus_prompt alleine reicht NICHT aus
   - **QUELLE = Der VOLLSTÄNDIGE Report-Inhalt aus NotebookLM, NICHT eine Zusammenfassung des Prompts!**

2. **NIEMALS verkäufliche Sprache für BESTEHENDE Kunden verwenden!**
   - Die Zielgruppe hat BEREITS gekauft
   - Keine Überzeugungsrhetorik, kein "warum du kaufen solltest"
   - Fokus auf: Umsetzung, Verständnis, Motivation, Begleitung

3. **NIEMALS kurze Prompts verwenden!**
   - Report-Prompts: IMMER knapp unter 2000 Zeichen (max erlaubt: 2000)
   - Slidedeck-Prompts: IMMER knapp unter 2000 Zeichen
   - Audio-Prompts: IMMER knapp unter 2000 Zeichen
   - Kurze Prompts = schlechte Ergebnisse

4. **NIEMALS Slidedeck-Prompts OHNE die zwingenden Regeln!**
   - JEDER Slidedeck-Prompt MUSS den vollständigen ZWINGENDE_SLIDEDECK_REGELN Block enthalten
   - Siehe Abschnitt "Zwingende Slidedeck-Regeln (IMMER KOPIEREN)"

---

## ZWINGENDE SLIDEDECK-REGELN (IMMER KOPIEREN)

**Dieser Block MUSS in JEDEN Slidedeck-Prompt kopiert werden:**

```
ZWINGENDE REGELN FÜR DIESES SLIDE DECK:
1. Design erfolgt NICHT über Markdown (Keine "left over" ### am Zeilenanfang)
2. ACHTUNG: NIEMALS Schriftarten abdrucken, Fonts immer Anwenden
3. KEINE Erfundenen Logos, Impressum oder "Letzten Seiten" mit Kontaktinformationen
4. Verzichte auf Fotoreales Rendering, außer es wurde in dem Report DIREKT beauftragt.
5. Nutze IMMER die maximale Länge an Slides, die möglich sind.
6. Halte Dich STRIKT an die vorgegebene Ausgabesprache. Einzelne englische Begriffe sind zulässig, aber zu limitieren.
7. Du bist immer per DU (nie per SIE) und schreibst Du/Dir/Deine/Euch/Euer groß.
8. Du gibst nie eindeutige Personenbezogene Informationen aus (Nachnamen, Telefonnummern, Geburtstage, exakte Adressen). Namen kürzt Du mit dem Vornamen + erster Buchstabe des Nachnamen ab. (Armin S., Martina F.)
9. Direkte Zitate sind prinzipiell gut, Du achtest aber darauf, dass Du keine Quellen angibst (Verboten: "Aus dem Report xy", "laut Transkript des Telefonats",...)
10. Die Verwendung von Visualisierungen und Darstellungen ist generell Positiv. Keine Darstellungen von "Yoga, Pilates,..."
11. Unsere Firma heißt "The Original Body AG" Du darfst das in Slides erwähnen.
12. NIEMALS NIEMALS NIEMALS gib den Titel einer Schriftart als Text auf einer Slide aus. Kontrolliere jedes Wort auf den Slides, bevor Du weiter verfährst
```

---

## CHECKLISTEN (VOR JEDER AKTION PRÜFEN)

### Checkliste: Report als Quelle hinzufügen
- [ ] Habe ich den VOLLSTÄNDIGEN Report-Inhalt aus `studio_status` geholt?
- [ ] Habe ich den Report-Inhalt im Repo gespeichert unter `video-X/reports/RQ-XXXX__RP-XXvX.md`?
- [ ] Lade ich den VOLLSTÄNDIGEN Report-Text hoch, NICHT eine Zusammenfassung?
- [ ] Ist der Report-Text mindestens 500 Wörter lang (echter Report-Inhalt)?

### Checkliste: Slidedeck erstellen
- [ ] Sind ALLE zugehörigen Reports als Quellen im Notebook hinzugefügt?
- [ ] Enthält mein Prompt den VOLLSTÄNDIGEN "ZWINGENDE REGELN" Block?
- [ ] Ist mein Prompt knapp unter 2000 Zeichen?
- [ ] Verwendet der Prompt KEINE verkäufliche Sprache?
- [ ] Habe ich den Prompt im Repo gespeichert unter `video-X/prompts/slidedeck-prompt.md`?

### Checkliste: Audio Deep Dive erstellen
- [ ] Ist der zugehörige Report bereits erstellt und heruntergeladen?
- [ ] Ist mein Audio-Prompt knapp unter 2000 Zeichen?
- [ ] Verwendet der Prompt KEINE verkäufliche Sprache?
- [ ] Habe ich den Prompt im Repo gespeichert unter `video-X/prompts/audio-X-prompt.md`?

---

## Arthrose Blueprint - Asset Naming Convention

**WICHTIG: Bei jedem Report/Slidedeck diese Konvention im Titel verwenden!**

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

### Beispiele
```
RQ-0001__RP-01v1 - Die Kunst der Mäßigung
RQ-0006__SD-01v1 - Arthrose Blueprint Startkurs
RQ-0013__AO-01v1 - Die Kunst der Mäßigung (Audio)
```

---

## Workflow für Video-Assets (KOMPLETT)

### Phase 1: Reports erstellen
1. **Report-Themen holen** - `notebook_query` für Video-spezifische Themen
2. **Report-Prompts schreiben** - Knapp unter 2000 Zeichen, speichern in `video-X/prompts/report-X-prompt.md`
3. **Reports erstellen** - `report_create` für jeden Report (mit RQ-ID im Titel)
4. **Report-Inhalte herunterladen** - via `studio_status` den `report_content` holen
5. **Reports im Repo speichern** - Vollständigen Inhalt in `video-X/reports/RQ-XXXX__RP-XXvX.md`

### Phase 2: Slidedeck erstellen
6. **Reports als Quellen hinzufügen** - `notebook_add_text` mit VOLLSTÄNDIGEM Report-Inhalt (aus Repo-Datei!)
7. **Slidedeck-Prompt schreiben** - Knapp unter 2000 Zeichen MIT zwingenden Regeln
8. **Prompt im Repo speichern** - in `video-X/prompts/slidedeck-prompt.md`
9. **Slidedeck erstellen** - `slide_deck_create` (nutzt Reports als Kontext)
10. **Slidedeck herunterladen** - PDF speichern in `video-X/slidedecks/`

### Phase 3: Audio Deep Dives erstellen
11. **Audio-Prompts schreiben** - Knapp unter 2000 Zeichen PRO Report
12. **Prompts im Repo speichern** - in `video-X/prompts/audio-X-prompt.md`
13. **Audio Overviews erstellen** - `audio_overview_create` mit format=deep_dive, length=default, language=de
14. **Audio herunterladen** - MP3 speichern in `video-X/audio/`

### Phase 4: Dokumentation
15. **REQUEST-TRACKER.md aktualisieren** - Alle IDs dokumentieren

---

## Prompt-Regeln

### Allgemein
- **Maximale Länge nutzen**: Immer knapp unter 2000 Zeichen
- **Zielgruppe**: Bestehende Kunden, die BEREITS gekauft haben
- **Tonalität**: Begleitend, ermutigend, verständnisvoll - NICHT verkäuflich
- **Keine Überzeugungsrhetorik**: Sie sind schon dabei, müssen nicht mehr überzeugt werden

### Report-Prompts
- Detaillierte Struktur vorgeben
- Konkrete Beispiele fordern
- Metaphern und Analogien einfordern
- Handlungsanweisungen integrieren

### Slidedeck-Prompts
- **IMMER** den ZWINGENDE_SLIDEDECK_REGELN Block einfügen
- Visuellen Aufbau beschreiben
- Didaktische Struktur vorgeben
- Zusammenfassung der Report-Themen einbeziehen
- Call-to-Action für nächste Schritte

### Audio-Prompts (Deep Dive)
- Konversationellen Stil fordern
- Bezug zum Report-Thema herstellen
- Praktische Umsetzungstipps einfordern
- Emotionale Verbindung aufbauen

---

## Ordnerstruktur

```
arthrose-blueprint/
├── REQUEST-TRACKER.md
├── video-uebersicht.md
├── video-1/
│   ├── report-themen.md
│   ├── prompts/
│   │   ├── report-1-prompt.md
│   │   ├── report-2-prompt.md
│   │   ├── ...
│   │   ├── slidedeck-prompt.md
│   │   ├── audio-1-prompt.md
│   │   └── ...
│   ├── reports/
│   │   ├── RQ-0001__RP-01v1.md
│   │   └── ...
│   ├── slidedecks/
│   │   └── RQ-0006__SD-01v1.pdf
│   └── audio/
│       └── RQ-0013__AO-01v1.mp3
├── video-2/
│   └── ...
└── ...
```

**Tracker:** `arthrose-blueprint/REQUEST-TRACKER.md`

---

## NotebookLM Deep Research Regeln

**WICHTIG: Nur 1 Deep Research gleichzeitig ausführen!**

- NotebookLM hat ein Limit für parallele Deep Researches
- Immer warten bis eine Research abgeschlossen ist, bevor die nächste gestartet wird
- Workflow:
  1. `research_start` aufrufen
  2. `research_status` mit `max_wait: 300` (5 min) aufrufen und warten
  3. `research_import` zum Importieren der Quellen
  4. Erst dann nächste Research starten

## Cookie Authentifizierung

Schnellste Methode für Cookie-Extraktion:
```
Cmd+Option+E → "batchexecute" filtern → Cmd+R → Rechtsklick → Copy as cURL → hier einfügen
```

Oder `/auth` Command verwenden für detaillierte Anleitung.

## Notebook: RedwoodSDK

Haupt-Notebook für RSC/RedwoodSDK Research:
- ID: `c30877e1-de36-4f8f-95bf-54c9a7a5c918`
- URL: https://notebooklm.google.com/notebook/c30877e1-de36-4f8f-95bf-54c9a7a5c918

## Notebook: Arthrose Blueprint

Notebook für Arthrose Blueprint Slide Decks:
- ID: `be4664aa-f0d4-452c-a09e-508853c08296`
- Source ID: `6715c842-722d-485e-a95b-f426d989eeae`
- URL: https://notebooklm.google.com/notebook/be4664aa-f0d4-452c-a09e-508853c08296
- **Tracker:** `arthrose-blueprint/REQUEST-TRACKER.md`
