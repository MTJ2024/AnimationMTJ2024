-- ============================================================
--   AnimationMTJ2024 © 2024 MTJ2024 | All Rights Reserved
--   Unauthorized redistribution is strictly prohibited.
--   Lizenziert für FiveM ESX Legacy.
-- ============================================================

Config = {}

-- Erwartet ressourcenname (für Kopierschutz)
Config.ResourceName = 'AnimationMTJ2024'

-- Taste zum Öffnen / Schließen des Menüs (konfigurierbar in FiveM-Einstellungen)
Config.OpenKey = 'F5'

-- Taste zum Öffnen des Animations-Rads (Rad-Modus, halten = offen)
-- Kein Standard – in FiveM-Einstellungen → Tastenbelegung → AnimationMTJ2024 setzen
Config.WheelKey = ''

-- Menü automatisch schließen wenn der Spieler läuft (true/false)
Config.CloseOnWalk = false

-- Schnellzugriff-Leiste anzeigen
Config.EnableQuickbar = true

-- ============================================================
--   SCHNELLZUGRIFF  –  5 vorkonfigurierte Animations-Slots
--   Slot-Tasten: Numpad 1–5 (konfigurierbar über FiveM-Einstellungen)
-- ============================================================
Config.Quickbar = {
    [1] = { label = '🕺 Club Dance',  dict = 'anim@amb@nightclub@dancers@club_idles',         anim = 'club_idle_1', flag = 1 },
    [2] = { label = '🤙 Chill',       dict = 'amb@world_human_hang_out_street@male_a@idle_a', anim = 'idle_a',      flag = 1 },
    [3] = { label = '💪 Flex',        dict = 'amb@world_human_flex@male_a@base',              anim = 'base',        flag = 1 },
    [4] = { label = '🧘 Yoga',        dict = 'amb@world_human_yoga@female@base',              anim = 'base',        flag = 1 },
    [5] = { label = '☀️ Sonnenbaden', dict = 'amb@world_human_sunbathe@male@base',            anim = 'base',        flag = 1 },
}

-- ============================================================
--   DIREKTE TASTENBELEGUNGEN
--   Alle Einträge erscheinen in den FiveM-Einstellungen unter
--   Tastenbelegung → AnimationMTJ2024.
--   Kein Eintrag hat eine voreingestellte Taste – der Spieler
--   wählt selbst, welche Taste er verwenden möchte.
-- ============================================================
Config.DirectKeybinds = {
    { key = '', label = 'Winken',              dict = 'mp_player_int_upperbody_idles@v2',             anim = 'idle_a',      flag = 49 },
    { key = '', label = 'Daumen hoch',         dict = 'mp_player_int_upperbody_idles@v2',             anim = 'idle_c',      flag = 49 },
    { key = '', label = 'Daumen runter',       dict = 'mp_player_int_upperbody_idles@v2',             anim = 'idle_d',      flag = 49 },
    { key = '', label = 'Jubeln',              dict = 'mp_player_int_upperbody_idles@v2',             anim = 'idle_j',      flag = 49 },
    { key = '', label = 'Klatschen',           dict = 'mp_player_int_upperbody_idles@v2',             anim = 'idle_e',      flag = 49 },
    { key = '', label = 'Zeigen',              dict = 'mp_player_int_upperbody_idles@v2',             anim = 'idle_b',      flag = 49 },
    { key = '', label = 'Lachen',              dict = 'mp_player_int_upperbody_idles@v2',             anim = 'idle_i',      flag = 49 },
    { key = '', label = 'Kopf schütteln',      dict = 'mp_player_int_upperbody_idles@v2',             anim = 'idle_f',      flag = 49 },
    { key = '', label = 'Club Dance 1',        dict = 'anim@amb@nightclub@dancers@club_idles',        anim = 'club_idle_1', flag = 1  },
    { key = '', label = 'Club Dance 2',        dict = 'anim@amb@nightclub@dancers@club_idles',        anim = 'club_idle_2', flag = 1  },
    { key = '', label = 'Slow Dance',          dict = 'anim@amb@nightclub_main@male@dncing@slow_a',   anim = 'idle_a',      flag = 1  },
    { key = '', label = 'Rauchen',             dict = 'amb@world_human_smoking@male@idle_a',          anim = 'idle_a',      flag = 1  },
    { key = '', label = 'Trinken',             dict = 'amb@world_human_drinking@male@idle_a',         anim = 'idle_a',      flag = 1  },
    { key = '', label = 'Sonnenbaden',         dict = 'amb@world_human_sunbathe@male@base',           anim = 'base',        flag = 1  },
    { key = '', label = 'Yoga',                dict = 'amb@world_human_yoga@female@base',             anim = 'base',        flag = 1  },
    { key = '', label = 'Liegestütze',         dict = 'amb@world_human_push_ups@male@base',           anim = 'base',        flag = 1  },
    { key = '', label = 'Gitarre',             dict = 'amb@world_human_musician_guitar@male@base',    anim = 'base',        flag = 1  },
    { key = '', label = 'Chill Stehen',        dict = 'amb@world_human_hang_out_street@male_a@idle_a',anim = 'idle_a',      flag = 1  },
    { key = '', label = 'Beten',               dict = 'amb@world_human_cheering@male_a@base',         anim = 'base',        flag = 1  },
    { key = '', label = 'Polizei Idle',        dict = 'amb@world_human_cop_idles@male@idle_01',       anim = 'idle_01',     flag = 1  },
    { key = '', label = 'Golf',                dict = 'amb@world_human_golf_player@male@base',        anim = 'base',        flag = 1  },
    { key = '', label = 'Fotografieren',       dict = 'amb@world_human_paparazzi@male@base',          anim = 'base',        flag = 1  },
    { key = '', label = 'Klemmbrett',          dict = 'amb@world_human_clipboard@male@base',          anim = 'base',        flag = 1  },
    { key = '', label = 'Schweißen',           dict = 'amb@world_human_welding@male@base',            anim = 'base',        flag = 1  },
    { key = '', label = 'Flex (Pose)',         dict = 'amb@world_human_flex@male_a@base',             anim = 'base',        flag = 1  },
    { key = '', label = 'Sit-Ups',             dict = 'amb@world_human_sit_ups@male@base',            anim = 'base',        flag = 1  },
}

