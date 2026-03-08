-- ============================================================
--   AnimationMTJ2024 © 2024 MTJ2024 | All Rights Reserved
--   Unauthorized redistribution is strictly prohibited.
-- ============================================================

local ESX = exports['es_extended']:getSharedObject()

-- ── Kopierschutz ────────────────────────────────────────────
if GetCurrentResourceName() ~= Config.ResourceName then
    print('^1[AnimationMTJ2024] WARNUNG: Ressourcenname wurde geändert!')
    print('^1[AnimationMTJ2024] Bitte den Original-Namen "AnimationMTJ2024" verwenden.^0')
end

-- ── State ────────────────────────────────────────────────────
local menuOpen    = false
local wheelOpen   = false
local currentDict = nil
local currentAnim = nil

-- Schnellzugriff-Slots (Kopie aus Config, zur Laufzeit änderbar)
local quickbarAnims = {}
for i = 1, 5 do
    quickbarAnims[i] = Config.Quickbar[i] or { label = 'Leer', dict = nil, anim = nil, flag = 1 }
end

-- ── Animation abspielen ──────────────────────────────────────
local function PlayAnimation(dict, anim, flag)
    if not dict or not anim then return end

    local ped = PlayerPedId()

    -- Laufende Animation stoppen
    if currentDict then
        ClearPedTasks(ped)
        currentDict = nil
        currentAnim = nil
    end

    RequestAnimDict(dict)
    local timeout = 0
    while not HasAnimDictLoaded(dict) and timeout < 100 do
        Wait(10)
        timeout = timeout + 1
    end

    if HasAnimDictLoaded(dict) then
        TaskPlayAnim(ped, dict, anim, 8.0, -8.0, -1, flag or 1, 0, false, false, false)
        currentDict = dict
        currentAnim = anim
    end
end

-- ── Animation stoppen ────────────────────────────────────────
local function StopAnimation()
    ClearPedTasks(PlayerPedId())
    currentDict = nil
    currentAnim = nil
end

-- ── Menü öffnen / schließen ──────────────────────────────────
local function OpenMenu()
    if menuOpen then return end
    menuOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action      = 'openMenu',
        categories  = Config.Animations,
        quickbar    = quickbarAnims,
        currentDict = currentDict,
        currentAnim = currentAnim,
        openKey     = Config.OpenKey,
    })
end

local function CloseMenu()
    if not menuOpen then return end
    menuOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'closeMenu' })
end

-- ── Tastenbelegungen ─────────────────────────────────────────
-- Diese Taste erscheint in FiveM-Einstellungen → Tastenbelegung
-- unter der Kategorie "AnimationMTJ2024" und ist dort frei änderbar.
RegisterKeyMapping('+animMenu', 'AnimationMTJ2024 – Menü öffnen / schließen', 'keyboard', Config.OpenKey)
RegisterCommand('+animMenu', function()
    if menuOpen then CloseMenu() else OpenMenu() end
end, false)

-- ── Master-Stop-Taste ─────────────────────────────────────────
-- Stoppt JEDE laufende Animation sofort – in FiveM-Einstellungen
-- unter "AnimationMTJ2024" frei belegbar.
RegisterKeyMapping('+animStop', 'AnimationMTJ2024 – Animation stoppen (Master Off)', 'keyboard', Config.StopKey)
RegisterCommand('+animStop', function()
    if not currentDict then return end
    StopAnimation()
    SendNUIMessage({ action = 'animStopped' })
end, false)

-- Schnellzugriff: Numpad 1–5
for i = 1, 5 do
    RegisterKeyMapping(
        '+animQuick' .. i,
        'AnimationMTJ2024 – Schnellzugriff Slot ' .. i,
        'keyboard',
        'NUMPAD' .. i
    )
    RegisterCommand('+animQuick' .. i, function()
        local slot = quickbarAnims[i]
        if not slot or not slot.dict then return end

        if currentDict == slot.dict and currentAnim == slot.anim then
            StopAnimation()
            SendNUIMessage({ action = 'animStopped' })
        else
            PlayAnimation(slot.dict, slot.anim, slot.flag)
            SendNUIMessage({ action = 'animPlaying', dict = slot.dict, anim = slot.anim })
        end
    end, false)
