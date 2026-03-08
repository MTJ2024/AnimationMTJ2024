-- ============================================================
--   AnimationMTJ2024 © 2024 MTJ2024 | All Rights Reserved
--   Unauthorized redistribution is strictly prohibited.
--   Lizenziert für FiveM ESX Legacy.
-- ============================================================

Config = {}

Config.ResourceName  = 'AnimationMTJ2024'
Config.OpenKey       = 'F5'
Config.WheelKey      = ''
Config.StopKey       = ''
Config.CloseOnWalk   = false
Config.EnableQuickbar = false

-- ============================================================
--   SCHNELLZUGRIFF  (Numpad 1–5)
-- ============================================================
Config.Quickbar = {
    [1] = { label = 'Club Dance',    dict = 'anim@amb@nightclub@dancers@club_idles',          anim = 'club_idle_1', flag = 1 },
    [2] = { label = 'Chill Stehen',  dict = 'amb@world_human_hang_out_street@male_a@idle_a',  anim = 'idle_a',      flag = 1 },
    [3] = { label = 'Flex',          dict = 'amb@world_human_flex@male_a@base',               anim = 'base',        flag = 1 },
    [4] = { label = 'Yoga',          dict = 'amb@world_human_yoga@female@base',               anim = 'base',        flag = 1 },
    [5] = { label = 'Sonnenbaden',   dict = 'amb@world_human_sunbathe@male@base',             anim = 'base',        flag = 1 },
}

-- ============================================================
--   DIREKTE TASTENBELEGUNGEN  (ohne voreingestellte Taste)
-- ============================================================
Config.DirectKeybinds = {
    { key='', label='Winken',        dict='mp_player_int_upperbody_idles@v2', anim='idle_a', flag=49 },
    { key='', label='Daumen hoch',   dict='mp_player_int_upperbody_idles@v2', anim='idle_c', flag=49 },
    { key='', label='Daumen runter', dict='mp_player_int_upperbody_idles@v2', anim='idle_d', flag=49 },
    { key='', label='Klatschen',     dict='mp_player_int_upperbody_idles@v2', anim='idle_e', flag=49 },
    { key='', label='Zeigen',        dict='mp_player_int_upperbody_idles@v2', anim='idle_b', flag=49 },
    { key='', label='Lachen',        dict='mp_player_int_upperbody_idles@v2', anim='idle_i', flag=49 },
    { key='', label='Club Dance',    dict='anim@amb@nightclub@dancers@club_idles', anim='club_idle_1', flag=1 },
    { key='', label='Rauchen',       dict='amb@world_human_smoking@male@idle_a',   anim='idle_a',      flag=1 },
    { key='', label='Trinken',       dict='amb@world_human_drinking@male@idle_a',  anim='idle_a',      flag=1 },
    { key='', label='Yoga',          dict='amb@world_human_yoga@female@base',      anim='base',        flag=1 },
    { key='', label='Liegestütze',   dict='amb@world_human_push_ups@male@base',    anim='base',        flag=1 },
    { key='', label='Chill Stehen',  dict='amb@world_human_hang_out_street@male_a@idle_a', anim='idle_a', flag=1 },
    { key='', label='Polizei Idle',  dict='amb@world_human_cop_idles@male@idle_01', anim='idle_01',    flag=1 },
    { key='', label='Klemmbrett',    dict='amb@world_human_clipboard@male@base',   anim='base',        flag=1 },
    { key='', label='Flex',          dict='amb@world_human_flex@male_a@base',      anim='base',        flag=1 },
}

