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
  - Sitzmodelle (Stuhl/Sofa/Bank)
  - Interaktionsdistanz
  - Tasten für Sitzen/Aufstehen
  - Optionales `ox_target`-Targeting (Fallback auf Taste in der Nähe)
