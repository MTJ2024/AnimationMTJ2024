Config = {}

Config.InteractionDistance = 2.2
Config.SearchRadius = 5.0
Config.IdleCheckInterval = 500
Config.SitControl = 38 -- E
Config.StandControl = 194 -- BACKSPACE

Config.PromptSit = 'Drücke ~INPUT_CONTEXT~, um dich hinzusetzen'
Config.PromptStand = 'Drücke ~INPUT_FRONTEND_RRIGHT~, um aufzustehen'
Config.PromptSitWithTarget = 'Sitzen: Target-Menü nutzen oder ~INPUT_CONTEXT~ drücken'
Config.AllowKeyboardFallbackWithTarget = true

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
    maxWidth = 4.5,
    maxDepth = 4.5,
    maxHeight = 2.2,
    requireKeywordMatch = false,
    modelKeywords = {
        'chair', 'seat', 'sofa', 'couch', 'bench', 'stool', 'armchair', 'officechair', 'barchair',
        'table', 'desk', 'furn', 'furniture'
    },
    blacklistKeywords = {
        'door', 'gate', 'window', 'wall', 'fence', 'sign', 'lamp', 'light', 'bin', 'trash'
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

    -- Tables / furniture fallback (for broad furniture recognition requests)
    ['prop_table_01'] = { zOffset = 0.35, headingOffset = 180.0 },
    ['prop_table_02'] = { zOffset = 0.35, headingOffset = 180.0 },
    ['prop_table_03'] = { zOffset = 0.35, headingOffset = 180.0 },
    ['prop_table_04'] = { zOffset = 0.35, headingOffset = 180.0 },
    ['prop_table_05'] = { zOffset = 0.35, headingOffset = 180.0 },
    ['prop_table_06'] = { zOffset = 0.35, headingOffset = 180.0 },
    ['prop_table_08'] = { zOffset = 0.35, headingOffset = 180.0 },
    ['prop_table_tennis'] = { zOffset = 0.35, headingOffset = 180.0 },
    ['prop_rub_table_01'] = { zOffset = 0.35, headingOffset = 180.0 },
    ['prop_desk_01'] = { zOffset = 0.40, headingOffset = 180.0 },
    ['prop_desk_02'] = { zOffset = 0.40, headingOffset = 180.0 }
}
