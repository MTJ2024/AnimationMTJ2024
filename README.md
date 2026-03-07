# 🎭 AnimationMTJ2024

**Professionelles Animations-Menü für FiveM ESX Legacy**

> © 2024 MTJ2024 — All Rights Reserved

---

## ✨ Features

| Feature | Details |
|---|---|
| 🎨 Dark-Glassmorphism-UI | Lila/Cyan-Gradient, animierte Karten, Hover-Effekte |
| ⚡ Schnellzugriff-Leiste | 5 konfigurierbare Slots (Numpad 1–5) |
| 🔍 Live-Suche | Echtzeit-Filterung aller Animationen |
| 📂 Kategorien | Tanzen, Entspannen, Fitness, Sozial, Emotes, RP/Job |
| 🖱️ Rechtsklick-Kontextmenü | Animation direkt einem Quickbar-Slot zuweisen |
| 🔒 Kopierschutz | Ressourcennamen-Prüfung auf Client & Server |
| ⚙️ ESX Legacy | Vollständige ESX-Integration |
| 🌐 Lua 5.4 | Moderne Lua-Syntax |

---

## 📁 Dateistruktur

```
AnimationMTJ2024/
├── fxmanifest.lua        – FiveM-Ressourcen-Manifest
├── config.lua            – Konfiguration (Kategorien, Quickbar, Tasten)
├── LICENSE               – Eigentumsrecht / Kopierschutz-Hinweis
├── client/
│   └── main.lua          – Client-Logik, NUI-Callbacks, Tastenbelegungen
├── server/
│   └── main.lua          – Server-Logik, Start-Meldung, Schutzprüfung
└── html/
    ├── index.html         – NUI-Layout
    ├── style.css          – Modernes Dark-Theme (CSS Custom Properties)
    └── app.js             – Menü-Logik, Grid, Suche, Quickbar, Kontextmenü
```

---

## 🚀 Installation

1. Ordner in dein **`resources/`**-Verzeichnis kopieren.
2. Sicherstellen, dass der Ordner **`AnimationMTJ2024`** heißt (Kopierschutz!).
3. In der `server.cfg` eintragen:
   ```cfg
   ensure AnimationMTJ2024
   ```
4. Server neu starten – fertig! ✓

---

## ⚙️ Konfiguration (`config.lua`)

```lua
Config.OpenKey       = 'F5'        -- Menü-Taste
Config.CloseOnWalk   = false       -- Menü bei Bewegung schließen
Config.EnableQuickbar = true       -- Schnellzugriff-Leiste anzeigen

-- 5 Standard-Slots der Schnellzugriff-Leiste
Config.Quickbar = {
    [1] = { label = '🕺 Club Dance', dict = '...', anim = '...', flag = 1 },
    -- ...
}
```

Die Animation-Kategorien und alle Einträge sind vollständig in `config.lua` editierbar.

---

## 🎮 Steuerung

| Taste | Aktion |
|---|---|
| `F5` (Standard) | Menü öffnen / schließen |
| `ESC` | Menü schließen |
| `Numpad 1–5` | Quickbar-Slot abspielen / stoppen |
| Linksklick auf Karte | Animation abspielen / stoppen |
| Rechtsklick auf Karte | Kontextmenü → Quickbar zuweisen |

> Alle Tasten lassen sich in den **FiveM-Einstellungen → Tastenbelegung** anpassen.

---

## 🔒 Kopierschutz

- Client und Server prüfen beim Start, ob die Ressource unter dem Namen **`AnimationMTJ2024`** läuft.
- Jede Datei enthält einen Copyright-Header.
- Weiterverteilung ist ohne ausdrückliche schriftliche Genehmigung untersagt. Siehe [`LICENSE`](LICENSE).

---

## 📄 Lizenz

Proprietäre Lizenz — © 2024 MTJ2024. Alle Rechte vorbehalten.  
Details: [`LICENSE`](LICENSE)

