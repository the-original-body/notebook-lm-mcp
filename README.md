# NotebookLM MCP Setup

Schnelles Setup für NotebookLM MCP Server mit Claude Code.

## Installation (Ein Befehl)

```bash
claude mcp add notebooklm-mcp -- npx -y notebooklm-mcp
```

Fertig! Der MCP Server wird automatisch via npx installiert und gestartet.

## Authentifizierung

1. Öffne https://notebooklm.google.com (eingeloggt)
2. `Cmd+Option+E` (öffnet DevTools Network Tab)
3. Tippe `batchexecute` im Filter-Feld (filtert unwichtige Requests raus)
4. `Cmd+R` (Seite neu laden)
5. Rechtsklick auf den `batchexecute` Request → **Copy as cURL**
6. In Claude Code einfügen

## Verwendung

Nach der Authentifizierung stehen folgende Befehle zur Verfügung:

| Befehl | Beschreibung |
|--------|--------------|
| `notebook_list` | Alle Notebooks anzeigen |
| `notebook_create` | Neues Notebook erstellen |
| `notebook_query` | Fragen an Notebook stellen |
| `research_start` | Deep Research starten |
| `audio_overview_create` | Audio-Übersicht generieren |

## Slash Commands

- `/auth` - Zeigt detaillierte Anleitung zur Cookie-Extraktion

## Links

- [NotebookLM](https://notebooklm.google.com)
- [Original MCP Repo](https://github.com/jxnl/notebooklm-mcp)
