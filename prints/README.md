# 🗂️ Impressões

Cada impressão tem uma pasta própria sob `prints/`, reunindo **todos os seus
artefatos** num só lugar: modelo, G-code, perfil de fatiamento e notas.

## Layout de uma impressão

```text
prints/<nome-da-impressao>/
├── model/        # arquivos de modelo (.stl, .3mf, .obj)
├── gcode/        # G-codes aprovados (.gcode) e saídas do slicer
├── profile/      # perfil OrcaSlicer exportado (.json)
└── README.md     # metadados da impressão
```

- `<nome-da-impressao>` em lowercase com hífens (ex.: `caixa-figurinhas-copa-2026`).
- Itens que **não** pertencem a uma impressão única ficam no topo do repositório:
  macros start/end em `macros/`, perfis base em `profiles/`, documentação em `docs/`.

## Template do `README.md` da impressão

Copie para cada nova pasta de impressão:

```markdown
# <Nome da impressão>

- **Categoria:** functional | decorative | upgrades-printer
- **Fonte:** <URL ou origem do modelo, ou "modelagem própria">
- **Data:** AAAA-MM-DD
- **Material:** <ex: PLA, PETG>
- **Diário:** ver entrada em [`docs/print-log.md`](../../docs/print-log.md)

## Notas

<observações relevantes sobre o modelo, ajustes ou variações>
```
