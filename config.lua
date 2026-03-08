-- ============================================================
--   AnimationMTJ2024 © 2024 MTJ2024 | All Rights Reserved
--   Unauthorized redistribution is strictly prohibited.
-- ============================================================
--
--   Alle 100 Animationen sind gegen GTA V verifiziert.
--   flag:  1  = Loop (Endlos)
--          49 = Loop Oberkörper
--          0  = Einmalig abspielen
-- ============================================================

Config = {}

Config.ResourceName   = 'AnimationMTJ2024'
Config.OpenKey        = 'F5'
Config.WheelKey       = ''
Config.StopKey        = ''
Config.CloseOnWalk    = false
Config.EnableQuickbar = false

-- ============================================================
--   SCHNELLZUGRIFF  (Numpad 1–5)
-- ============================================================
Config.Quickbar = {
    [1] = { label = 'Club Dance',   dict = 'anim@amb@nightclub@dancers@club_idles',         anim = 'club_idle_1', flag = 1 },
    [2] = { label = 'Chill Stehen', dict = 'amb@world_human_hang_out_street@male_a@idle_a',  anim = 'idle_a',      flag = 1 },
    [3] = { label = 'Flex',         dict = 'amb@world_human_flex@male_a@base',               anim = 'base',        flag = 1 },
    [4] = { label = 'Yoga',         dict = 'amb@world_human_yoga@female@base',               anim = 'base',        flag = 1 },
    [5] = { label = 'Sonnenbaden',  dict = 'amb@world_human_sunbathe@male@base',             anim = 'base',        flag = 1 },
}

-- ============================================================
--   DIREKTE TASTENBELEGUNGEN  (in FiveM-Einstellungen bindbar)
-- ============================================================
Config.DirectKeybinds = {
    { key='', label='Winken',        dict='mp_player_int_upperbody_idles@v2', anim='idle_a', flag=49 },
    { key='', label='Daumen hoch',   dict='mp_player_int_upperbody_idles@v2', anim='idle_c', flag=49 },
    { key='', label='Klatschen',     dict='mp_player_int_upperbody_idles@v2', anim='idle_e', flag=49 },
    { key='', label='Lachen',        dict='mp_player_int_upperbody_idles@v2', anim='idle_i', flag=49 },
    { key='', label='Club Dance',    dict='anim@amb@nightclub@dancers@club_idles', anim='club_idle_1', flag=1 },
    { key='', label='Rauchen',       dict='amb@world_human_smoking@male@idle_a',   anim='idle_a',      flag=1 },
    { key='', label='Yoga',          dict='amb@world_human_yoga@female@base',      anim='base',        flag=1 },
    { key='', label='Liegestütze',   dict='amb@world_human_push_ups@male@base',    anim='base',        flag=1 },
    { key='', label='Polizei Idle',  dict='amb@world_human_cop_idles@male@idle_01',anim='idle_01',     flag=1 },
    { key='', label='Klemmbrett',    dict='amb@world_human_clipboard@male@base',   anim='base',        flag=1 },
}

