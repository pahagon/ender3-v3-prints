#!/usr/bin/env bash
# =============================================================================
# list-models.sh — Lista as impressões do repositório com seus modelos e tamanho
# Uso: ./scripts/list-models.sh
# =============================================================================

PRINTS_DIR="$(dirname "$0")/../prints"

echo ""
echo "📦 Impressões no repositório"
echo "============================"

TOTAL=0
for PRINT in "$PRINTS_DIR"/*/; do
  [ -d "$PRINT" ] || continue
  NAME=$(basename "$PRINT")
  COUNT=$(find "$PRINT" -type f \( -iname "*.stl" -o -iname "*.3mf" -o -iname "*.obj" \) | wc -l | tr -d ' ')

  if [ "$COUNT" -gt 0 ]; then
    echo ""
    echo "📁 $NAME ($COUNT modelo(s))"
    find "$PRINT" -type f \( -iname "*.stl" -o -iname "*.3mf" -o -iname "*.obj" \) \
      -exec du -sh {} \; | awk '{printf "   %-8s %s\n", $1, $2}'
    TOTAL=$((TOTAL + COUNT))
  else
    echo ""
    echo "📁 $NAME (sem modelo)"
  fi
done

echo ""
echo "─────────────────────────"
echo "Total: $TOTAL modelo(s)"
echo ""
