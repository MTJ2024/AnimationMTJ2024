# AnimationMTJ2024

FiveM-Ressource für Sitz-Interaktion (Stühle, Sofas, Bänke) und ein einfaches normales Animationsmenü.

## Installation

1. Ordner in deinen `resources`-Pfad legen.
2. Optional in `server.cfg` eintragen:

```cfg
ensure ox_target
ensure AnimationMTJ2024
```

## Konfiguration

- `config.lua` enthält:
  - Sitz-Optionen ausschließlich über `ox_target`
  - stark erweiterte Sitzmodelle (Stuhl/Sofa/Bank)
  - generische Sitz-Erkennung über Modellgröße + Modellnamen-Schlüsselwörter (ohne Tisch/Desk)
  - `xOffset` / `yOffset` pro Modell für Custom-Sitzobjekte
  - Taste zum Aufstehen und normales Animationsmenü

## Nutzung im Spiel

- **Mit ox_target (optional)**: Öffne das Target-Menü (Third Eye, meist `ALT`) auf dem Stuhl/Sofa/Bank und wähle **Sitzen**.
- Wenn `ox_target` nicht läuft, startet die Ressource trotzdem und das normale Animationsmenü (`F6` / `/animmenu`) bleibt nutzbar.
- **Aufstehen**: **BACKSPACE**.
- **Normales Animationsmenü**: Drücke **F6** oder nutze den Command **/animmenu**.
- **Menü-Steuerung**: Pfeil hoch/runter auswählen, **ENTER** abspielen, **X** stoppen, **BACKSPACE** schließen.

### Custom Sitzobjekte

Füge eigene Modelle in `Config.SeatModels` ein:

```lua
['my_custom_chair_prop'] = {
  zOffset = 0.45,         -- Höhe auf dem Objekt
  headingOffset = 180.0,  -- Blickrichtung beim Sitzen
  xOffset = 0.0,          -- Links/Rechts relativ zum Modellmittelpunkt
  yOffset = 0.0,          -- Vor/Zurück relativ zum Modellmittelpunkt
  scenario = 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER'
}
```
