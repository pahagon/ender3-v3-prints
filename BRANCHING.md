# Estratégia de Branching

Trunk-based development com feature branches de curta duração.

---

## Estrutura de branches

| Branch | Descrição |
|---|---|
| `main` | Branch principal — sempre estável |
| `feat/<descricao>` | Novo modelo, perfil ou G-code |
| `fix/<descricao>` | Correção de configuração ou perfil |
| `docs/<descricao>` | Documentação e notas de impressão |
| `chore/<descricao>` | Manutenção, reorganização |

**Regras:**

- Nunca commitar diretamente no `main`
- Branches em lowercase com hífens (`feat/suporte-raspberry`, não `feat/Suporte_Raspberry`)
- Vida curta — abrir PR assim que o trabalho estiver pronto

A convenção é reforçada por um git hook local (bloqueia o `git push`) e por GitHub Actions
(bloqueia o merge do PR). Ver [Validação de nomes de branch](#validação-de-nomes-de-branch).

---

## Workflow

### 1. Criar branch

```bash
git checkout main && git pull
git checkout -b feat/minha-feature
```

### 2. Commitar

Seguir [Conventional Commits](https://www.conventionalcommits.org/):

```bash
git add models/functional/suporte-raspberry.stl
git commit -m "feat(models): adiciona suporte para Raspberry Pi 4"
```

| Prefixo | Uso |
|---|---|
| `feat` | Novo modelo, perfil ou G-code |
| `fix` | Correção de parâmetro, perfil ou G-code |
| `docs` | Documentação, print-log, filamentos |
| `chore` | Manutenção, renomeação, scripts |
| `refactor` | Reorganização sem mudança de conteúdo |

### 3. Abrir PR como draft

Abra sempre como draft primeiro. Isso permite ajustes antes de solicitar revisão.

```bash
git push -u origin feat/minha-feature

gh pr create --draft \
  --title "feat: descrição curta" \
  --body "$(cat <<'EOF'
## Resumo

- O que foi adicionado/alterado e por quê

## Checklist

- [ ] Modelo testado e aprovado (impressão física ou validação no slicer)
- [ ] Perfil salvo em `profiles/<slicer>/`
- [ ] G-code aprovado salvo em `gcodes/prints/` (se aplicável)
- [ ] `docs/print-log.md` atualizado

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"
```

### 4. Iterar e marcar como pronto

Faça os ajustes necessários (novos commits, correções de parâmetros). Se a descrição do PR
ficou desatualizada em relação ao que foi feito, atualize antes de marcar como pronto:

```bash
gh pr edit --body "$(cat <<'EOF'
## Resumo

- Descrição atualizada do que foi feito

## Checklist

- [ ] ...

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"
```

Quando estiver pronto:

```bash
gh pr ready
```

### 5. Verificar checks antes do merge

Antes de fazer merge, confirme que todos os checks do GitHub Actions passaram:

```bash
gh pr checks
```

Só prossiga com o merge se todos os checks estiverem com status `pass`. Checks com falha
devem ser corrigidos com novos commits na mesma branch.

### 6. Após merge

```bash
git checkout main && git pull
git branch -d feat/minha-feature
```

---

## Exemplos

### Adicionar novo modelo funcional

```bash
git checkout -b feat/suporte-raspberry-pi4
# ... adicionar arquivo em models/functional/ ...
git add models/functional/suporte-raspberry-pi4.stl
git commit -m "feat(models): adiciona suporte para Raspberry Pi 4"
git push -u origin feat/suporte-raspberry-pi4
gh pr create --title "feat: suporte Raspberry Pi 4"
```

### Ajustar perfil de fatiamento

```bash
git checkout -b fix/orcaslicer-pla-retraction
# ... editar perfil no OrcaSlicer e exportar ...
git add profiles/orcaslicer/
git commit -m "fix(profiles): ajusta retração do PLA no OrcaSlicer"
git push -u origin fix/orcaslicer-pla-retraction
gh pr create --title "fix: retração PLA OrcaSlicer"
```

### Registrar impressão no diário

```bash
git checkout -b docs/print-log-mai-2026
# ... editar docs/print-log.md ...
git add docs/print-log.md
git commit -m "docs(print-log): registra impressões de mai/2026"
git push -u origin docs/print-log-mai-2026
gh pr create --title "docs: print-log mai/2026"
```

### Adicionar melhoria para a impressora

```bash
git checkout -b feat/tensor-correia-eixo-x
# ... adicionar arquivo em models/upgrades-printer/ ...
git add models/upgrades-printer/tensor-correia-eixo-x.stl
git commit -m "feat(upgrades): adiciona tensor de correia eixo X"
git push -u origin feat/tensor-correia-eixo-x
gh pr create --title "feat: tensor correia eixo X"
```

---

## Validação de nomes de branch

A convenção é reforçada em duas camadas:

| Camada | Onde bloqueia | Arquivo |
|---|---|---|
| Git hook (`pre-push`) | Na máquina, antes do push | `.githooks/pre-push` |
| GitHub Actions | No PR, antes do merge | `.github/workflows/branch-name.yml` |

**Padrão aceito:** `^(main|(feat|fix|docs|chore)/[a-z0-9][a-z0-9-]*)$`

| Válido | Inválido |
|---|---|
| `feat/suporte-raspberry` | `feature/suporte-raspberry` |
| `fix/retracao-pla` | `Fix/Retracao-PLA` |
| `docs/print-log-mai` | `docs/print_log_mai` |
| `chore/reorganiza-models` | `minha-branch` |

### Ativar o hook local

Execute uma vez após clonar o repositório:

```bash
git config core.hooksPath .githooks
```
