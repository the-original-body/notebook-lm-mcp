# Workshop-Session Nachbereitung

Starte den Workshop-Modus für die Nachbereitung eines Live-Workshops/Webinars.

## ZUERST KLÄREN (Pflicht-Rückfragen)

**Bevor du startest, kläre mit dem User:**

1. **Welches Notebook soll verwendet werden?**
   - User gibt Notebook-URL oder ID

2. **Datum/Name des Workshops?** (für Ordnerstruktur)

**Bei Unsicherheit IMMER nachfragen!**

## QUELLEN-HIERARCHIE (WICHTIG!)

**PRIMÄRQUELLE:** Das Workshop-Transkript
- Aus dieser Quelle werden die 5 Themen EXTRAHIERT
- Der INHALT kommt primär aus dem Transkript

**SEKUNDÄRQUELLEN:** ALLE anderen Quellen im Notebook
- Dienen als Referenzinformationen, Kontext, Inspiration
- Werden automatisch genutzt bei `source_ids=null`
- Der `focus_prompt` steuert die Priorität

## Workflow

1. **User gibt Workshop-Transkript** (Text)
2. **Transkript als Quelle hinzufügen** via `notebook_add_text`
3. **5 relevanteste Themen extrahieren** via `notebook_query`:
   - Analysiere das Transkript
   - Identifiziere die 5 wichtigsten Fragestellungen/Themen des Abends
   - Dokumentiere in `workshop-[datum]/themen.md`

4. **Pro Thema 3 Reports erstellen** (= 15 Reports total):
   - Report 1: Grundverständnis des Themas
   - Report 2: Praktische Anwendung
   - Report 3: Häufige Fragen & Missverständnisse
   - Prompts ~2000 Zeichen

5. **User lädt Reports als Google Docs hoch** und gibt URLs

6. **Reports als Quellen hinzufügen**

7. **Pro Thema: Slidedeck-Prompt schreiben** (5 Slidedecks):
   - PRIMÄRQUELLEN: Die 3 Reports zum Thema
   - SEKUNDÄRQUELLEN: Transkript + Manifest-Quellen
   - Fokus auf visuelle Aufbereitung für Leads

8. **Pro Thema: Podcast-Prompt schreiben** (5 Podcasts):
   - Deep Dive in das Thema
   - Für Leads die nicht dabei waren UND Teilnehmer

9. **Slidedecks & Podcasts erstellen**

## Zielgruppe

- **WERBLICHE AUDIENZ** (Leads, potenzielle Kunden!)
- 80% Verkäufer-Mentalität nutzen
- Manifest-Quellen als Leitfaden:
  - `!Summit 2025-11 -- Manifest.pdf`
  - `!!_Das 80% Manifest - v0.5 (2).md`

## Kernbotschaften verweben

- Man muss SELBST arbeiten
- Es geht um einen PROZESS
- Gemeinsam Richtung Schmerzfreiheit wachsen
- Etwas am Leben ändern
- Sich einem Prozess hingeben

## Dual-Purpose

1. **Leads die nicht dabei waren**: Inhalt unkompliziert aufholen
2. **Teilnehmer die dabei waren**: Bildlich sinnvoll aufbereitet bekommen

## Notebook

ID: `be4664aa-f0d4-452c-a09e-508853c08296`

## Output-Struktur

```
workshop-[datum]/
├── themen.md                 # Die 5 extrahierten Themen
├── prompts/
│   ├── thema-1/
│   │   ├── report-1-prompt.md
│   │   ├── report-2-prompt.md
│   │   ├── report-3-prompt.md
│   │   ├── slidedeck-prompt.md
│   │   └── audio-prompt.md
│   ├── thema-2/
│   │   └── ...
│   └── ...
```

Bitte gib mir das Workshop-Transkript.
