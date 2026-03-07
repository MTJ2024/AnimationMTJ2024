-- ============================================================
--   AnimationMTJ2024 © 2024 MTJ2024 | All Rights Reserved
--   Unauthorized redistribution is strictly prohibited.
--   Lizenziert für FiveM ESX Legacy.
-- ============================================================

Config = {}

-- Erwartet ressourcenname (für Kopierschutz)
Config.ResourceName = 'AnimationMTJ2024'

-- Taste zum Öffnen / Schließen des Menüs
Config.OpenKey = 'F5'

-- Menü automatisch schließen wenn der Spieler läuft (true/false)
Config.CloseOnWalk = false

-- Schnellzugriff-Leiste anzeigen
Config.EnableQuickbar = true

-- ============================================================
--   SCHNELLZUGRIFF  –  5 vorkonfigurierte Animations-Slots
--   Slot-Tasten: Numpad 1–5 (konfigurierbar über FiveM-Einstellungen)
-- ============================================================
Config.Quickbar = {
    [1] = { label = '🕺 Club Dance',  dict = 'anim@amb@nightclub@dancers@club_idles',       anim = 'club_idle_1', flag = 1  },
    [2] = { label = '🤙 Chill',       dict = 'amb@world_human_hang_out_street@male_a@idle_a', anim = 'idle_a',      flag = 1  },
    [3] = { label = '💪 Flex',        dict = 'amb@world_human_flex@male_a@base',              anim = 'base',        flag = 1  },
    [4] = { label = '🧘 Yoga',        dict = 'amb@world_human_yoga@female@base',              anim = 'base',        flag = 1  },
    [5] = { label = '☀️ Sonnenbaden', dict = 'amb@world_human_sunbathe@male@base',            anim = 'base',        flag = 1  },
}

