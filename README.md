# AnimationMTJ2024

FiveM-Ressource für Sitz-Interaktion (Stühle, Sofas, Bänke) und ein einfaches normales Animationsmenü.

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
- **Normales Animationsmenü**: Drücke **F6** oder nutze den Command **/animmenu**.
- **Menü-Steuerung**: Pfeil hoch/runter auswählen, **ENTER** abspielen, **X** stoppen, **BACKSPACE** schließen.
