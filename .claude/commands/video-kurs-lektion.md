# Video-Kurs-Lektion Workflow

Starte den Video-Kurs-Modus für eine neue Lektion des Arthrose Blueprint.

## ZUERST KLÄREN (Pflicht-Rückfragen)

**Bevor du startest, kläre mit dem User:**

1. **Welches Notebook soll verwendet werden?**
   - Standard: Arthrose Blueprint (`be4664aa-f0d4-452c-a09e-508853c08296`)
   - Oder ein anderes Notebook?

2. **Welche bestehenden Quellen sollen als Kontext dienen?**
   - Gibt es bereits Reports oder andere Materialien im Notebook?
   - Sollen alle Quellen verwendet werden oder nur bestimmte?

3. **Video-Nummer/Titel?** (für Ordnerstruktur `video-X/`)

**Bei Unsicherheit IMMER nachfragen!**

## Workflow

1. **User gibt Video-Skript** (Text oder Google Doc URL)
2. **Skript als Quelle hinzufügen** via `notebook_add_text` oder `notebook_add_drive`
3. **NotebookLM nach Report-Themen fragen** via `notebook_query` (3-10 Reports)
4. **Reports erstellen** (~2000 Zeichen pro Prompt)
5. **User lädt Reports als Google Docs hoch** und gibt URLs
6. **Reports als Quellen hinzufügen**
7. **Slidedeck-Prompt schreiben** (Claude selbst, VIDEO-SKRIPT ist Primärquelle!)
8. **Slidedeck erstellen** (`source_ids=null`, `length=default`)
9. **Podcast-Prompt schreiben** (Claude selbst, VERTIEFUNG mit allen Quellen)
10. **Podcast erstellen** (`source_ids=null`, `format=deep_dive`, `length=long`)

## Zielgruppe

- **BESTEHENDE Kunden** (haben bereits gekauft!)
- Keine Verkaufssprache
- Fokus auf: Umsetzung, Verständnis, Motivation, Begleitung, SICHERHEIT

## Notebook

ID: `be4664aa-f0d4-452c-a09e-508853c08296`

Bitte gib mir das Video-Skript (Text oder Google Doc URL).