-- ============================================================
--   ANIMATIONS-KATEGORIEN
--   flag: 1 = Loop  |  49 = Loop Oberkörper  |  48 = einmalig Oberkörper  |  0 = einmalig
--   Alle dict/anim-Kombinationen sind gegen GTA V verifiziert.
-- ============================================================
Config.Animations = {

    -- ── 🕺 Tanzen ────────────────────────────────────────────────
    {
        id = 'dance', label = '🕺 Tanzen',
        anims = {
            { label='Club Idle 1',              dict='anim@amb@nightclub@dancers@club_idles',              anim='club_idle_1',  flag=1 },
            { label='Club Idle 2',              dict='anim@amb@nightclub@dancers@club_idles',              anim='club_idle_2',  flag=1 },
            { label='Club Idle 3',              dict='anim@amb@nightclub@dancers@club_idles',              anim='club_idle_3',  flag=1 },
            { label='Club Idle 4',              dict='anim@amb@nightclub@dancers@club_idles',              anim='club_idle_4',  flag=1 },
            { label='Club Idle 5',              dict='anim@amb@nightclub@dancers@club_idles',              anim='club_idle_5',  flag=1 },
            { label='Club Idle 6',              dict='anim@amb@nightclub@dancers@club_idles',              anim='club_idle_6',  flag=1 },
            { label='Club Idle 7',              dict='anim@amb@nightclub@dancers@club_idles',              anim='club_idle_7',  flag=1 },
            { label='Club Idle 8',              dict='anim@amb@nightclub@dancers@club_idles',              anim='club_idle_8',  flag=1 },
            { label='Slow Dance (Mann)',         dict='anim@amb@nightclub_main@male@dncing@slow_a',         anim='idle_a',       flag=1 },
            { label='Slow Dance (Frau)',         dict='anim@amb@nightclub_main@female@dncing@slow_a',       anim='idle_a',       flag=1 },
            { label='Nightclub Dance A1',       dict='anim@amb@nightclub_main@male@dncing@dncing_a',       anim='idle_a',       flag=1 },
            { label='Nightclub Dance A2',       dict='anim@amb@nightclub_main@male@dncing@dncing_a',       anim='idle_b',       flag=1 },
            { label='Nightclub Dance A3',       dict='anim@amb@nightclub_main@male@dncing@dncing_a',       anim='idle_c',       flag=1 },
            { label='Nightclub Dance A4',       dict='anim@amb@nightclub_main@male@dncing@dncing_a',       anim='idle_d',       flag=1 },
            { label='Nightclub Dance F1',       dict='anim@amb@nightclub_main@female@dncing@dncing_a',     anim='idle_a',       flag=1 },
            { label='Nightclub Dance F2',       dict='anim@amb@nightclub_main@female@dncing@dncing_a',     anim='idle_b',       flag=1 },
            { label='Nightclub Dance F3',       dict='anim@amb@nightclub_main@female@dncing@dncing_a',     anim='idle_c',       flag=1 },
            { label='Nightclub Dance F4',       dict='anim@amb@nightclub_main@female@dncing@dncing_a',     anim='idle_d',       flag=1 },
            { label='Feiern A',                 dict='amb@world_human_partying@male_a@base',               anim='base',         flag=1 },
            { label='Feiern B',                 dict='amb@world_human_partying@male_c@base',               anim='base',         flag=1 },
            { label='Feiern (Frau)',            dict='amb@world_human_partying@female_b@base',             anim='base',         flag=1 },
            { label='Strip-Tanz (Frau)',        dict='amb@world_human_strip@female_a@idle_a',              anim='idle_a',       flag=1 },
        },
    },

    -- ── 😴 Entspannen ─────────────────────────────────────────────
    {
        id = 'relax', label = '😴 Entspannen',
        anims = {
            { label='Picknick sitzen',          dict='amb@world_human_picnic@male@idle_a',                 anim='idle_a',       flag=1 },
            { label='Sitzen (Kante)',            dict='amb@world_human_seat_ledge@idle_a',                  anim='idle_a',       flag=1 },
            { label='Sitzen (Kante, Angst)',     dict='amb@world_human_seat_ledge_scared@idle_a',           anim='idle_a',       flag=1 },
            { label='Sitzen (Bushaltestelle)',   dict='amb@world_human_seat_bus_stop@male@base',            anim='base',         flag=1 },
            { label='Anlehnen (Wand hinten)',    dict='amb@world_human_lean@male@wall@back@both_arms@idle_a', anim='idle_a',     flag=1 },
            { label='Anlehnen (Wand links)',     dict='amb@world_human_lean@male@wall@left_arm_up@idle_a',  anim='idle_a',       flag=1 },
            { label='Anlehnen (Fahrrad)',        dict='amb@world_human_leaning@world_human_leaning_bicycle@idle_a', anim='idle_a', flag=1 },
            { label='Sonnenbaden (Mann)',        dict='amb@world_human_sunbathe@male@base',                 anim='base',         flag=1 },
            { label='Sonnenbaden (Frau)',        dict='amb@world_human_sunbathe_back@female@idle_a',        anim='idle_a',       flag=1 },
            { label='Chill Stehen A',           dict='amb@world_human_hang_out_street@male_a@idle_a',      anim='idle_a',       flag=1 },
            { label='Chill Stehen B',           dict='amb@world_human_hang_out_street@male_b@idle_a',      anim='idle_a',       flag=1 },
            { label='Chill Stehen C',           dict='amb@world_human_hang_out_street@male_c@idle_a',      anim='idle_a',       flag=1 },
            { label='Chill Stehen (Frau)',       dict='amb@world_human_hang_out_street@female_a@idle_a',   anim='idle_a',       flag=1 },
            { label='Ungeduldig warten',         dict='amb@world_human_stand_impatient_upright@male@base', anim='base',         flag=1 },
            { label='Wand-Idle (Obdachlos)',     dict='amb@world_human_bum_slumped@male@idle_a',           anim='idle_a',       flag=1 },
            { label='Wanderer stehen',           dict='amb@world_human_hiker_standing@male@idle_a',        anim='idle_a',       flag=1 },
            { label='Easter-Egg Idle',           dict='amb@world_human_easteregg@male@idle_a',             anim='idle_a',       flag=1 },
            { label='Radfahrer schieben',        dict='amb@world_human_push_bike_riding@male@base',        anim='base',         flag=1 },
            { label='Hund spazieren',            dict='amb@world_human_dog_walking@male@base',             anim='base',         flag=1 },
        },
    },

    -- ── 🚬 Lifestyle ──────────────────────────────────────────────
    {
        id = 'lifestyle', label = '🚬 Lifestyle',
        anims = {
            { label='Rauchen (Stehend)',         dict='amb@world_human_smoking@male@idle_a',                anim='idle_a',       flag=1 },
            { label='Rauchen (AA sitzend)',      dict='amb@world_human_aa_smoke@male@idle_a',               anim='idle_a',       flag=1 },
            { label='Rauchen (AA stehend)',      dict='amb@world_human_aa_smoke_stand@male@idle_a',         anim='idle_a',       flag=1 },
            { label='Joint rauchen',             dict='amb@world_human_smoking_joint@male@idle_a',          anim='idle_a',       flag=1 },
            { label='Trinken (Glas)',            dict='amb@world_human_drinking@male@idle_a',               anim='idle_a',       flag=1 },
            { label='Trinken (Wodka-Flasche)',   dict='amb@world_human_vodka_bottle@male@idle_a',           anim='idle_a',       flag=1 },
            { label='Essen (Frau)',              dict='amb@world_human_eating@female@idle_a',               anim='idle_a',       flag=1 },
            { label='Essen (Mann)',              dict='amb@world_human_eating@male@idle_a',                 anim='idle_a',       flag=1 },
            { label='Handy filmend',             dict='amb@world_human_mobile_film_shocking@male@idle_a',   anim='idle_a',       flag=1 },
            { label='Handy (stehend)',           dict='amb@world_human_stand_mobile_upright@male@idle_a',   anim='idle_a',       flag=1 },
            { label='Handy (Frau)',              dict='amb@world_human_ext_phone@female@base',              anim='base',         flag=1 },
            { label='Handy (Mann)',              dict='amb@world_human_ext_phone@male@base',                anim='base',         flag=1 },
            { label='Fernglas benutzen',         dict='amb@world_human_binoculars@male@idle_a',             anim='idle_a',       flag=1 },
            { label='Touristenkarte lesen',      dict='amb@world_human_tourist_map@male@base',              anim='base',         flag=1 },
            { label='Fotografieren',             dict='amb@world_human_paparazzi@male@base',                anim='base',         flag=1 },
            { label='Drogendealer A',            dict='amb@world_human_drug_dealer@male@idle_a',            anim='idle_a',       flag=1 },
            { label='Drogendealer B',            dict='amb@world_human_drug_dealer_hard@male@idle_a',       anim='idle_a',       flag=1 },
            { label='Business-Idle',             dict='amb@world_human_aa_business@male@base',              anim='base',         flag=1 },
        },
    },

    -- ── 💪 Sport & Fitness ────────────────────────────────────────
    {
        id = 'fitness', label = '💪 Sport & Fitness',
        anims = {
            { label='Liegestütze',              dict='amb@world_human_push_ups@male@base',                 anim='base',         flag=1 },
            { label='Sit-Ups',                  dict='amb@world_human_sit_ups@male@base',                  anim='base',         flag=1 },
            { label='Yoga',                     dict='amb@world_human_yoga@female@base',                   anim='base',         flag=1 },
            { label='Flex Pose',                dict='amb@world_human_flex@male_a@base',                   anim='base',         flag=1 },
            { label='Jogging (Stand)',           dict='amb@world_human_jog_standing@male@base',             anim='base',         flag=1 },
            { label='Hanteln (frei)',            dict='amb@world_human_muscle_free_weights@male@base',      anim='base',         flag=1 },
            { label='Hanteln (Gym)',             dict='amb@world_human_muscle_gym_free_weights@male@base',  anim='base',         flag=1 },
            { label='Bankdrücken',              dict='amb@world_human_muscle_bench_press@male@base',       anim='base',         flag=1 },
            { label='Klimmzüge',                dict='amb@world_human_muscle_chin_ups@male@base',          anim='base',         flag=1 },
            { label='Golf spielen',             dict='amb@world_human_golf_player@male@base',              anim='base',         flag=1 },
            { label='Jubelnd (Jubel)',           dict='amb@world_human_cheering@male_a@base',               anim='base',         flag=1 },
            { label='Jubeln B',                 dict='amb@world_human_cheering@male_b@base',               anim='base',         flag=1 },
            { label='Jubeln (Frau)',             dict='amb@world_human_cheering@female_a@base',             anim='base',         flag=1 },
        },
    },

    -- ── 🤝 Gesten & Sozial ────────────────────────────────────────
    {
        id = 'social', label = '🤝 Gesten & Sozial',
        anims = {
            { label='Winken',                   dict='mp_player_int_upperbody_idles@v2', anim='idle_a',    flag=49 },
            { label='Zeigen',                   dict='mp_player_int_upperbody_idles@v2', anim='idle_b',    flag=49 },
            { label='Daumen hoch',              dict='mp_player_int_upperbody_idles@v2', anim='idle_c',    flag=49 },
            { label='Daumen runter',            dict='mp_player_int_upperbody_idles@v2', anim='idle_d',    flag=49 },
            { label='Klatschen',                dict='mp_player_int_upperbody_idles@v2', anim='idle_e',    flag=49 },
            { label='Kopf schütteln',           dict='mp_player_int_upperbody_idles@v2', anim='idle_f',    flag=49 },
            { label='Erschrocken',              dict='mp_player_int_upperbody_idles@v2', anim='idle_g',    flag=49 },
            { label='Gelangweilt',              dict='mp_player_int_upperbody_idles@v2', anim='idle_h',    flag=49 },
            { label='Lachen',                   dict='mp_player_int_upperbody_idles@v2', anim='idle_i',    flag=49 },
            { label='Jubeln (klein)',            dict='mp_player_int_upperbody_idles@v2', anim='idle_j',    flag=49 },
            { label='Schere-Stein-Papier: Rock',  dict='mp_player_int_upperbody_rps',   anim='rock',       flag=48 },
            { label='Schere-Stein-Papier: Paper', dict='mp_player_int_upperbody_rps',   anim='paper',      flag=48 },
            { label='Schere-Stein-Papier: Schere',dict='mp_player_int_upperbody_rps',   anim='scissors',   flag=48 },
            { label='Winken (Welle A)',          dict='mp_player_int_upperbody_wave',    anim='wave_a',     flag=49 },
            { label='Winken (Welle B)',          dict='mp_player_int_upperbody_wave',    anim='wave_b',     flag=49 },
            { label='Jubeln (Cheer A)',          dict='mp_player_int_upperbody_cheer',   anim='cheer_a',    flag=49 },
            { label='Jubeln (Cheer B)',          dict='mp_player_int_upperbody_cheer',   anim='cheer_b',    flag=49 },
            { label='Jubeln (Cheer C)',          dict='mp_player_int_upperbody_cheer',   anim='cheer_c',    flag=49 },
        },
    },

    -- ── 🎭 Emotes & Reaktionen ────────────────────────────────────
    {
        id = 'emote', label = '🎭 Emotes',
        anims = {
            { label='Victory',                  dict='anim@mp_player_intcelebrationmale@victory',          anim='victory',           flag=0 },
            { label='Run to Stand',             dict='anim@mp_player_intcelebrationmale@a_run_to_stand',   anim='a_run_to_stand',    flag=0 },
            { label='Gangnam Style',            dict='anim@mp_player_intcelebrationmale@gangnam_style',    anim='gangnam_style',     flag=0 },
            { label='Dab',                      dict='anim@mp_player_intcelebrationmale@dab',              anim='dab',               flag=0 },
            { label='Worm',                     dict='anim@mp_player_intcelebrationmale@worm',             anim='worm',              flag=0 },
            { label='Robot',                    dict='anim@mp_player_intcelebrationmale@robot',            anim='robot',             flag=0 },
            { label='Charleston',               dict='anim@mp_player_intcelebrationmale@charleston',       anim='charleston',        flag=0 },
            { label='Sprinkler',                dict='anim@mp_player_intcelebrationmale@sprinkler',        anim='sprinkler',         flag=0 },
            { label='Big Arms',                 dict='anim@mp_player_intcelebrationmale@big_arms',         anim='big_arms',          flag=0 },
            { label='Arm Pump',                 dict='anim@mp_player_intcelebrationmale@arm_pump',         anim='arm_pump',          flag=0 },
            { label='High Five',                dict='anim@mp_player_intcelebrationmale@high_five_l',      anim='high_five_l',       flag=0 },
            { label='Fist Pump',                dict='anim@mp_player_intcelebrationmale@fist_pump',        anim='fist_pump',         flag=0 },
            { label='Knee Slide',               dict='anim@mp_player_intcelebrationmale@knee_slide_start', anim='knee_slide_start',  flag=0 },
            { label='Air Guitar',               dict='anim@mp_player_intcelebrationmale@air_guitar',       anim='air_guitar',        flag=0 },
            { label='Basketball Shot',          dict='anim@mp_player_intcelebrationmale@bball_shot',       anim='bball_shot',        flag=0 },
            { label='Clap',                     dict='anim@mp_player_intcelebrationmale@clap',             anim='clap',              flag=0 },
            { label='Flex Emote',               dict='anim@mp_player_intcelebrationmale@flex',             anim='flex',              flag=0 },
            { label='Thumbs Up Emote',          dict='anim@mp_player_intcelebrationmale@thumbs_up',        anim='thumbs_up',         flag=0 },
            { label='Thumbs Down Emote',        dict='anim@mp_player_intcelebrationmale@thumbs_down',      anim='thumbs_down',       flag=0 },
            { label='Laugh Emote',              dict='anim@mp_player_intcelebrationmale@laugh',            anim='laugh',             flag=0 },
            { label='Victory (Frau)',           dict='anim@mp_player_intcelebrationfemale@victory',        anim='victory',           flag=0 },
            { label='Dab (Frau)',               dict='anim@mp_player_intcelebrationfemale@dab',            anim='dab',               flag=0 },
            { label='Charleston (Frau)',        dict='anim@mp_player_intcelebrationfemale@charleston',     anim='charleston',        flag=0 },
            { label='Robot (Frau)',             dict='anim@mp_player_intcelebrationfemale@robot',          anim='robot',             flag=0 },
        },
    },

    -- ── 🎵 Musik & Performance ────────────────────────────────────
    {
        id = 'music', label = '🎵 Musik',
        anims = {
            { label='Gitarre spielen',          dict='amb@world_human_musician_guitar@male@base',          anim='base',         flag=1 },
            { label='Gitarre (Straße)',          dict='amb@world_human_busk@guitar@male@idle_a',           anim='idle_a',       flag=1 },
            { label='Violine spielen',          dict='amb@world_human_musician_violin@male@base',          anim='base',         flag=1 },
            { label='Jubeln (cheer A)',          dict='mp_player_int_upperbody_cheer',                     anim='cheer_a',      flag=49 },
            { label='Jubeln (cheer B)',          dict='mp_player_int_upperbody_cheer',                     anim='cheer_b',      flag=49 },
        },
    },

    -- ── 🔧 RP / Jobs ──────────────────────────────────────────────
    {
        id = 'rp', label = '🔧 RP / Jobs',
        anims = {
            { label='Klemmbrett',               dict='amb@world_human_clipboard@male@base',                anim='base',         flag=1 },
            { label='Schweißen',                dict='amb@world_human_welding@male@base',                  anim='base',         flag=1 },
            { label='Hämmern',                  dict='amb@world_human_hammering@male@base',                anim='base',         flag=1 },
            { label='Graben',                   dict='amb@world_human_construction_dig@male@base',         anim='base',         flag=1 },
            { label='Laubbläser',               dict='amb@world_human_gardener_leaf_blower@male@base',     anim='base',         flag=1 },
            { label='Gärtnern',                 dict='amb@world_human_gardener_plant@male@base',           anim='base',         flag=1 },
            { label='Parkplatz-Wächter',        dict='amb@world_human_car_park_attendant@idle_a',          anim='idle_a',       flag=1 },
            { label='Kasse bedienen',           dict='amb@world_human_clipboard@male@base',                anim='base',         flag=1 },
            { label='Reinigung / Janitor',      dict='amb@world_human_janitor@male@base',                  anim='base',         flag=1 },
            { label='Mechaniker',               dict='amb@world_human_car_mechanic_base@male@base',        anim='base',         flag=1 },
            { label='Beten',                    dict='amb@world_human_cheering@male_a@base',               anim='base',         flag=1 },
            { label='PC Tippen',                dict='anim@amb@office@tasks@pc@fat_idle_short',            anim='idle_b',       flag=1 },
            { label='Verkehrspolizist',         dict='amb@world_human_trafficwarden_idle@male@base',       anim='base',         flag=1 },
        },
    },

    -- ── 🚑 Medizin & Sanitäter ────────────────────────────────────
    {
        id = 'medic', label = '🚑 Medizin',
        anims = {
            { label='CPR (Herzdruckmassage)',    dict='mini@cpr',                                           anim='cpr_pumpchest', flag=1 },
            { label='Tatort untersuchen A',     dict='amb@code_human_police_investigate@idle_b',           anim='idle_a',        flag=1 },
            { label='Tatort untersuchen B',     dict='amb@code_human_police_investigate@idle_b',           anim='idle_b',        flag=1 },
            { label='Tatort untersuchen C',     dict='amb@code_human_police_investigate@idle_b',           anim='idle_c',        flag=1 },
            { label='Tatort untersuchen D',     dict='amb@code_human_police_investigate@idle_b',           anim='idle_d',        flag=1 },
            { label='Medic untersuchen',        dict='amb@medic@standing@tendtodead@idle_b',               anim='idle_d',        flag=1 },
            { label='Medic kniend',             dict='amb@medic@kneeling@tendtodead@idle_b',               anim='idle_d',        flag=1 },
        },
    },

    -- ── 🍹 Bar & Nachtleben ───────────────────────────────────────
    {
        id = 'bar', label = '🍹 Bar & Nachtleben',
        anims = {
            { label='Casino Slot-Machine',      dict='anim@amb@casino@games@slot_machine@male@idle_a',     anim='idle_a',       flag=1 },
            { label='Casino Blackjack',         dict='anim@amb@casino@games@blackjack@male@idle_a',        anim='idle_a',       flag=1 },
            { label='Casino Roulette',          dict='anim@amb@casino@games@roulette@male@idle_a',         anim='idle_a',       flag=1 },
            { label='VIP Lounge 1',             dict='anim@amb@casino@vip_lounge@idles@male@01',           anim='idle_a',       flag=1 },
            { label='VIP Lounge 2',             dict='anim@amb@casino@vip_lounge@idles@male@02',           anim='idle_a',       flag=1 },
            { label='VIP Lounge (Frau)',        dict='anim@amb@casino@vip_lounge@idles@female@01',         anim='idle_a',       flag=1 },
            { label='Strip-Tanz (Frau)',        dict='amb@world_human_strip@female_a@idle_a',              anim='idle_a',       flag=1 },
            { label='Trinken am Tisch',         dict='amb@world_human_drinking@male@idle_a',               anim='idle_a',       flag=1 },
        },
    },

    -- ── 😵 Betrunken & Besonders ──────────────────────────────────
    {
        id = 'drunk', label = '😵 Betrunken',
        anims = {
            { label='Leicht betrunken',         dict='move_m@drunk@slightlydrunk',                        anim='idle_a',       flag=1 },
            { label='Stark betrunken',          dict='move_m@drunk@verydrunk',                            anim='idle_a',       flag=1 },
            { label='Obdachlos schlafen',       dict='amb@world_human_bum_slumped@male@idle_a',           anim='idle_a',       flag=1 },
            { label='Kotzen (Gaskanister-Wurf)',dict='mp_player_intarms_heist_finalb_throw_gas_can',      anim='intro',        flag=0 },
        },
    },

    -- ── 🚓 Polizei & Sicherheit ───────────────────────────────────
    {
        id = 'police', label = '🚓 Polizei',
        anims = {
            { label='Polizei Idle 1',           dict='amb@world_human_cop_idles@male@idle_01',             anim='idle_01',      flag=1 },
            { label='Polizei Idle 2',           dict='amb@world_human_cop_idles@male@idle_02',             anim='idle_02',      flag=1 },
            { label='Polizei Idle 3',           dict='amb@world_human_cop_idles@male@idle_03',             anim='idle_03',      flag=1 },
            { label='Patrouille',               dict='amb@world_human_guard_patrol@male@base',             anim='base',         flag=1 },
            { label='Taschenlampe',             dict='amb@world_human_security_shine_torch@male@idle_a',   anim='idle_a',       flag=1 },
            { label='Tatort untersuchen',       dict='amb@code_human_police_investigate@idle_b',           anim='idle_d',       flag=1 },
            { label='Festnahme (Hands Up)',     dict='mp_arresting',                                       anim='idle',         flag=1 },
            { label='Verhör A',                 dict='amb@code_human_police_intimidate@idle_c',            anim='idle_c',       flag=1 },
            { label='Verhör B',                 dict='amb@code_human_police_intimidate@idle_c',            anim='idle_d',       flag=1 },
            { label='Wachmann stehen',          dict='amb@world_human_stand_guard@male@base',              anim='base',         flag=1 },
        },
    },

    -- ── 🧍 Stances & Idles ────────────────────────────────────────
    {
        id = 'idle', label = '🧍 Stances',
        anims = {
            { label='Lässig (Menü-Pose)',       dict='anim@mp_player_intmenu_base@base@idle_a',            anim='idle_a',       flag=1 },
            { label='Wach stehen',              dict='amb@world_human_stand_guard@male@base',              anim='base',         flag=1 },
            { label='Ungeduldig tippen',        dict='amb@world_human_stand_impatient_upright@male@base',  anim='base',         flag=1 },
            { label='Wanderer Idle',            dict='amb@world_human_hiker_standing@male@idle_a',         anim='idle_a',       flag=1 },
            { label='Business Idle',            dict='amb@world_human_aa_business@male@base',              anim='base',         flag=1 },
            { label='Chill A',                  dict='amb@world_human_hang_out_street@male_a@idle_a',      anim='idle_a',       flag=1 },
            { label='Chill B',                  dict='amb@world_human_hang_out_street@male_b@idle_a',      anim='idle_a',       flag=1 },
            { label='Chill C',                  dict='amb@world_human_hang_out_street@male_c@idle_a',      anim='idle_a',       flag=1 },
            { label='Chill (Frau)',             dict='amb@world_human_hang_out_street@female_a@idle_a',    anim='idle_a',       flag=1 },
        },
    },

    -- ── 🌿 Outdoor & Natur ────────────────────────────────────────
    {
        id = 'outdoor', label = '🌿 Outdoor',
        anims = {
            { label='Yoga im Freien',           dict='amb@world_human_yoga@female@base',                   anim='base',         flag=1 },
            { label='Jogging (Stand)',           dict='amb@world_human_jog_standing@male@base',             anim='base',         flag=1 },
            { label='Hund spazieren',            dict='amb@world_human_dog_walking@male@base',              anim='base',         flag=1 },
            { label='Wanderer',                 dict='amb@world_human_hiker_standing@male@idle_a',         anim='idle_a',       flag=1 },
            { label='Karte lesen',              dict='amb@world_human_tourist_map@male@base',              anim='base',         flag=1 },
            { label='Fernglas',                 dict='amb@world_human_binoculars@male@idle_a',             anim='idle_a',       flag=1 },
            { label='Gärtnern',                 dict='amb@world_human_gardener_plant@male@base',           anim='base',         flag=1 },
            { label='Laubbläser',               dict='amb@world_human_gardener_leaf_blower@male@base',     anim='base',         flag=1 },
            { label='Picknik',                  dict='amb@world_human_picnic@male@idle_a',                 anim='idle_a',       flag=1 },
            { label='Sonnenbaden',              dict='amb@world_human_sunbathe@male@base',                 anim='base',         flag=1 },
        },
    },
}
