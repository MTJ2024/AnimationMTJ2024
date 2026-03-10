# AnimationMTJ2024

FiveM-Ressource für Sitz-Interaktion (Stühle, Sofas, Bänke) und ein umfangreiches NUI-Animationsmenü für GTA V RP.

## Installation

1. Ordner in deinen `resources`-Pfad legen.
2. In `server.cfg` eintragen:

```cfg
ensure ox_target
ensure AnimationMTJ2024
```

## Konfiguration

- `config.lua` enthält:
  - **100+ Animationen & Szenarien** in 7 Kategorien (Grüsse, Emotionen, Aktionen, Tanz, Sozial, Berufe, Szenarien)
  - Sitz-Optionen über `ox_target` (optional)
  - stark erweiterte Sitzmodelle (Stuhl/Sofa/Bank)
  - generische Sitz-Erkennung über Modellgröße + Modellnamen-Schlüsselwörter
  - `xOffset` / `yOffset` pro Modell für Custom-Sitzobjekte

## Nutzung im Spiel

- **Animationsmenü**: Drücke **F6** oder nutze den Command **/animmenu**.
  - Menü erscheint rechts am Bildschirmrand, sortiert nach Kategorien.
- **Menü-Steuerung** (Tastatur oder Maus):
  - **↑ / ↓** oder Mausklick: Animation auswählen
  - **Enter** oder Abspielen-Button: Animation abspielen
  - **X** oder Stopp-Button: Animation stoppen
  - **Esc** oder ✕-Button: Menü schließen
  - **Doppelklick** auf einen Eintrag: sofort abspielen
- **Mit ox_target (optional)**: Öffne das Target-Menü (Third Eye, meist `ALT`) auf Stuhl/Sofa/Bank und wähle **Sitzen**.
- Wenn `ox_target` nicht läuft, startet die Ressource trotzdem und das Animationsmenü bleibt nutzbar.
- **Aufstehen**: **BACKSPACE**.

### Kategorien im Menü

| Kategorie | Inhalt |
|---|---|
| Grüsse & Gesten | Winken, Salutieren, Daumen hoch, Facepalm, Mittelfinger, usw. |
| Emotionen | Jubeln, Lachen, Weinen, Wütend, Schock, Nervös, usw. |
| Aktionen | Lehnen, Liegestütze, Yoga, Knien, Schlafen, Krabbeln, usw. |
| Tanz | Club-Tanz, Party, Groove, Freestyle, Stripper, usw. |
| Sozial & Alltag | Telefonieren, Selfie, Trinken, Essen, Rauchen, usw. |
| Berufe & RP | Mechaniker, Schweißen, Putzen, Fegen, Angeln, CPR, usw. |
| Musik & Unterhaltung | Gitarre, Bongos, DJ, Air Guitar, usw. |
| Szenarien | 27 Welt-Szenarien (Rauchen, Wache, Yoga, Betteln, usw.) |

## Troubleshooting / Verifikation

- Prüfe im Server-Log den Stand:
  - `ensure AnimationMTJ2024`
  - `ensure ox_target` (optional)
- Wenn `ox_target` fehlt oder verspätet startet, sollte **/animmenu** trotzdem funktionieren.
- Ein Mumble-Log wie `MUMBLE_ADD_VOICE_CHANNEL_LISTEN` stammt nicht aus dieser Ressource.

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

### Eigene Animationen hinzufügen

Füge neue Einträge in `Config.AnimationMenu.entries` ein:

```lua
-- Animation (dict + clip)
{ label = 'Meine Animation', type = 'anim', category = 'Eigene', dict = 'anim_dict_name', clip = 'clip_name', flag = 49 },

-- Szenario
{ label = 'Mein Szenario', type = 'scenario', category = 'Eigene', scenario = 'WORLD_HUMAN_EXAMPLE' },
```