-- ============================================================
--   ANIMATIONS-KATEGORIEN
--   flag: 1 = Loop | 49 = Loop Oberkörper | 48 = einmalig Oberkörper | 0 = einmalig
-- ============================================================
Config.Animations = {

    -- ── 🕺 Tanzen ────────────────────────────────────────────
    {
        id    = 'dance',
        label = '🕺 Tanzen',
        anims = {
            { label = 'Club Dance 1',          dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_1',     flag = 1 },
            { label = 'Club Dance 2',          dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_2',     flag = 1 },
            { label = 'Club Dance 3',          dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_3',     flag = 1 },
            { label = 'Club Dance 4',          dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_4',     flag = 1 },
            { label = 'Club Dance 5',          dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_5',     flag = 1 },
            { label = 'Club Dance 6',          dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_6',     flag = 1 },
            { label = 'Club Dance 7',          dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_7',     flag = 1 },
            { label = 'Club Dance 8',          dict = 'anim@amb@nightclub@dancers@club_idles',                  anim = 'club_idle_8',     flag = 1 },
            { label = 'Slow Dance (Mann)',      dict = 'anim@amb@nightclub_main@male@dncing@slow_a',             anim = 'idle_a',          flag = 1 },
            { label = 'Slow Dance (Frau)',      dict = 'anim@amb@nightclub_main@female@dncing@slow_a',           anim = 'idle_a',          flag = 1 },
            { label = 'Nightclub Dance A',      dict = 'anim@amb@nightclub_main@male@dncing@dncing_a',           anim = 'idle_a',          flag = 1 },
            { label = 'Nightclub Dance B',      dict = 'anim@amb@nightclub_main@male@dncing@dncing_a',           anim = 'idle_b',          flag = 1 },
            { label = 'Nightclub Dance C',      dict = 'anim@amb@nightclub_main@male@dncing@dncing_a',           anim = 'idle_c',          flag = 1 },
            { label = 'Nightclub Dance D',      dict = 'anim@amb@nightclub_main@male@dncing@dncing_a',           anim = 'idle_d',          flag = 1 },
            { label = 'Strip Club Dance',       dict = 'anim@amb@strip_club@idles@male_a@base',                  anim = 'base',            flag = 1 },
            { label = 'Feiern (Party) A',       dict = 'amb@world_human_partying@male_a@base',                   anim = 'base',            flag = 1 },
            { label = 'Feiern (Party) B',       dict = 'amb@world_human_partying@male_c@base',                   anim = 'base',            flag = 1 },
            { label = 'Feiern (Party) Frau',    dict = 'amb@world_human_partying@female_b@base',                 anim = 'base',            flag = 1 },
        },
    },

    -- ── 😴 Entspannen & Chill ─────────────────────────────────
    {
        id    = 'relax',
        label = '😴 Entspannen',
        anims = {
            { label = 'Sitzen (Picknick)',       dict = 'amb@world_human_picnic@male@idle_a',                    anim = 'idle_a',   flag = 1 },
            { label = 'Sitzen (Bürgersteig)',    dict = 'amb@world_human_seat_ledge@idle_a',                    anim = 'idle_a',   flag = 1 },
            { label = 'Sitzen (Kante, Angst)',   dict = 'amb@world_human_seat_ledge_scared@idle_a',             anim = 'idle_a',   flag = 1 },
            { label = 'Lehnen (Wand hinten)',    dict = 'amb@world_human_lean@male@wall@back@both_arms@idle_a', anim = 'idle_a',   flag = 1 },
            { label = 'Lehnen (Wand links)',     dict = 'amb@world_human_lean@male@wall@left_arm_up@idle_a',    anim = 'idle_a',   flag = 1 },
            { label = 'Fahrrad anlehnen',        dict = 'amb@world_human_leaning@world_human_leaning_bicycle@idle_a', anim = 'idle_a', flag = 1 },
            { label = 'Sonnenbaden',             dict = 'amb@world_human_sunbathe@male@base',                   anim = 'base',     flag = 1 },
            { label = 'Sonnenbaden (Frau)',       dict = 'amb@world_human_sunbathe_back@female@idle_a',          anim = 'idle_a',   flag = 1 },
            { label = 'Chill Stehen A',          dict = 'amb@world_human_hang_out_street@male_a@idle_a',        anim = 'idle_a',   flag = 1 },
            { label = 'Chill Stehen B',          dict = 'amb@world_human_hang_out_street@male_b@idle_a',        anim = 'idle_a',   flag = 1 },
            { label = 'Chill Stehen C',          dict = 'amb@world_human_hang_out_street@male_c@idle_a',        anim = 'idle_a',   flag = 1 },
            { label = 'Chill Stehen (Frau)',      dict = 'amb@world_human_hang_out_street@female_a@idle_a',     anim = 'idle_a',   flag = 1 },
            { label = 'Ungeduldig warten',        dict = 'amb@world_human_stand_impatient_upright@male@base',   anim = 'base',     flag = 1 },
            { label = 'Wachen stehen',            dict = 'amb@world_human_stand_guard@male@base',               anim = 'base',     flag = 1 },
            { label = 'Wanderer stehen',          dict = 'amb@world_human_hiker_standing@male@idle_a',          anim = 'idle_a',   flag = 1 },
            { label = 'Obdachloser schlafen',     dict = 'amb@world_human_bum_slumped@male@idle_a',             anim = 'idle_a',   flag = 1 },
        },
    },

    -- ── 🚬 Lifestyle ─────────────────────────────────────────
    {
        id    = 'lifestyle',
        label = '🚬 Lifestyle',
        anims = {
            { label = 'Rauchen (Stehend)',       dict = 'amb@world_human_smoking@male@idle_a',                  anim = 'idle_a',   flag = 1 },
            { label = 'Rauchen (AA)',             dict = 'amb@world_human_aa_smoke@male@idle_a',                 anim = 'idle_a',   flag = 1 },
            { label = 'Rauchen (Stehend AA)',     dict = 'amb@world_human_aa_smoke_stand@male@idle_a',           anim = 'idle_a',   flag = 1 },
            { label = 'Trinken (Glas)',           dict = 'amb@world_human_drinking@male@idle_a',                 anim = 'idle_a',   flag = 1 },
            { label = 'Trinken (Flasche Vodka)',  dict = 'amb@world_human_vodka_bottle@male@idle_a',             anim = 'idle_a',   flag = 1 },
            { label = 'Essen (Frau)',             dict = 'amb@world_human_eating@female@idle_a',                 anim = 'idle_a',   flag = 1 },
            { label = 'Handy (Schock-Video)',     dict = 'amb@world_human_mobile_film_shocking@male@idle_a',     anim = 'idle_a',   flag = 1 },
            { label = 'Handy (Stehend)',          dict = 'amb@world_human_stand_mobile_upright@male@idle_a',     anim = 'idle_a',   flag = 1 },
            { label = 'Handy (Filmend)',          dict = 'amb@world_human_mobile_film_shocking@male@idle_a',     anim = 'idle_a',   flag = 1 },
            { label = 'Fernglas benutzen',        dict = 'amb@world_human_binoculars@male@idle_a',               anim = 'idle_a',   flag = 1 },
            { label = 'Karte lesen (Tourist)',    dict = 'amb@world_human_tourist_map@male@base',                anim = 'base',     flag = 1 },
            { label = 'Fotografieren',            dict = 'amb@world_human_paparazzi@male@base',                  anim = 'base',     flag = 1 },
            { label = 'Drogendealer A',           dict = 'amb@world_human_drug_dealer@male@idle_a',              anim = 'idle_a',   flag = 1 },
            { label = 'Drogendealer B',           dict = 'amb@world_human_drug_dealer_hard@male@idle_a',         anim = 'idle_a',   flag = 1 },
        },
    },

    -- ── 💪 Sport & Fitness ───────────────────────────────────
    {
        id    = 'fitness',
        label = '💪 Sport & Fitness',
        anims = {
            { label = 'Liegestütze',             dict = 'amb@world_human_push_ups@male@base',                   anim = 'base',    flag = 1 },
            { label = 'Sit-Ups',                 dict = 'amb@world_human_sit_ups@male@base',                    anim = 'base',    flag = 1 },
            { label = 'Yoga',                    dict = 'amb@world_human_yoga@female@base',                     anim = 'base',    flag = 1 },
            { label = 'Flex (Pose)',             dict = 'amb@world_human_flex@male_a@base',                     anim = 'base',    flag = 1 },
            { label = 'Joggen (Stand)',           dict = 'amb@world_human_jog_standing@male@base',               anim = 'base',    flag = 1 },
            { label = 'Hanteln (Stehend)',        dict = 'amb@world_human_muscle_free_weights@male@base',        anim = 'base',    flag = 1 },
            { label = 'Hanteln (Gym)',            dict = 'amb@world_human_muscle_gym_free_weights@male@base',    anim = 'base',    flag = 1 },
            { label = 'Golf spielen',             dict = 'amb@world_human_golf_player@male@base',                anim = 'base',    flag = 1 },
        },
    },

    -- ── 🤝 Gesten & Sozial ───────────────────────────────────
    {
        id    = 'social',
        label = '🤝 Gesten & Sozial',
        anims = {
            { label = 'Winken',                  dict = 'mp_player_int_upperbody_idles@v2',  anim = 'idle_a',   flag = 49 },
            { label = 'Zeigen',                  dict = 'mp_player_int_upperbody_idles@v2',  anim = 'idle_b',   flag = 49 },
            { label = 'Daumen hoch',             dict = 'mp_player_int_upperbody_idles@v2',  anim = 'idle_c',   flag = 49 },
            { label = 'Daumen runter',           dict = 'mp_player_int_upperbody_idles@v2',  anim = 'idle_d',   flag = 49 },
            { label = 'Klatschen',               dict = 'mp_player_int_upperbody_idles@v2',  anim = 'idle_e',   flag = 49 },
            { label = 'Kopf schütteln',          dict = 'mp_player_int_upperbody_idles@v2',  anim = 'idle_f',   flag = 49 },
            { label = 'Erschrocken',             dict = 'mp_player_int_upperbody_idles@v2',  anim = 'idle_g',   flag = 49 },
            { label = 'Gelangweilt',             dict = 'mp_player_int_upperbody_idles@v2',  anim = 'idle_h',   flag = 49 },
            { label = 'Lachen',                  dict = 'mp_player_int_upperbody_idles@v2',  anim = 'idle_i',   flag = 49 },
            { label = 'Jubeln (klein)',           dict = 'mp_player_int_upperbody_idles@v2',  anim = 'idle_j',   flag = 49 },
            { label = 'Jubeln (groß)',            dict = 'mp_player_int_upperbody_idles@v3',  anim = 'idle_a',   flag = 49 },
            { label = 'Nicken',                  dict = 'mp_player_int_upperbody_idles@v3',  anim = 'idle_b',   flag = 49 },
            { label = 'Schulter zucken',         dict = 'mp_player_int_upperbody_idles@v3',  anim = 'idle_c',   flag = 49 },
            { label = 'Facepalm',                dict = 'mp_player_int_upperbody_idles@v3',  anim = 'idle_d',   flag = 49 },
            { label = 'Okay-Zeichen',            dict = 'mp_player_int_upperbody_idles@v3',  anim = 'idle_e',   flag = 49 },
            { label = 'Peace-Zeichen',           dict = 'mp_player_int_upperbody_idles@v3',  anim = 'idle_f',   flag = 49 },
            { label = 'Schere-Stein-Papier: Rock',  dict = 'mp_player_int_upperbody_rps',    anim = 'rock',     flag = 48 },
            { label = 'Schere-Stein-Papier: Paper', dict = 'mp_player_int_upperbody_rps',    anim = 'paper',    flag = 48 },
            { label = 'Schere-Stein-Papier: Schere',dict = 'mp_player_int_upperbody_rps',    anim = 'scissors', flag = 48 },
            { label = 'Winken (Welle)',           dict = 'mp_player_int_upperbody_wave',      anim = 'wave_a',   flag = 49 },
            { label = 'Winken (Welle 2)',         dict = 'mp_player_int_upperbody_wave',      anim = 'wave_b',   flag = 49 },
            { label = 'Jubeln (cheer A)',         dict = 'mp_player_int_upperbody_cheer',     anim = 'cheer_a',  flag = 49 },
            { label = 'Jubeln (cheer B)',         dict = 'mp_player_int_upperbody_cheer',     anim = 'cheer_b',  flag = 49 },
            { label = 'Jubeln (cheer C)',         dict = 'mp_player_int_upperbody_cheer',     anim = 'cheer_c',  flag = 49 },
        },
    },

    -- ── 🎭 Emotes & Reactions ────────────────────────────────
    {
        id    = 'emote',
        label = '🎭 Emotes',
        anims = {
            { label = 'Jubel (Sieg) A',          dict = 'anim@mp_player_intcelebrationmale@victory',          anim = 'victory',      flag = 0 },
            { label = 'Jubel (Sieg) B',          dict = 'anim@mp_player_intcelebrationmale@victory_b',        anim = 'victory_b',    flag = 0 },
            { label = 'Jubel (Fußball) A',        dict = 'anim@mp_player_intcelebrationmale@a_run_to_stand',   anim = 'a_run_to_stand', flag = 0 },
            { label = 'Jubel (Fußball) B',        dict = 'anim@mp_player_intcelebrationmale@gangnam_style',    anim = 'gangnam_style',  flag = 0 },
            { label = 'Jubel (Fußball) C',        dict = 'anim@mp_player_intcelebrationmale@dab',              anim = 'dab',            flag = 0 },
            { label = 'Jubel (Fußball) D',        dict = 'anim@mp_player_intcelebrationmale@worm',             anim = 'worm',           flag = 0 },
            { label = 'Jubel (Fußball) E',        dict = 'anim@mp_player_intcelebrationmale@robot',            anim = 'robot',          flag = 0 },
            { label = 'Jubel (Fußball) F',        dict = 'anim@mp_player_intcelebrationmale@charleston',       anim = 'charleston',     flag = 0 },
            { label = 'Jubel (Fußball) G',        dict = 'anim@mp_player_intcelebrationmale@sprinkler',        anim = 'sprinkler',      flag = 0 },
            { label = 'Jubel Frau A',             dict = 'anim@mp_player_intcelebrationfemale@victory',        anim = 'victory',        flag = 0 },
            { label = 'Jubel Frau B',             dict = 'anim@mp_player_intcelebrationfemale@dab',            anim = 'dab',            flag = 0 },
            { label = 'Peinlich',                 dict = 'anim@mp_player_intcelebrationmale@big_arms',         anim = 'big_arms',       flag = 0 },
            { label = 'Arm pumpen',               dict = 'anim@mp_player_intcelebrationmale@arm_pump',         anim = 'arm_pump',       flag = 0 },
            { label = 'High Five',                dict = 'anim@mp_player_intcelebrationmale@high_five_l',      anim = 'high_five_l',    flag = 0 },
            { label = 'Fist Pump',                dict = 'anim@mp_player_intcelebrationmale@fist_pump',        anim = 'fist_pump',      flag = 0 },
        },
    },

    -- ── 🎵 Musik & Kunst ─────────────────────────────────────
    {
        id    = 'music',
        label = '🎵 Musik & Kunst',
        anims = {
            { label = 'Gitarre spielen',          dict = 'amb@world_human_musician_guitar@male@base',           anim = 'base',     flag = 1 },
            { label = 'Gitarre (Straßen-Busk)',   dict = 'amb@world_human_busk@guitar@male@idle_a',            anim = 'idle_a',   flag = 1 },
            { label = 'Violine spielen',          dict = 'amb@world_human_musician_violin@male@base',           anim = 'base',     flag = 1 },
            { label = 'Singen (Mikrofon)',        dict = 'anim@mp_player_intmenu_base@base@idle_a',             anim = 'idle_a',   flag = 1 },
        },
    },

    -- ── 🔧 RP / Jobs ─────────────────────────────────────────
    {
        id    = 'rp',
        label = '🔧 RP / Jobs',
        anims = {
            { label = 'Untersuchen (Polizei)',    dict = 'amb@code_human_police_investigate@idle_b',             anim = 'idle_d',   flag = 1 },
            { label = 'Polizei Idle 1',           dict = 'amb@world_human_cop_idles@male@idle_01',               anim = 'idle_01',  flag = 1 },
            { label = 'Polizei Idle 2',           dict = 'amb@world_human_cop_idles@male@idle_02',               anim = 'idle_02',  flag = 1 },
            { label = 'Polizei Patrouille',       dict = 'amb@world_human_guard_patrol@male@base',               anim = 'base',     flag = 1 },
            { label = 'Wachmann Leuchte',         dict = 'amb@world_human_security_shine_torch@male@idle_a',     anim = 'idle_a',   flag = 1 },
            { label = 'Verkehrspolizist',         dict = 'amb@world_human_trafficwarden_idle@male@base',         anim = 'base',     flag = 1 },
            { label = 'Schweißen',                dict = 'amb@world_human_welding@male@base',                    anim = 'base',     flag = 1 },
            { label = 'Klemmbrett',               dict = 'amb@world_human_clipboard@male@base',                  anim = 'base',     flag = 1 },
            { label = 'Hämmern',                  dict = 'amb@world_human_hammering@male@base',                  anim = 'base',     flag = 1 },
            { label = 'Bagger / Schaufeln',       dict = 'amb@world_human_construction_dig@male@base',           anim = 'base',     flag = 1 },
            { label = 'Laubbläser',               dict = 'amb@world_human_gardener_leaf_blower@male@base',       anim = 'base',     flag = 1 },
            { label = 'Gärtnern',                 dict = 'amb@world_human_gardener_plant@male@base',             anim = 'base',     flag = 1 },
            { label = 'Parkplatzwächter',         dict = 'amb@world_human_car_park_attendant@idle_a',            anim = 'idle_a',   flag = 1 },
            { label = 'PC / Schreiben',           dict = 'anim@amb@office@tasks@pc@fat_idle_short',              anim = 'idle_a',   flag = 1 },
            { label = 'Kasse bedienen',           dict = 'anim@move_m@shop_assistants@idle_a',                   anim = 'idle_a',   flag = 1 },
            { label = 'Beten',                    dict = 'amb@world_human_cheering@male_a@base',                  anim = 'base',     flag = 1 },
        },
    },

    -- ── 🍹 Bar & Nachtleben ──────────────────────────────────
    {
        id    = 'bar',
        label = '🍹 Bar & Nachtleben',
        anims = {
            { label = 'Strip (Frau)',             dict = 'amb@world_human_strip@female_a@idle_a',                anim = 'idle_a',   flag = 1 },
            { label = 'Lap Dance (einsteigen)',   dict = 'anim@amb@nightclub@dancers@lap_dance@ld_p1_f0',        anim = 'ld_p1_f0_enter', flag = 1 },
            { label = 'Casino-Slot Idle',         dict = 'anim@amb@casino@games@slot_machine@male@idle_a',       anim = 'idle_a',   flag = 1 },
            { label = 'Casino-Tisch Idle',        dict = 'anim@amb@casino@games@blackjack@male@idle_a',          anim = 'idle_a',   flag = 1 },
            { label = 'Casino-Roulette Idle',     dict = 'anim@amb@casino@games@roulette@male@idle_a',           anim = 'idle_a',   flag = 1 },
            { label = 'VIP-Lounge sitzen',        dict = 'anim@amb@casino@vip_lounge@idles@male@01',             anim = 'idle_a',   flag = 1 },
            { label = 'VIP-Lounge sitzen 2',      dict = 'anim@amb@casino@vip_lounge@idles@male@02',             anim = 'idle_a',   flag = 1 },
        },
    },

    -- ── 😵 Betrunken / Besonders ─────────────────────────────
    {
        id    = 'drunk',
        label = '😵 Betrunken',
        anims = {
            { label = 'Betrunken stehen A',       dict = 'move_m@drunk@slightlydrunk',                          anim = 'idle_a',   flag = 1 },
            { label = 'Betrunken stehen B',       dict = 'move_m@drunk@verydrunk',                              anim = 'idle_a',   flag = 1 },
            { label = 'Kotzen',                   dict = 'mp_player_intarms_heist_finalb_throw_gas_can',         anim = 'intro',    flag = 0 },
            { label = 'Ohnmacht (Schlapp)',        dict = 'anim@mp_player_intouchdowns_ground',                  anim = 'intro',    flag = 0 },
            { label = 'Obdachloser schlafend',     dict = 'amb@world_human_bum_slumped@male@idle_a',             anim = 'idle_a',   flag = 1 },
        },
    },

    -- ── 🚓 Polizei / Militär ─────────────────────────────────
    {
        id    = 'police',
        label = '🚓 Polizei & Sicherheit',
        anims = {
            { label = 'Polizei Idle 1',           dict = 'amb@world_human_cop_idles@male@idle_01',               anim = 'idle_01',  flag = 1 },
            { label = 'Polizei Idle 2',           dict = 'amb@world_human_cop_idles@male@idle_02',               anim = 'idle_02',  flag = 1 },
            { label = 'Patrouille',               dict = 'amb@world_human_guard_patrol@male@base',               anim = 'base',     flag = 1 },
            { label = 'Taschenlampe',             dict = 'amb@world_human_security_shine_torch@male@idle_a',     anim = 'idle_a',   flag = 1 },
            { label = 'Tatort untersuchen',       dict = 'amb@code_human_police_investigate@idle_b',             anim = 'idle_d',   flag = 1 },
            { label = 'Festnahme (Hände hoch)',   dict = 'mp_arresting',                                         anim = 'idle',     flag = 1 },
            { label = 'Verhör (Aggro)',           dict = 'amb@code_human_police_intimidate@idle_c',              anim = 'idle_d',   flag = 1 },
            { label = 'Fingerzeig (Verhör)',      dict = 'amb@code_human_police_intimidate@idle_d',              anim = 'idle_d',   flag = 1 },
        },
    },

    -- ── 🧍 Idles & Stances ───────────────────────────────────
    {
        id    = 'idle',
        label = '🧍 Stances & Idles',
        anims = {
            { label = 'Muscle-Stance',            dict = 'anim@move_m@muscle_loop',                             anim = 'idle',     flag = 1 },
            { label = 'Aggro Stance',             dict = 'move_m@generic@aggro@idle@0',                         anim = 'idle_a',   flag = 1 },
            { label = 'Lässig (Hände Taschen)',   dict = 'anim@mp_player_intmenu_base@base@idle_a',             anim = 'idle_a',   flag = 1 },
            { label = 'Wachsam stehen',           dict = 'amb@world_human_stand_guard@male@base',               anim = 'base',     flag = 1 },
            { label = 'Ungeduldig tippen',        dict = 'amb@world_human_stand_impatient_upright@male@base',   anim = 'base',     flag = 1 },
            { label = 'Wanderer Idle',            dict = 'amb@world_human_hiker_standing@male@idle_a',          anim = 'idle_a',   flag = 1 },
            { label = 'Easteregg Idle',           dict = 'amb@world_human_easteregg@male@idle_a',               anim = 'idle_a',   flag = 1 },
            { label = 'Business Idle',            dict = 'anim@amb@business@bgen@bgen_idle@',                   anim = 'base_talk_idles_v1',  flag = 1 },
        },
    },
}
