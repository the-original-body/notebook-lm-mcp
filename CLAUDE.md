# NotebookLM MCP - Project Instructions

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