end

-- ── Direkte Tastenbelegungen für einzelne Animationen ────────
-- Jeder Eintrag in Config.DirectKeybinds bekommt ein eigenes
-- RegisterKeyMapping → in FiveM-Einstellungen → Tastenbelegung
-- unter "AnimationMTJ2024" frei änderbar.
for idx, bind in ipairs(Config.DirectKeybinds) do
    local cmdName = '+animBind' .. idx
    local desc    = 'AnimationMTJ2024 – ' .. (bind.label or ('Bind ' .. idx))
    RegisterKeyMapping(cmdName, desc, 'keyboard', bind.key or '')
    RegisterCommand(cmdName, function()
        if not bind.dict then return end
        if currentDict == bind.dict and currentAnim == bind.anim then
            StopAnimation()
            SendNUIMessage({ action = 'animStopped' })
        else
            PlayAnimation(bind.dict, bind.anim, bind.flag)
            SendNUIMessage({ action = 'animPlaying', dict = bind.dict, anim = bind.anim })
        end
    end, false)
end

-- ── Animations-Rad (Wheel) ────────────────────────────────────
-- Halten = Rad offen  |  Loslassen = Rad schließen (wie GTA Waffenrad)
-- Taste in FiveM-Einstellungen → Tastenbelegung → AnimationMTJ2024 bindbar
RegisterKeyMapping('+animWheel', 'AnimationMTJ2024 – Animations-Rad (halten)', 'keyboard', Config.WheelKey)
RegisterCommand('+animWheel', function()
    if menuOpen or wheelOpen then return end
    wheelOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action      = 'openWheel',
        categories  = Config.Animations,
        quickbar    = quickbarAnims,
        currentDict = currentDict,
        currentAnim = currentAnim,
    })
end, false)

RegisterCommand('-animWheel', function()
    if not wheelOpen then return end
    wheelOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'closeWheel' })
end, false)

RegisterNUICallback('playAnim', function(data, cb)
    PlayAnimation(data.dict, data.anim, data.flag)
    cb({ success = true })
end)

RegisterNUICallback('stopAnim', function(data, cb)
    StopAnimation()
    cb({ success = true })
end)

-- ── Helper: NUI-Fokus freigeben ─────────────────────────────
local function ReleaseNuiFocus()
    SetNuiFocus(false, false)
end

RegisterNUICallback('closeMenu', function(data, cb)
    menuOpen = false
    ReleaseNuiFocus()
    cb({ success = true })
end)

RegisterNUICallback('closeWheel', function(data, cb)
    wheelOpen = false
    ReleaseNuiFocus()
    cb({ success = true })
end)

RegisterNUICallback('setQuickbar', function(data, cb)
    local slot = tonumber(data.slot)
    if slot and slot >= 1 and slot <= 5 then
        quickbarAnims[slot] = {
            label = data.label,
            dict  = data.dict,
            anim  = data.anim,
            flag  = tonumber(data.flag) or 1,
        }
    end
    cb({ success = true })
end)

-- ── Quickbar beim Start initialisieren ──────────────────────
CreateThread(function()
    Wait(2000)
    if Config.EnableQuickbar then
        SendNUIMessage({
            action   = 'initQuickbar',
            quickbar = quickbarAnims,
            openKey  = Config.OpenKey,
        })
    end
end)

-- ── Menü bei Bewegung schließen (optional) ──────────────────
if Config.CloseOnWalk then
    CreateThread(function()
        while true do
            Wait(500)
            if menuOpen and GetEntitySpeed(PlayerPedId()) > 0.5 then
                CloseMenu()
            end
        end
    end)
end
