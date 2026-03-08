Config = {}

Config.InteractionDistance = 1.7
Config.SearchRadius = 3.0
Config.SitControl = 38 -- E
Config.StandControl = 194 -- BACKSPACE

Config.PromptSit = 'Drücke ~INPUT_CONTEXT~, um dich hinzusetzen'
Config.PromptStand = 'Drücke ~INPUT_FRONTEND_RRIGHT~, um aufzustehen'

Config.Target = {
    enabled = true,
    resource = 'ox_target'
}

Config.DefaultScenario = 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER'

Config.SeatModels = {
    -- Chairs
    ['prop_chair_01a'] = { zOffset = 0.45, headingOffset = 180.0 },
    ['prop_chair_02'] = { zOffset = 0.42, headingOffset = 180.0 },
    ['prop_chair_04a'] = { zOffset = 0.43, headingOffset = 180.0 },
    ['prop_cs_office_chair'] = { zOffset = 0.50, headingOffset = 180.0 },
    ['v_club_officechair'] = { zOffset = 0.50, headingOffset = 180.0 },

    -- Sofas
    ['v_res_tre_sofa'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['v_res_mp_sofa'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['v_ilev_m_sofa'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['prop_couch_01'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },
    ['prop_couch_03'] = { zOffset = 0.45, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_SOFA' },

    -- Benches
    ['prop_bench_01a'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_02'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' },
    ['prop_bench_03'] = { zOffset = 0.42, headingOffset = 180.0, scenario = 'PROP_HUMAN_SEAT_BENCH' }
}