-- ============================================================
--   ANIMATIONS-KATEGORIEN
--   flag: 1 = Loop | 49 = Loop Oberkörper | 0 = einmalig
-- ============================================================
Config.Animations = {

    -- ── Tanzen ───────────────────────────────────────────────
    {
        id    = 'dance',
        label = '🕺 Tanzen',
        anims = {
            { label = 'Club Dance 1',    dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_1',    flag = 1 },
            { label = 'Club Dance 2',    dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_2',    flag = 1 },
            { label = 'Club Dance 3',    dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_3',    flag = 1 },
            { label = 'Club Dance 4',    dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_4',    flag = 1 },
            { label = 'Slow Dance',      dict = 'anim@amb@nightclub_main@male@dncing@slow_a',             anim = 'idle_a',         flag = 1 },
            { label = 'Lap Dance',       dict = 'anim@amb@nightclub@dancers@lap_dance@ld_p1_f0',          anim = 'ld_p1_f0_enter', flag = 1 },
        },
    },

    -- ── Entspannen ───────────────────────────────────────────
    {
        id    = 'relax',
        label = '😴 Entspannen',
        anims = {
            { label = 'Sitzen (Boden)',  dict = 'amb@world_human_picnic@male@idle_a',                     anim = 'idle_a',  flag = 1 },
            { label = 'Lehnen (Wand)',   dict = 'amb@world_human_lean@male@wall@back@both_arms@idle_a',   anim = 'idle_a',  flag = 1 },
            { label = 'Sonnenbaden',     dict = 'amb@world_human_sunbathe@male@base',                     anim = 'base',    flag = 1 },
            { label = 'Chill Stehen',    dict = 'amb@world_human_hang_out_street@male_a@idle_a',          anim = 'idle_a',  flag = 1 },
            { label = 'Telefonieren',    dict = 'amb@world_human_mobile_film_shocking@male@idle_a',       anim = 'idle_a',  flag = 1 },
            { label = 'Rauchen',         dict = 'amb@world_human_smoking@male@idle_a',                   anim = 'idle_a',  flag = 1 },
            { label = 'Trinken',         dict = 'amb@world_human_drinking@male@idle_a',                  anim = 'idle_a',  flag = 1 },
            { label = 'Essen',           dict = 'amb@world_human_eating@female@idle_a',                  anim = 'idle_a',  flag = 1 },
        },
    },

    -- ── Fitness ──────────────────────────────────────────────
    {
        id    = 'fitness',
        label = '💪 Fitness',
        anims = {
            { label = 'Liegestütze',    dict = 'amb@world_human_push_ups@male@base',                     anim = 'base', flag = 1 },
            { label = 'Sit-Ups',        dict = 'amb@world_human_sit_ups@male@base',                      anim = 'base', flag = 1 },
            { label = 'Yoga',           dict = 'amb@world_human_yoga@female@base',                       anim = 'base', flag = 1 },
            { label = 'Flex',           dict = 'amb@world_human_flex@male_a@base',                       anim = 'base', flag = 1 },
            { label = 'Joggen (Stand)', dict = 'amb@world_human_jog_standing@male@base',                 anim = 'base', flag = 1 },
        },
    },

    -- ── Sozial ───────────────────────────────────────────────
    {
        id    = 'social',
        label = '🤝 Sozial',
        anims = {
            { label = 'Winken',         dict = 'mp_player_int_upperbody_idles@v2', anim = 'idle_a', flag = 49 },
            { label = 'Zeigen',         dict = 'mp_player_int_upperbody_idles@v2', anim = 'idle_b', flag = 49 },
            { label = 'Klatschen',      dict = 'mp_player_int_upperbody_idles@v2', anim = 'idle_e', flag = 49 },
            { label = 'Daumen hoch',    dict = 'mp_player_int_upperbody_idles@v2', anim = 'idle_c', flag = 49 },
            { label = 'Daumen runter',  dict = 'mp_player_int_upperbody_idles@v2', anim = 'idle_d', flag = 49 },
            { label = 'Kopf schütteln', dict = 'mp_player_int_upperbody_idles@v2', anim = 'idle_f', flag = 49 },
            { label = 'Jubeln',         dict = 'mp_player_int_upperbody_idles@v2', anim = 'idle_j', flag = 49 },
            { label = 'Lachen',         dict = 'mp_player_int_upperbody_idles@v2', anim = 'idle_i', flag = 49 },
        },
    },

    -- ── Emotes ───────────────────────────────────────────────
    {
        id    = 'emote',
        label = '🎭 Emotes',
        anims = {
            { label = 'Erschrocken',    dict = 'mp_player_int_upperbody_idles@v2', anim = 'idle_g', flag = 49 },
            { label = 'Gelangweilt',    dict = 'mp_player_int_upperbody_idles@v2', anim = 'idle_h', flag = 49 },
            { label = 'Rock',           dict = 'mp_player_int_upperbody_rps',      anim = 'rock',     flag = 48 },
            { label = 'Paper',          dict = 'mp_player_int_upperbody_rps',      anim = 'paper',    flag = 48 },
            { label = 'Schere',         dict = 'mp_player_int_upperbody_rps',      anim = 'scissors', flag = 48 },
            { label = 'Jubeln (gross)', dict = 'mp_player_int_upperbody_idles@v3', anim = 'idle_a',   flag = 49 },
        },
    },

    -- ── RP / Job ─────────────────────────────────────────────
    {
        id    = 'rp',
        label = '🔧 RP / Job',
        anims = {
            { label = 'Untersuchen',    dict = 'amb@code_human_police_investigate@idle_b',              anim = 'idle_d', flag = 1 },
            { label = 'Schweißen',      dict = 'amb@world_human_welding@male@base',                     anim = 'base',   flag = 1 },
            { label = 'Klemmbrett',     dict = 'amb@world_human_clipboard@male@base',                   anim = 'base',   flag = 1 },
            { label = 'Beten',          dict = 'amb@world_human_cheering@male_a@base',                  anim = 'base',   flag = 1 },
            { label = 'Schreiben',      dict = 'anim@amb@office@tasks@pc@fat_idle_short',               anim = 'idle_a', flag = 1 },
        },
    },
}
