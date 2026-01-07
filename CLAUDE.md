# NotebookLM MCP - Project Instructions

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
- **AO** - Audio Overview
- **VO** - Video Overview
- **IF** - Infographic
- **vX** - Version (v1, v2...)

### Beispiele
```
RQ-0001__RP-01v1 - Die Kunst der Mäßigung
RQ-0006__SD-01v1 - Arthrose Blueprint Startkurs
```

### Workflow
1. Vor Asset-Erstellung: REQUEST-TRACKER.md prüfen für nächste freie ID
2. Asset mit korrektem Titel-Prefix im Prompt erstellen
3. Nach Erstellung: REQUEST-TRACKER.md aktualisieren

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
Cmd+Option+E → Cmd+R → Rechtsklick → Copy as cURL → hier einfügen
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
