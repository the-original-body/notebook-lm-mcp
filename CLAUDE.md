# NotebookLM MCP - Project Instructions

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

### PHASE 5: Slidedeck-Prompt via NotebookLM Chat
14. Claude fragt NotebookLM Chat via `notebook_query`:
    ```
    Basierend auf dem Video-Skript [TITEL] und den X erstellten Reports, erstelle einen Slidedeck-Prompt.

    Der Prompt soll:
    - Die Kernbotschaften aller Reports zusammenführen
    - Eine klare didaktische Struktur vorgeben
    - Visuelle Metaphern und Darstellungen vorschlagen
    - Für BESTEHENDE Kunden sein (keine Verkaufssprache!)

    Maximale Länge: 1800 Zeichen (weil ich noch die ZWINGENDEN REGELN anhänge)
    ```
15. Claude ergänzt den Prompt mit den ZWINGENDEN SLIDEDECK-REGELN
16. Claude speichert den fertigen Prompt in `video-X/prompts/slidedeck-prompt.md`

### PHASE 6: Slidedeck erstellen
17. Claude erstellt das Slidedeck via `slide_deck_create`
18. Claude wartet auf Fertigstellung
19. **USER-REVIEW:** User schaut sich das Slidedeck an
20. **ENTSCHEIDUNG:**
    - ✅ Zufrieden → Weiter zu Phase 7
    - ❌ Änderungen nötig → Zurück zu Schritt 14, neue Version erstellen

### PHASE 7: Podcast Deep Dives erstellen
21. Claude erstellt PRO REPORT einen Audio-Prompt (~2000 Zeichen)
22. **WICHTIG - Podcast-Ziel:**
    - Format: Deep Dive, ca. 20 Minuten, Deutsch
    - Ziel: Anfängern SICHERHEIT geben
    - Teilnehmer sollen sich SICHER und WOHL fühlen
    - Alles in der TIEFE verstehen können
    - Keine Hektik, kein Druck
23. Claude speichert Prompts in `video-X/prompts/audio-X-prompt.md`
24. Claude erstellt alle Podcasts via `audio_overview_create` (format=deep_dive, length=long, language=de)

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
   - Kurze Prompts = schlechte Ergebnisse

4. **NIEMALS Slidedeck-Prompts OHNE die zwingenden Regeln!**
   - JEDER Slidedeck-Prompt MUSS den vollständigen ZWINGENDE_SLIDEDECK_REGELN Block enthalten

5. **NIEMALS Report-Themen selbst entscheiden!**
   - NotebookLM Chat entscheidet Anzahl und Themen der Reports
   - Claude fragt IMMER via `notebook_query` nach

6. **NIEMALS Slidedeck-Prompt selbst schreiben!**
   - NotebookLM Chat erstellt den Basis-Prompt
   - Claude ergänzt NUR die zwingenden Regeln

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

## ZWINGENDE PODCAST-REGELN (IMMER KOPIEREN)

**Dieser Block MUSS in JEDEN Audio/Podcast-Prompt kopiert werden:**

```
ZWINGENDE REGELN FÜR DIESEN PODCAST:
1. ZIEL: Anfängern SICHERHEIT geben - sie sollen sich SICHER und WOHL fühlen
2. Keine Hektik, kein Druck - nimm Dir Zeit für jedes Konzept
3. Erkläre alles so, als hätte der Zuhörer NULL Vorwissen
4. Wiederhole wichtige Punkte in anderen Worten
5. Nutze Alltagsbeispiele und Metaphern
6. Sprich beruhigend und ermutigend
7. Betone: Es ist OK, wenn nicht alles sofort klar ist
8. Gib dem Zuhörer das Gefühl, dass er/sie auf dem richtigen Weg ist
9. Vermeide Fachjargon oder erkläre jeden Fachbegriff sofort
10. Schließe mit einer ermutigenden Zusammenfassung
11. Sprache: Deutsch, Du-Form (Du/Dir/Dein groß)
12. Länge: ca. 20 Minuten Deep Dive
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

### Checkliste: Slidedeck erstellen
- [ ] Alle Reports als Google Docs Quellen hinzugefügt?
- [ ] Slidedeck-Prompt von NotebookLM Chat erstellt?
- [ ] ZWINGENDE REGELN Block eingefügt?
- [ ] Prompt in `video-X/prompts/slidedeck-prompt.md` gespeichert?

### Checkliste: Podcasts erstellen
- [ ] Pro Report ein Audio-Prompt?
- [ ] ZWINGENDE PODCAST-REGELN Block eingefügt?
- [ ] Fokus auf SICHERHEIT für Anfänger?
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
│   │   ├── audio-1-prompt.md
│   │   └── ...
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
- Von NotebookLM Chat erstellt (Basis ~1800 Zeichen)
- Claude ergänzt ZWINGENDE REGELN (~200 Zeichen)
- Didaktische Struktur
- Visuelle Metaphern

### Audio-Prompts (~2000 Zeichen)
- ZWINGENDE PODCAST-REGELN einfügen
- Fokus: SICHERHEIT für Anfänger
- Ca. 20 Minuten Deep Dive
- Beruhigend, ermutigend, keine Hektik

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
