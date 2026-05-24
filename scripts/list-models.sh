#!/usr/bin/env bash
# =============================================================================
# list-models.sh — Lista todos os modelos no repositório com tamanho
# Uso: ./scripts/list-models.sh
# =============================================================================

MODELS_DIR="$(dirname "$0")/../models"

echo ""
echo "📦 Modelos no repositório"
echo "========================="

TOTAL=0
for CATEGORY in "$MODELS_DIR"/*/; do
  NAME=$(basename "$CATEGORY")
  COUNT=$(find "$CATEGORY" -type f \( -iname "*.stl" -o -iname "*.3mf" -o -iname "*.obj" \) | wc -l | tr -d ' ')
  
  if [ "$COUNT" -gt 0 ]; then
    echo ""
    echo "📁 $NAME ($COUNT arquivo(s))"
    find "$CATEGORY" -type f \( -iname "*.stl" -o -iname "*.3mf" -o -iname "*.obj" \) \
      -exec du -sh {} \; | awk '{printf "   %-8s %s\n", $1, $2}'
    TOTAL=$((TOTAL + COUNT))
  else
    echo ""
    echo "📁 $NAME (vazio)"
  fi
done

echo ""
echo "─────────────────────────"
echo "Total: $TOTAL modelo(s)"
echo ""
