#!/usr/bin/env bash
# =============================================================================
# new-print.sh — Adiciona uma entrada rápida no diário de impressões
# Uso: ./scripts/new-print.sh
# =============================================================================

set -euo pipefail

LOG_FILE="$(dirname "$0")/../docs/print-log.md"
DATE=$(date +%Y-%m-%d)

echo ""
echo "📋 Nova entrada no diário de impressões"
echo "----------------------------------------"

read -rp "Nome do modelo: " NOME
read -rp "Arquivo (ex: prints/suporte/model/suporte.stl): " ARQUIVO
read -rp "Slicer e perfil (ex: OrcaSlicer › perfil-pla.json): " SLICER
read -rp "Filamento (marca, cor, material): " FILAMENTO
read -rp "Temp. bico / mesa (ex: 220°C / 60°C): " TEMP
read -rp "Velocidade (ex: 150 mm/s): " VELOCIDADE
read -rp "Altura de camada (ex: 0.2 mm): " CAMADA
read -rp "Infill (ex: 20% gyroid): " INFILL
read -rp "Suportes? (Sim/Não): " SUPORTES
read -rp "Tempo de impressão (ex: 2h 14min): " TEMPO
read -rp "Resultado (Sucesso/Parcial/Falha): " RESULTADO_RAW
read -rp "Notas (observações livres): " NOTAS

# Formatar resultado com emoji
case "${RESULTADO_RAW,,}" in
  sucesso|s|ok) RESULTADO="✅ Sucesso" ;;
  parcial|p) RESULTADO="⚠️ Parcial" ;;
  falha|f|fail) RESULTADO="❌ Falha" ;;
  *) RESULTADO="$RESULTADO_RAW" ;;
esac

# Bloco da nova entrada
ENTRY="
### ${NOME} — ${DATE}
- **Arquivo:** \`${ARQUIVO}\`
- **Slicer / Perfil:** ${SLICER}
- **Filamento:** ${FILAMENTO}
- **Temp. Bico / Mesa:** ${TEMP}
- **Velocidade:** ${VELOCIDADE}
- **Altura de camada:** ${CAMADA}
- **Infill:** ${INFILL}
- **Suportes:** ${SUPORTES}
- **Tempo:** ${TEMPO}
- **Resultado:** ${RESULTADO}
- **Notas:** ${NOTAS}
"

# Inserir após a linha "## Impressões"
SECTION="## Impressões"
TEMP_FILE=$(mktemp)

awk -v entry="$ENTRY" -v section="$SECTION" '
  $0 == section { print; print entry; next }
  { print }
' "$LOG_FILE" > "$TEMP_FILE"

mv "$TEMP_FILE" "$LOG_FILE"

echo ""
echo "✅ Entrada adicionada em docs/print-log.md"