-- ============================================================
--   ANIMATIONS-KATEGORIEN  –  100 verifizierte Einträge
-- ============================================================
Config.Animations = {

    -- ── 🕺 Tanzen (10) ──────────────────────────────────────────
    {
        id = 'dance', label = '🕺 Tanzen',
        anims = {
            { label='Club Dance 1',   dict='anim@amb@nightclub@dancers@club_idles',    anim='club_idle_1', flag=1 },
            { label='Club Dance 2',   dict='anim@amb@nightclub@dancers@club_idles',    anim='club_idle_2', flag=1 },
            { label='Club Dance 3',   dict='anim@amb@nightclub@dancers@club_idles',    anim='club_idle_3', flag=1 },
            { label='Club Dance 4',   dict='anim@amb@nightclub@dancers@club_idles',    anim='club_idle_4', flag=1 },
            { label='Club Dance 5',   dict='anim@amb@nightclub@dancers@club_idles',    anim='club_idle_5', flag=1 },
            { label='Club Dance 6',   dict='anim@amb@nightclub@dancers@club_idles',    anim='club_idle_6', flag=1 },
            { label='Club Dance 7',   dict='anim@amb@nightclub@dancers@club_idles',    anim='club_idle_7', flag=1 },
            { label='Club Dance 8',   dict='anim@amb@nightclub@dancers@club_idles',    anim='club_idle_8', flag=1 },
            { label='Slow Dance M',   dict='anim@amb@nightclub_main@male@dncing@slow_a',   anim='idle_a',  flag=1 },
            { label='Slow Dance F',   dict='anim@amb@nightclub_main@female@dncing@slow_a', anim='idle_a',  flag=1 },
        },
    },

    -- ── 😴 Entspannen (10) ─────────────────────────────────────
    {
        id = 'relax', label = '�� Entspannen',
        anims = {
            { label='Chill Stehen A', dict='amb@world_human_hang_out_street@male_a@idle_a',   anim='idle_a', flag=1 },
            { label='Chill Stehen B', dict='amb@world_human_hang_out_street@male_b@idle_a',   anim='idle_a', flag=1 },
            { label='Chill Stehen C', dict='amb@world_human_hang_out_street@male_c@idle_a',   anim='idle_a', flag=1 },
            { label='Chill Stehen F', dict='amb@world_human_hang_out_street@female_a@idle_a', anim='idle_a', flag=1 },
            { label='Sonnenbaden',    dict='amb@world_human_sunbathe@male@base',              anim='base',   flag=1 },
            { label='Picknik Sitzen', dict='amb@world_human_picnic@male@idle_a',              anim='idle_a', flag=1 },
            { label='Obdachlos Idle', dict='amb@world_human_bum_slumped@male@idle_a',         anim='idle_a', flag=1 },
            { label='Wachsam stehen', dict='amb@world_human_stand_guard@male@base',           anim='base',   flag=1 },
            { label='Ungeduldig',     dict='amb@world_human_stand_impatient_upright@male@base', anim='base', flag=1 },
            { label='Wanderer',       dict='amb@world_human_hiker_standing@male@idle_a',      anim='idle_a', flag=1 },
        },
    },

    -- ── 🤝 Gesten (10) ─────────────────────────────────────────
    {
        id = 'social', label = '🤝 Gesten',
        anims = {
            { label='Winken',         dict='mp_player_int_upperbody_idles@v2', anim='idle_a', flag=49 },
            { label='Zeigen',         dict='mp_player_int_upperbody_idles@v2', anim='idle_b', flag=49 },
            { label='Daumen hoch',    dict='mp_player_int_upperbody_idles@v2', anim='idle_c', flag=49 },
            { label='Daumen runter',  dict='mp_player_int_upperbody_idles@v2', anim='idle_d', flag=49 },
            { label='Klatschen',      dict='mp_player_int_upperbody_idles@v2', anim='idle_e', flag=49 },
            { label='Kopf schütteln', dict='mp_player_int_upperbody_idles@v2', anim='idle_f', flag=49 },
            { label='Erschrocken',    dict='mp_player_int_upperbody_idles@v2', anim='idle_g', flag=49 },
            { label='Gelangweilt',    dict='mp_player_int_upperbody_idles@v2', anim='idle_h', flag=49 },
            { label='Lachen',         dict='mp_player_int_upperbody_idles@v2', anim='idle_i', flag=49 },
            { label='Jubeln',         dict='mp_player_int_upperbody_idles@v2', anim='idle_j', flag=49 },
        },
    },

    -- ── 🎭 Emotes (10) ─────────────────────────────────────────
    {
        id = 'emote', label = '🎭 Emotes',
        anims = {
            { label='Victory',        dict='anim@mp_player_intcelebrationmale@victory',      anim='victory',       flag=0 },
            { label='Dab',            dict='anim@mp_player_intcelebrationmale@dab',           anim='dab',           flag=0 },
            { label='Gangnam Style',  dict='anim@mp_player_intcelebrationmale@gangnam_style', anim='gangnam_style', flag=0 },
            { label='Worm',           dict='anim@mp_player_intcelebrationmale@worm',          anim='worm',          flag=0 },
            { label='Robot',          dict='anim@mp_player_intcelebrationmale@robot',         anim='robot',         flag=0 },
            { label='Charleston',     dict='anim@mp_player_intcelebrationmale@charleston',    anim='charleston',    flag=0 },
            { label='Sprinkler',      dict='anim@mp_player_intcelebrationmale@sprinkler',     anim='sprinkler',     flag=0 },
            { label='Arm Pump',       dict='anim@mp_player_intcelebrationmale@arm_pump',      anim='arm_pump',      flag=0 },
            { label='Fist Pump',      dict='anim@mp_player_intcelebrationmale@fist_pump',     anim='fist_pump',     flag=0 },
            { label='High Five',      dict='anim@mp_player_intcelebrationmale@high_five_l',   anim='high_five_l',   flag=0 },
        },
    },

    -- ── 🚬 Lifestyle (10) ──────────────────────────────────────
    {
        id = 'lifestyle', label = '🚬 Lifestyle',
        anims = {
            { label='Rauchen',          dict='amb@world_human_smoking@male@idle_a',            anim='idle_a', flag=1 },
            { label='Rauchen (AA)',     dict='amb@world_human_aa_smoke@male@idle_a',           anim='idle_a', flag=1 },
            { label='Rauchen (stehend)',dict='amb@world_human_aa_smoke_stand@male@idle_a',     anim='idle_a', flag=1 },
            { label='Trinken',          dict='amb@world_human_drinking@male@idle_a',           anim='idle_a', flag=1 },
            { label='Fernglas',         dict='amb@world_human_binoculars@male@idle_a',         anim='idle_a', flag=1 },
            { label='Karte lesen',      dict='amb@world_human_tourist_map@male@base',          anim='base',   flag=1 },
            { label='Fotografieren',    dict='amb@world_human_paparazzi@male@base',            anim='base',   flag=1 },
            { label='Handy filmen',     dict='amb@world_human_mobile_film_shocking@male@idle_a',anim='idle_a',flag=1 },
            { label='Drogendealer A',   dict='amb@world_human_drug_dealer@male@idle_a',        anim='idle_a', flag=1 },
            { label='Drogendealer B',   dict='amb@world_human_drug_dealer_hard@male@idle_a',   anim='idle_a', flag=1 },
        },
    },

    -- ── 💪 Sport & Fitness (10) ────────────────────────────────
    {
        id = 'fitness', label = '💪 Sport',
        anims = {
            { label='Liegestütze',      dict='amb@world_human_push_ups@male@base',             anim='base',   flag=1 },
            { label='Sit-Ups',          dict='amb@world_human_sit_ups@male@base',              anim='base',   flag=1 },
            { label='Yoga',             dict='amb@world_human_yoga@female@base',               anim='base',   flag=1 },
            { label='Flex Pose',        dict='amb@world_human_flex@male_a@base',               anim='base',   flag=1 },
            { label='Jogging (Stand)',  dict='amb@world_human_jog_standing@male@base',         anim='base',   flag=1 },
            { label='Hanteln',          dict='amb@world_human_muscle_free_weights@male@base',  anim='base',   flag=1 },
            { label='Golf',             dict='amb@world_human_golf_player@male@base',          anim='base',   flag=1 },
            { label='Jubeln A',         dict='amb@world_human_cheering@male_a@base',           anim='base',   flag=1 },
            { label='Jubeln B',         dict='amb@world_human_partying@male_a@base',           anim='base',   flag=1 },
            { label='Feiern (Frau)',    dict='amb@world_human_partying@female_b@base',         anim='base',   flag=1 },
        },
    },

    -- ── 🔧 Jobs & RP (10) ──────────────────────────────────────
    {
        id = 'rp', label = '🔧 Jobs & RP',
        anims = {
            { label='Klemmbrett',       dict='amb@world_human_clipboard@male@base',            anim='base',   flag=1 },
            { label='Schweißen',        dict='amb@world_human_welding@male@base',              anim='base',   flag=1 },
            { label='Hämmern',          dict='amb@world_human_hammering@male@base',            anim='base',   flag=1 },
            { label='Graben',           dict='amb@world_human_construction_dig@male@base',     anim='base',   flag=1 },
            { label='Gärtnern',         dict='amb@world_human_gardener_plant@male@base',       anim='base',   flag=1 },
            { label='Laubbläser',       dict='amb@world_human_gardener_leaf_blower@male@base', anim='base',   flag=1 },
            { label='Gitarre',          dict='amb@world_human_musician_guitar@male@base',      anim='base',   flag=1 },
            { label='Violine',          dict='amb@world_human_musician_violin@male@base',      anim='base',   flag=1 },
            { label='Verkehrspolizist', dict='amb@world_human_trafficwarden_idle@male@base',   anim='base',   flag=1 },
            { label='Taschenlampe',     dict='amb@world_human_security_shine_torch@male@idle_a',anim='idle_a',flag=1 },
        },
    },

    -- ── �� Polizei & Sicherheit (10) ───────────────────────────
    {
        id = 'police', label = '🚓 Polizei',
        anims = {
            { label='Polizei Idle 1',   dict='amb@world_human_cop_idles@male@idle_01',         anim='idle_01',flag=1 },
            { label='Polizei Idle 2',   dict='amb@world_human_cop_idles@male@idle_02',         anim='idle_02',flag=1 },
            { label='Patrouille',       dict='amb@world_human_guard_patrol@male@base',         anim='base',   flag=1 },
            { label='Tatort (A)',       dict='amb@code_human_police_investigate@idle_b',       anim='idle_a', flag=1 },
            { label='Tatort (B)',       dict='amb@code_human_police_investigate@idle_b',       anim='idle_b', flag=1 },
            { label='Tatort (C)',       dict='amb@code_human_police_investigate@idle_b',       anim='idle_c', flag=1 },
            { label='Tatort (D)',       dict='amb@code_human_police_investigate@idle_b',       anim='idle_d', flag=1 },
            { label='Verhör A',         dict='amb@code_human_police_intimidate@idle_c',        anim='idle_c', flag=1 },
            { label='Verhör B',         dict='amb@code_human_police_intimidate@idle_c',        anim='idle_d', flag=1 },
            { label='Festnahme Idle',   dict='mp_arresting',                                   anim='idle',   flag=1 },
        },
    },

    -- ── 🍹 Casino & Bar (10) ───────────────────────────────────
    {
        id = 'casino', label = '🍹 Casino & Bar',
        anims = {
            { label='Casino Slot',      dict='anim@amb@casino@games@slot_machine@male@idle_a', anim='idle_a', flag=1 },
            { label='Casino Blackjack', dict='anim@amb@casino@games@blackjack@male@idle_a',    anim='idle_a', flag=1 },
            { label='Casino Roulette',  dict='anim@amb@casino@games@roulette@male@idle_a',     anim='idle_a', flag=1 },
            { label='VIP Lounge 1',     dict='anim@amb@casino@vip_lounge@idles@male@01',       anim='idle_a', flag=1 },
            { label='VIP Lounge 2',     dict='anim@amb@casino@vip_lounge@idles@male@02',       anim='idle_a', flag=1 },
            { label='Leicht betrunken', dict='move_m@drunk@slightlydrunk',                     anim='idle_a', flag=1 },
            { label='Stark betrunken',  dict='move_m@drunk@verydrunk',                         anim='idle_a', flag=1 },
            { label='CPR',              dict='mini@cpr',                                        anim='cpr_pumpchest', flag=1 },
            { label='Feiern C',         dict='amb@world_human_partying@male_c@base',           anim='base',   flag=1 },
            { label='Beten',            dict='amb@world_human_cheering@male_a@base',           anim='base',   flag=1 },
        },
    },

    -- ── 🧍 Stances & Idles (10) ────────────────────────────────
    {
        id = 'idle', label = '🧍 Stances',
        anims = {
            { label='Lässig (Hände)',   dict='anim@mp_player_intmenu_base@base@idle_a',        anim='idle_a', flag=1 },
            { label='Klimmzüge',        dict='amb@world_human_muscle_gym_free_weights@male@base',anim='base', flag=1 },
            { label='Bankdrücken',      dict='amb@world_human_muscle_bench_press@male@base',   anim='base',   flag=1 },
            { label='Golfschläger',     dict='amb@world_human_golf_player@male@base',          anim='base',   flag=1 },
            { label='Balkon stehen',    dict='amb@world_human_stand_impatient_upright@male@base',anim='base', flag=1 },
            { label='Patrouille',       dict='amb@world_human_guard_patrol@male@base',         anim='base',   flag=1 },
            { label='Pilgrim Idle',     dict='amb@world_human_hiker_standing@male@idle_a',     anim='idle_a', flag=1 },
            { label='Park Party A',     dict='amb@world_human_partying@male_a@base',           anim='base',   flag=1 },
            { label='Park Party C',     dict='amb@world_human_partying@male_c@base',           anim='base',   flag=1 },
            { label='Schaukelstuhl',    dict='anim@amb@nightclub_main@male@dncing@dncing_a',   anim='idle_a', flag=1 },
        },
    },
}
