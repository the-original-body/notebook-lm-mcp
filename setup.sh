#!/bin/bash
# NotebookLM MCP Quick Setup Script

set -e

echo "=== NotebookLM MCP Setup ==="
echo ""

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew nicht gefunden. Bitte installiere Homebrew zuerst:"
    echo "https://brew.sh"
    exit 1
fi

# Install notebooklm-mcp
echo "1. Installiere notebooklm-mcp..."
brew install jxnl/tap/notebooklm-mcp || {
    echo "Homebrew Installation fehlgeschlagen, versuche pipx..."
    pipx install notebooklm-mcp
}

# Add to Claude Code
echo ""
echo "2. Füge MCP Server zu Claude Code hinzu..."
claude mcp add notebooklm-mcp /opt/homebrew/bin/notebooklm-mcp 2>/dev/null || {
    echo "Claude CLI nicht gefunden oder MCP bereits hinzugefügt."
}

echo ""
echo "=== Setup abgeschlossen! ==="
echo ""
echo "Nächster Schritt: Authentifizierung"
echo "1. Öffne https://notebooklm.google.com"
echo "2. Cmd+Option+E → Cmd+R → Rechtsklick → Copy as cURL"
echo "3. In Claude Code einfügen"
echo ""
