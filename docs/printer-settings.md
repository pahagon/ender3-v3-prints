# ⚙️ Configurações Base — Ender 3 V3

Referência das configurações validadas para a impressora. Atualize conforme calibrar.

---

## Calibrações realizadas

| Calibração | Status | Data | Observação |
|---|---|---|---|
| Nivelamento (mesh bed leveling) | ⬜ Pendente | — | — |
| PID do hotend | ⬜ Pendente | — | — |
| PID da mesa | ⬜ Pendente | — | — |
| E-steps / Extrusor | ⬜ Pendente | — | — |
| Pressure Advance | ⬜ Pendente | — | — |
| Input Shaping | ⬜ Pendente | — | — |
| Fluxo (Flow Rate) | ⬜ Pendente | — | — |

---

## PLA — Configurações base

| Parâmetro | Valor |
|---|---|
| Temp. bico (primeira camada) | 220°C |
| Temp. bico (restante) | 215°C |
| Temp. mesa (primeira camada) | 65°C |
| Temp. mesa (restante) | 60°C |
| Velocidade de impressão | 150 mm/s |
| Velocidade primeira camada | 40 mm/s |
| Retração | 0.5 mm @ 40 mm/s |
| Cooling | 100% (após 1ª camada) |

## PETG — Configurações base

| Parâmetro | Valor |
|---|---|
| Temp. bico | 230–240°C |
| Temp. mesa | 70–80°C |
| Velocidade | 80–120 mm/s |
| Retração | 1.0 mm @ 30 mm/s |
| Cooling | 30–50% |

---

## G-code de início (Start G-code)

```gcode
; === Start G-code — Ender 3 V3 ===
G28              ; Home all axes
G29              ; Mesh bed leveling (se habilitado)
G92 E0           ; Reset extrusor
G1 Z2.0 F3000    ; Mover Z para 2mm
G1 X10 Y20 F5000 ; Mover para posição de purga
G1 Z0.3 F300
G1 E15 F150      ; Purgar 15mm
G92 E0           ; Reset extrusor após purga
G1 Z2.0 F3000
```

## G-code de fim (End G-code)

```gcode
; === End G-code — Ender 3 V3 ===
G91              ; Relativo
G1 Z10 F3000     ; Levantar Z 10mm
G90              ; Absoluto
G1 X10 Y200 F5000 ; Apresentar peça
M104 S0          ; Desligar hotend
M140 S0          ; Desligar mesa
M84              ; Desligar motores
```

---

## Notas de manutenção

| Data | Intervenção |
|---|---|
| — | — |
