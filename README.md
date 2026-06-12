# 🖨️ Creality Ender 3 V3 — Repositório de Impressão 3D

[![Markdown](https://github.com/pahagon/ender3-v3-prints/actions/workflows/markdown.yml/badge.svg)](https://github.com/pahagon/ender3-v3-prints/actions/workflows/markdown.yml)
[![JSON](https://github.com/pahagon/ender3-v3-prints/actions/workflows/json.yml/badge.svg)](https://github.com/pahagon/ender3-v3-prints/actions/workflows/json.yml)
[![Security](https://github.com/pahagon/ender3-v3-prints/actions/workflows/security.yml/badge.svg)](https://github.com/pahagon/ender3-v3-prints/actions/workflows/security.yml)
[![Branch name](https://github.com/pahagon/ender3-v3-prints/actions/workflows/branch-name.yml/badge.svg)](https://github.com/pahagon/ender3-v3-prints/actions/workflows/branch-name.yml)

Repositório pessoal para gerenciar modelos, perfis de fatiamento, G-codes e notas de impressão da Ender 3 V3.

---

## 📁 Estrutura

Organização **por impressão**: cada impressão reúne modelo, G-code, perfil e
notas numa pasta própria. Itens globais (macros, perfis base, docs) ficam no topo.

```text
ender3-v3-prints/
├── prints/                  # Uma pasta por impressão
│   └── <nome-da-impressao>/
│       ├── model/           # Modelos (.stl, .3mf, .obj)
│       ├── gcode/           # G-codes aprovados e saídas do slicer
│       ├── profile/         # Perfil OrcaSlicer exportado (.json)
│       └── README.md        # Metadados (categoria, fonte, data, material)
├── macros/                  # Macros de início e fim (start/end)
├── profiles/                # Perfis base/compartilhados por slicer
│   ├── orcaslicer/
│   ├── cura/
│   └── prusaslicer/
├── docs/                    # Documentação e notas
│   ├── print-log.md         # Diário de impressões
│   ├── printer-settings.md  # Configurações base da impressora
│   └── filaments.md         # Registro de filamentos
└── scripts/                 # Scripts utilitários
```

A categoria (funcional / decorativo / upgrade) é registrada no `README.md` de
cada impressão — ver [`prints/README.md`](./prints/README.md).

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

1. Criar a pasta da impressão → `prints/<nome>/` (model/, gcode/, profile/, README.md)
2. Baixar ou criar o modelo → salvar em `prints/<nome>/model/`
3. Fatiar no slicer escolhido → exportar perfil em `prints/<nome>/profile/`
4. Imprimir e anotar resultado em `docs/print-log.md`
5. Se aprovado, salvar o G-code em `prints/<nome>/gcode/`

---

## 🔗 Links úteis

- [OrcaSlicer Releases](https://github.com/SoftFever/OrcaSlicer/releases)
- [Ender 3 V3 — Perfis da comunidade](https://www.printables.com/printer/664088-creality-ender-3-v3)
- [Printables](https://www.printables.com)
- [Thingiverse](https://www.thingiverse.com)
- [Makerworld (Bambu)](https://makerworld.com)
