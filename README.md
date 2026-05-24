# 🖨️ Creality Ender 3 V3 — Repositório de Impressão 3D

[![Markdown](https://github.com/pahagon/ender3-v3-prints/actions/workflows/markdown.yml/badge.svg)](https://github.com/pahagon/ender3-v3-prints/actions/workflows/markdown.yml)
[![JSON](https://github.com/pahagon/ender3-v3-prints/actions/workflows/json.yml/badge.svg)](https://github.com/pahagon/ender3-v3-prints/actions/workflows/json.yml)
[![Security](https://github.com/pahagon/ender3-v3-prints/actions/workflows/security.yml/badge.svg)](https://github.com/pahagon/ender3-v3-prints/actions/workflows/security.yml)

Repositório pessoal para gerenciar modelos, perfis de fatiamento, G-codes e notas de impressão da Ender 3 V3.

---

## 📁 Estrutura

```text
ender3-v3-prints/
├── models/                  # Arquivos de modelo (.stl, .3mf, .step)
│   ├── functional/          # Peças utilitárias (suportes, adaptadores, etc.)
│   ├── decorative/          # Itens decorativos
│   └── upgrades-printer/    # Melhorias para a própria impressora
├── profiles/                # Perfis de fatiamento por slicer
│   ├── orcaslicer/
│   ├── cura/
│   └── prusaslicer/
├── gcodes/                  # G-codes prontos para impressão
│   ├── start-end/           # Macros de início e fim
│   └── prints/              # G-codes de impressões aprovadas
├── docs/                    # Documentação e notas
│   ├── print-log.md         # Diário de impressões
│   ├── printer-settings.md  # Configurações base da impressora
│   └── filaments.md         # Registro de filamentos
└── scripts/                 # Scripts utilitários
```

---

## 🛠️ Slicer recomendado

Para a Ender 3 V3, o **[OrcaSlicer](https://github.com/SoftFever/OrcaSlicer)** é a melhor opção:

- Perfil nativo para Ender 3 V3 (com input shaping e pressure advance)
- Calibração integrada (fluxo, temperatura, retração)
- Suporte a impressão multi-material
- Atualização frequente e comunidade ativa

Como alternativas: **Cura** (mais simples) e **PrusaSlicer** (bom meio-termo).

---

## 🖨️ Especificações da impressora

| Item | Valor |
|------|-------|
| Modelo | Creality Ender 3 V3 |
| Volume de impressão | 220 × 220 × 250 mm |
| Hotend | Creality Volcano (até 300°C) |
| Plataforma | PEI flexível |
| Firmware | Klipper |
| Aceleração máx. (recomendada) | 20.000 mm/s² |

---

## 📋 Fluxo de trabalho

1. Baixar ou criar o modelo → salvar em `models/`
2. Fatiar no slicer escolhido → salvar perfil em `profiles/<slicer>/`
3. Imprimir e anotar resultado em `docs/print-log.md`
4. Se aprovado, salvar o G-code em `gcodes/prints/`

---

## 🔗 Links úteis

- [OrcaSlicer Releases](https://github.com/SoftFever/OrcaSlicer/releases)
- [Ender 3 V3 — Perfis da comunidade](https://www.printables.com/printer/664088-creality-ender-3-v3)
- [Printables](https://www.printables.com)
- [Thingiverse](https://www.thingiverse.com)
- [Makerworld (Bambu)](https://makerworld.com)
