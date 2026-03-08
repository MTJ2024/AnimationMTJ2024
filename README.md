# 🎭 AnimationMTJ2024

**Professionelles Animations-Menü für FiveM ESX Legacy**

> © 2024 MTJ2024 — All Rights Reserved

---

## ✨ Features

| Feature | Details |
|---|---|
| 🎨 Dark-Glassmorphism-UI | Lila/Cyan-Gradient, animierte Karten, Hover-Effekte |
| ⚡ Schnellzugriff-Leiste | 5 konfigurierbare Slots (Numpad 1–5) |
| ⌨️ Direkte Tastenbelegungen | **Jede** Animation bekommt eine eigene bindbare Taste |
| 🔍 Live-Suche | Echtzeit-Filterung aller Animationen |
| 📂 12 Kategorien | 160+ Animationen: Tanzen, Entspannen, Lifestyle, Sport, Gesten, Emotes, Musik, RP/Jobs, Bar, Betrunken, Polizei, Stances |
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

### ⌨️ Direkte Tastenbelegungen (Standard)

| Taste | Animation |
|---|---|
| `J` | Winken |
| `K` | Daumen hoch |
| `L` | Daumen runter |
| `U` | Jubeln |
| `F6` | Club Dance 1 |
| `F7` | Rauchen |
| `F8` | Sonnenbaden |
| `F9` | Yoga |
| `F10` | Liegestütze |
| `F11` | Gitarre |

> Alle Tasten – einschließlich der direkten Animations-Binds – lassen sich in den  
> **FiveM-Einstellungen → Tastenbelegung → AnimationMTJ2024** frei anpassen.  
> Alle 20 konfigurierten `DirectKeybinds` erscheinen dort als eigene Einträge.

---

## 🔒 Kopierschutz

- Client und Server prüfen beim Start, ob die Ressource unter dem Namen **`AnimationMTJ2024`** läuft.
- Jede Datei enthält einen Copyright-Header.
- Weiterverteilung ist ohne ausdrückliche schriftliche Genehmigung untersagt. Siehe [`LICENSE`](LICENSE).

---

## 📄 Lizenz

Proprietäre Lizenz — © 2024 MTJ2024. Alle Rechte vorbehalten.  
Details: [`LICENSE`](LICENSE)

