# AnimationMTJ2024

FiveM-Ressource für ein einfaches Sitz-Target-System (Stühle, Sofas, Bänke).

## Installation

1. Ordner in deinen `resources`-Pfad legen.
2. In `server.cfg` eintragen:

```cfg
ensure ox_target
ensure AnimationMTJ2024
```

## Konfiguration

- `config.lua` enthält:
  - stark erweiterte Sitzmodelle (Stuhl/Sofa/Bank/Tisch-nahe Möbel)
  - generische Möbel-Erkennung über Modellgröße + Modellnamen-Schlüsselwörter
  - Interaktionsdistanz
  - Tasten für Sitzen/Aufstehen
  - Optionales `ox_target`-Targeting (Fallback auf Taste in der Nähe)

## Nutzung im Spiel

- **Mit ox_target**: Öffne das Target-Menü (Third Eye, meist `ALT`) auf dem Stuhl/Sofa/Bank und wähle **Sitzen**.
- **Tastatur-Fallback (immer aktiv)**: Stelle dich nahe an ein erkennbares Möbelstück und drücke **E**.
- **Aufstehen**: **BACKSPACE**.
