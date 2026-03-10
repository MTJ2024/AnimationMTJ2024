Config = {}

Config.InteractionDistance = 2.2
Config.SearchRadius = 5.0
Config.IdleCheckInterval = 500
Config.StandControl = 194 -- BACKSPACE

Config.PromptStand = 'Drücke ~INPUT_FRONTEND_RRIGHT~, um aufzustehen'

Config.AnimationMenu = {
    enabled = true,
    openCommand = 'animmenu',
    openKeyMapping = 'F6',
    entries = {
        -- ==============================
        -- GRÜSSE & GESTEN
        -- ==============================
        { label = 'Winken', type = 'anim', category = 'Grüsse & Gesten', dict = 'friends@frj@ig_1', clip = 'wave_a', flag = 49 },
        { label = 'Winken 2', type = 'anim', category = 'Grüsse & Gesten', dict = 'anim@mp_player_intcelebrationmale@wave', clip = 'wave', flag = 49 },
        { label = 'Händeschütteln', type = 'anim', category = 'Grüsse & Gesten', dict = 'mp_common', clip = 'givetake1_a', flag = 49 },
        { label = 'Hände hoch', type = 'anim', category = 'Grüsse & Gesten', dict = 'missminuteman_1ig_2', clip = 'handsup_enter', flag = 49 },
        { label = 'Daumen hoch', type = 'anim', category = 'Grüsse & Gesten', dict = 'anim@mp_player_intselfiethumbs_up', clip = 'idle_a', flag = 49 },
        { label = 'Salutieren', type = 'anim', category = 'Grüsse & Gesten', dict = 'anim@mp_player_intincarsalutestd@ds@', clip = 'idle_a', flag = 49 },
        { label = 'Kopfnicken', type = 'anim', category = 'Grüsse & Gesten', dict = 'gestures@m@standing@casual', clip = 'gesture_nod_yes_hard', flag = 49 },
        { label = 'Kopfschütteln', type = 'anim', category = 'Grüsse & Gesten', dict = 'gestures@m@standing@casual', clip = 'gesture_head_no', flag = 49 },
        { label = 'Zeigen', type = 'anim', category = 'Grüsse & Gesten', dict = 'gestures@m@standing@casual', clip = 'gesture_point', flag = 49 },
        { label = 'Achselzucken', type = 'anim', category = 'Grüsse & Gesten', dict = 'gestures@m@standing@casual', clip = 'gesture_shrug_hard', flag = 49 },
        { label = 'Facepalm', type = 'anim', category = 'Grüsse & Gesten', dict = 'anim@mp_player_intcelebrationfemale@face_palm', clip = 'face_palm', flag = 49 },
        { label = 'Verbeugung', type = 'anim', category = 'Grüsse & Gesten', dict = 'anim@mp_player_intcelebrationmale@bow', clip = 'bow', flag = 49 },
        { label = 'Mittelfinger', type = 'anim', category = 'Grüsse & Gesten', dict = 'anim@mp_player_intcelebrationmale@finger', clip = 'finger', flag = 49 },
        { label = 'Slow Clap', type = 'anim', category = 'Grüsse & Gesten', dict = 'anim@mp_player_intcelebrationmale@slow_clap', clip = 'slow_clap', flag = 49 },
        { label = 'Knicks', type = 'anim', category = 'Grüsse & Gesten', dict = 'anim@mp_player_intcelebrationfemale@curtsy', clip = 'curtsy', flag = 49 },
        { label = 'Rock-Geste', type = 'anim', category = 'Grüsse & Gesten', dict = 'anim@mp_player_intcelebrationmale@rock', clip = 'rock', flag = 49 },

        -- ==============================
        -- EMOTIONEN
        -- ==============================
        { label = 'Jubeln', type = 'anim', category = 'Emotionen', dict = 'amb@world_human_cheering@male_a', clip = 'base', flag = 49 },
        { label = 'Lachen', type = 'anim', category = 'Emotionen', dict = 'anim@mp_player_intcelebrationmale@laugh', clip = 'laugh', flag = 49 },
        { label = 'Weinen', type = 'anim', category = 'Emotionen', dict = 'anim@mp_player_intcelebrationmale@cry', clip = 'cry', flag = 49 },
        { label = 'Wütend', type = 'anim', category = 'Emotionen', dict = 'misscommon@response', clip = 'screw_you', flag = 49 },
        { label = 'Angst', type = 'anim', category = 'Emotionen', dict = 'random@homelandsecurity', clip = 'knees_loop_girl', flag = 49 },
        { label = 'Schock', type = 'anim', category = 'Emotionen', dict = 'anim@mp_player_intcelebrationmale@mind_blown', clip = 'mind_blown', flag = 49 },
        { label = 'Genervt', type = 'anim', category = 'Emotionen', dict = 'random@shop_gunstore', clip = 'think', flag = 49 },
        { label = 'Verzweifelt', type = 'anim', category = 'Emotionen', dict = 'missarmenian2', clip = 'angry_argue_a', flag = 49 },
        { label = 'Nervös', type = 'anim', category = 'Emotionen', dict = 'mp_missheist_countrybank@nervous', clip = 'idle_a', flag = 49 },
        { label = 'Erschöpft', type = 'anim', category = 'Emotionen', dict = 're@construction', clip = 'out_of_breath', flag = 49 },
        { label = 'Fluchen', type = 'anim', category = 'Emotionen', dict = 'misscommon@response', clip = 'screw_you', flag = 49 },

        -- ==============================
        -- AKTIONEN
        -- ==============================
        { label = 'An Wand lehnen', type = 'anim', category = 'Aktionen', dict = 'amb@world_human_leaning@male@wall@back@foot_up@idle_a', clip = 'idle_a', flag = 49 },
        { label = 'An Geländer lehnen', type = 'anim', category = 'Aktionen', dict = 'amb@world_human_leaning@male@wall@back@hands_together@idle_a', clip = 'idle_a', flag = 49 },
        { label = 'Arme verschränken', type = 'anim', category = 'Aktionen', dict = 'anim@heists@heist_corona@single_team', clip = 'single_team_loop_boss', flag = 49 },
        { label = 'Liegestütze', type = 'anim', category = 'Aktionen', dict = 'amb@world_human_push_ups@male@base', clip = 'base', flag = 47 },
        { label = 'Sit-ups', type = 'anim', category = 'Aktionen', dict = 'amb@world_human_sit_ups@male@base', clip = 'base', flag = 47 },
        { label = 'Yoga', type = 'anim', category = 'Aktionen', dict = 'amb@world_human_yoga@male@base', clip = 'base_a', flag = 49 },
        { label = 'Knien', type = 'anim', category = 'Aktionen', dict = 'random@arrests', clip = 'kneeling_arrest_idle', flag = 49 },
        { label = 'Am Boden liegen', type = 'anim', category = 'Aktionen', dict = 'dead', clip = 'dead_a', flag = 1 },
        { label = 'Hinsetzen (Boden)', type = 'anim', category = 'Aktionen', dict = 'anim@amb@business@bgen@bgen_no_work@', clip = 'sit_phone_phoneputdown_idle_nowork', flag = 49 },
        { label = 'Aufgeben / Ergeben', type = 'anim', category = 'Aktionen', dict = 'random@mugging3', clip = 'handsup_standing_base', flag = 49 },
        { label = 'Warten', type = 'anim', category = 'Aktionen', dict = 'amb@world_human_hang_out_street@male_b@idle_a', clip = 'idle_a', flag = 49 },
        { label = 'Umschauen', type = 'anim', category = 'Aktionen', dict = 'amb@world_human_security_shine_torch@male@idle_a', clip = 'idle_a', flag = 49 },
        { label = 'Schlafen', type = 'anim', category = 'Aktionen', dict = 'misslamar1dead_body', clip = 'yourChoice', flag = 1 },
        { label = 'Humpeln', type = 'anim', category = 'Aktionen', dict = 'move_injured_ground', clip = 'front_loop', flag = 49 },
        { label = 'Krabbeln', type = 'anim', category = 'Aktionen', dict = 'move_crawl', clip = 'onfront_fwd', flag = 49 },
        { label = 'Hinkauern', type = 'anim', category = 'Aktionen', dict = 'timetable@gardener@smoking_joint', clip = 'idle_cough', flag = 49 },

        -- ==============================
        -- TANZ
        -- ==============================
        { label = 'Tanzen', type = 'anim', category = 'Tanz', dict = 'anim@amb@nightclub@dancers@crowd@hi_intensity', clip = 'hi_dance_crowd_09_v1_male^1', flag = 49 },
        { label = 'Club-Tanz', type = 'anim', category = 'Tanz', dict = 'anim@amb@nightclub@dancers@crowd@hi_intensity', clip = 'hi_dance_crowd_17_v2_male^1', flag = 49 },
        { label = 'Party-Tanz', type = 'anim', category = 'Tanz', dict = 'anim@amb@nightclub@dancers@crowd@med_intensity', clip = 'med_dance_crowd_15_v1_male^1', flag = 49 },
        { label = 'Langsamer Tanz', type = 'anim', category = 'Tanz', dict = 'anim@amb@nightclub@dancers@crowd@low_intensity', clip = 'low_dance_crowd_09_v1_male^1', flag = 49 },
        { label = 'Freier Tanz', type = 'anim', category = 'Tanz', dict = 'anim@amb@nightclub@mini@dance@dance_solo@male@var_b@', clip = 'low_center_down', flag = 49 },
        { label = 'Freestyle', type = 'anim', category = 'Tanz', dict = 'anim@amb@nightclub@mini@dance@dance_solo@male@var_a@', clip = 'high_center', flag = 49 },
        { label = 'Groove', type = 'anim', category = 'Tanz', dict = 'anim@amb@nightclub@mini@dance@dance_solo@male@var_a@', clip = 'low_center', flag = 49 },
        { label = 'Stripper-Tanz', type = 'anim', category = 'Tanz', dict = 'mini@strip_club@private_dance@part1', clip = 'priv_dance_p1', flag = 49 },

        -- ==============================
        -- SOZIAL & ALLTAG
        -- ==============================
        { label = 'Telefonieren', type = 'anim', category = 'Sozial & Alltag', dict = 'cellphone@', clip = 'cellphone_call_listen_base', flag = 49 },
        { label = 'Selfie', type = 'anim', category = 'Sozial & Alltag', dict = 'anim@mp_player_intselfieblow_kiss', clip = 'idle_a', flag = 49 },
        { label = 'Trinken', type = 'anim', category = 'Sozial & Alltag', dict = 'amb@world_human_drinking@beer@male@idle_a', clip = 'idle_a', flag = 49 },
        { label = 'Kaffee trinken', type = 'anim', category = 'Sozial & Alltag', dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a', flag = 49 },
        { label = 'Essen', type = 'anim', category = 'Sozial & Alltag', dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger', flag = 49 },
        { label = 'Rauchen (Anim)', type = 'anim', category = 'Sozial & Alltag', dict = 'amb@world_human_smoking@male@male_a@enter', clip = 'enter', flag = 49 },
        { label = 'Joint rauchen', type = 'anim', category = 'Sozial & Alltag', dict = 'anim@safehouse@yourChoice_male', clip = 'yourChoice_base', flag = 49 },
        { label = 'Karte lesen', type = 'anim', category = 'Sozial & Alltag', dict = 'missheistdockssetup1clipboard@base', clip = 'base', flag = 49 },
        { label = 'Foto machen', type = 'anim', category = 'Sozial & Alltag', dict = 'amb@world_human_paparazzi@male@base', clip = 'base', flag = 49 },
        { label = 'Binokel benutzen', type = 'anim', category = 'Sozial & Alltag', dict = 'amb@world_human_binoculars@male@base', clip = 'base', flag = 49 },
        { label = 'Geld zählen', type = 'anim', category = 'Sozial & Alltag', dict = 'anim@amb@casino@hangout@ped_male@stand@02b@idles', clip = 'idle_a', flag = 49 },

        -- ==============================
        -- BERUFE & RP
        -- ==============================
        { label = 'Mechaniker', type = 'anim', category = 'Berufe & RP', dict = 'mini@repair', clip = 'fixing_a_player', flag = 49 },
        { label = 'Schweißen', type = 'anim', category = 'Berufe & RP', dict = 'amb@world_human_welding@male@idle_a', clip = 'idle_a', flag = 49 },
        { label = 'Putzen', type = 'anim', category = 'Berufe & RP', dict = 'amb@world_human_maid_clean@', clip = 'base', flag = 49 },
        { label = 'Klemmbrett', type = 'anim', category = 'Berufe & RP', dict = 'missheistdockssetup1clipboard@idle', clip = 'idle', flag = 49 },
        { label = 'Fegen', type = 'anim', category = 'Berufe & RP', dict = 'amb@world_human_janitor@male@base', clip = 'base', flag = 49 },
        { label = 'Hämmern', type = 'anim', category = 'Berufe & RP', dict = 'amb@world_human_hammering@male@base', clip = 'base', flag = 49 },
        { label = 'Angeln', type = 'anim', category = 'Berufe & RP', dict = 'amb@world_human_stand_fishing@base', clip = 'base', flag = 49 },
        { label = 'Gärtnern', type = 'anim', category = 'Berufe & RP', dict = 'amb@world_human_gardener_plant@male@base', clip = 'base', flag = 47 },
        { label = 'Untersuchen (Medic)', type = 'anim', category = 'Berufe & RP', dict = 'mini@cpr@char_a@cpr_str', clip = 'cpr_pumpchest', flag = 49 },
        { label = 'CPR / Wiederbelebung', type = 'anim', category = 'Berufe & RP', dict = 'mini@cpr@char_a@cpr_def', clip = 'cpr_pumpchest', flag = 49 },
        { label = 'Laptop benutzen', type = 'anim', category = 'Berufe & RP', dict = 'amb@world_human_seat_wall_tablet@female@idle_a', clip = 'idle_b', flag = 49 },
        { label = 'Wache halten', type = 'anim', category = 'Berufe & RP', dict = 'amb@world_human_guard_stand@male@base', clip = 'base', flag = 49 },
        { label = 'Dirigieren', type = 'anim', category = 'Berufe & RP', dict = 'amb@world_human_car_park_attendant@male@base', clip = 'base', flag = 49 },
        { label = 'Kochen', type = 'anim', category = 'Berufe & RP', dict = 'mini@sprunk', clip = 'plyr_buy_drink_pt1', flag = 49 },

        -- ==============================
        -- MUSIK & UNTERHALTUNG
        -- ==============================
        { label = 'Gitarre spielen', type = 'anim', category = 'Musik & Unterhaltung', dict = 'amb@world_human_musician@guitar@male@base', clip = 'base', flag = 49 },
        { label = 'Bongos spielen', type = 'anim', category = 'Musik & Unterhaltung', dict = 'amb@world_human_musician@bongos@male@idle_a', clip = 'idle_a', flag = 49 },
        { label = 'DJ', type = 'anim', category = 'Musik & Unterhaltung', dict = 'anim@amb@nightclub@djs@switch_djs@', clip = 'idle_a_to_idle_c', flag = 49 },
        { label = 'Air Guitar', type = 'anim', category = 'Musik & Unterhaltung', dict = 'anim@mp_player_intcelebrationmale@air_guitar', clip = 'air_guitar', flag = 49 },
        { label = 'Air Drums', type = 'anim', category = 'Musik & Unterhaltung', dict = 'anim@mp_player_intcelebrationfemale@air_shagging', clip = 'air_shagging', flag = 49 },

        -- ==============================
        -- SZENARIEN
        -- ==============================
        { label = 'Rauchen (Szenario)', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_SMOKING' },
        { label = 'Zigarette', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_SMOKING_POT' },
        { label = 'Trinken (Szenario)', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_DRINKING' },
        { label = 'Ungeduldig', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_STAND_IMPATIENT' },
        { label = 'Handy checken', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_STAND_MOBILE' },
        { label = 'Mit Handy filmen', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_STAND_MOBILE_UPRIGHT' },
        { label = 'Wache stehen', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_GUARD_STAND' },
        { label = 'Klemmbrett (Szenario)', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_CLIPBOARD' },
        { label = 'Hämmern (Szenario)', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_HAMMERING' },
        { label = 'Schweißen (Szenario)', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_WELDING' },
        { label = 'Fegen (Szenario)', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_JANITOR' },
        { label = 'Malen', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_STAND_FISHING' },
        { label = 'Sonnenbaden', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_SUNBATHE_BACK' },
        { label = 'Muskeltraining', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_MUSCLE_FLEX' },
        { label = 'Yoga (Szenario)', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_YOGA' },
        { label = 'Betteln', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_BUM_STANDING' },
        { label = 'Betteln (sitzend)', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_BUM_SLUMPED' },
        { label = 'Tourist', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_TOURIST_MAP' },
        { label = 'Fotograf', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_PAPARAZZI' },
        { label = 'Straßenmusiker', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_MUSICIAN' },
        { label = 'Prostituierte', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_PROSTITUTE_LOW_CLASS' },
        { label = 'Liegestütze (Szenario)', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_PUSH_UPS' },
        { label = 'Sit-ups (Szenario)', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_SIT_UPS' },
        { label = 'Joggen', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_JOG_STANDING' },
        { label = 'Am Auto lehnen', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_LEANING' },
        { label = 'Mauer lehnen', type = 'scenario', category = 'Szenarien', scenario = 'WORLD_HUMAN_HANG_OUT_STREET' },
        { label = 'Parkbank sitzen', type = 'scenario', category = 'Szenarien', scenario = 'PROP_HUMAN_SEAT_BENCH' },
        { label = 'Stuhl sitzen', type = 'scenario', category = 'Szenarien', scenario = 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER' }
    }
}

Config.Target = {
    enabled = true,
    resource = 'ox_target',
    useGlobalObject = true,
    waitTimeoutMs = 15000
}

Config.DefaultScenario = 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER'
Config.DefaultZOffset = 0.45
Config.DefaultHeadingOffset = 180.0

Config.GenericDetection = {
    enabled = true,
    scanIntervalMs = 1000,
    minWidth = 0.20,
    minDepth = 0.20,
    minHeight = 0.30,
    maxWidth = 3.5,
    maxDepth = 3.5,
    maxHeight = 2.0,
    requireKeywordMatch = true,
    modelKeywords = {
        'chair', 'seat', 'sofa', 'couch', 'bench', 'stool', 'armchair', 'officechair', 'barchair', 'ottoman'
    },
    blacklistKeywords = {
        'door', 'gate', 'window', 'wall', 'fence', 'sign', 'lamp', 'light', 'bin', 'trash', 'table', 'desk'
    }
}

Config.SeatModels = {
    -- Chairs
    ['prop_chair_01a'] = { zOffset = 0.45, headingOffset = 180.0 },
    ['prop_chair_01b'] = { zOffset = 0.45, headingOffset = 180.0 },
    ['prop_chair_01c'] = { zOffset = 0.45, headingOffset = 180.0 },
    ['prop_chair_02'] = { zOffset = 0.42, headingOffset = 180.0 },
    ['prop_chair_02b'] = { zOffset = 0.42, headingOffset = 180.0 },
    ['prop_chair_03'] = { zOffset = 0.44, headingOffset = 180.0 },
    ['prop_chair_04a'] = { zOffset = 0.43, headingOffset = 180.0 },
    ['prop_chair_04b'] = { zOffset = 0.43, headingOffset = 180.0 },
    ['prop_chair_05'] = { zOffset = 0.43, headingOffset = 180.0 },
    ['prop_chair_06'] = { zOffset = 0.43, headingOffset = 180.0 },
    ['prop_chair_07'] = { zOffset = 0.43, headingOffset = 180.0 },
    ['prop_chair_08'] = { zOffset = 0.43, headingOffset = 180.0 },
    ['prop_chair_09'] = { zOffset = 0.43, headingOffset = 180.0 },
    ['prop_chair_10'] = { zOffset = 0.43, headingOffset = 180.0 },
    ['prop_chair_pile_01'] = { zOffset = 0.43, headingOffset = 180.0 },
    ['prop_cs_office_chair'] = { zOffset = 0.50, headingOffset = 180.0 },
    ['v_club_officechair'] = { zOffset = 0.50, headingOffset = 180.0 },
    ['v_corp_bk_chair3'] = { zOffset = 0.50, headingOffset = 180.0 },
    ['v_corp_cd_chair'] = { zOffset = 0.50, headingOffset = 180.0 },
    ['v_med_p_deskchair'] = { zOffset = 0.50, headingOffset = 180.0 },
    ['v_ret_gc_chair03'] = { zOffset = 0.45, headingOffset = 180.0 },
    ['v_club_barchair'] = { zOffset = 0.48, headingOffset = 180.0 },
    ['prop_skid_chair_01'] = { zOffset = 0.46, headingOffset = 180.0 },
    ['prop_waiting_seat_01'] = { zOffset = 0.46, headingOffset = 180.0 },
    ['hei_prop_hei_skid_chair'] = { zOffset = 0.46, headingOffset = 180.0 },
    ['hei_prop_yah_seat_01'] = { zOffset = 0.46, headingOffset = 180.0 },
    ['hei_prop_yah_seat_02'] = { zOffset = 0.46, headingOffset = 180.0 },
    ['hei_prop_yah_seat_03'] = { zOffset = 0.46, headingOffset = 180.0 },

    -- Sofas
    ['v_res_tre_sofa'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['v_res_mp_sofa'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['v_ilev_m_sofa'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['v_res_d_armchair'] = { zOffset = 0.46, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['v_res_fa_chair01'] = { zOffset = 0.46, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['v_res_fa_chair02'] = { zOffset = 0.46, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['v_res_fh_sofa'] = { zOffset = 0.46, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['v_res_j_sofa'] = { zOffset = 0.46, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['v_tre_sofa_mess_a_s'] = { zOffset = 0.46, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['v_tre_sofa_mess_b_s'] = { zOffset = 0.46, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['prop_couch_01'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['prop_couch_02'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['prop_couch_03'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['prop_couch_04'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['miss_rub_couch_01'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },

    -- Benches
    ['prop_bench_01a'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_02'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_03'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_04'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_05'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_06'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_08'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_09'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_10'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_11'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_12'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_13'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_14'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_15'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_16'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },

    -- Custom seats (examples, add your own object models here)
    -- ['my_custom_chair_prop'] = { zOffset = 0.45, headingOffset = 180.0, xOffset = 0.0, yOffset = 0.0, scenario = 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER' }
}
