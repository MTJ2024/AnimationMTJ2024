local isSitting = false

local function showPrompt(text)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

local function getModelConfig(entity)
    local entityModel = GetEntityModel(entity)
    for modelName, modelConfig in pairs(Config.SeatModels) do
        if entityModel == joaat(modelName) then
            return modelConfig
        end
    end
end

local function sitOnSeat(entity)
    if isSitting or entity == 0 then
        return
    end

    local ped = PlayerPedId()
    local seatConfig = getModelConfig(entity)
    if not seatConfig then
        return
    end

    local entityCoords = GetEntityCoords(entity)
    local entityHeading = GetEntityHeading(entity)
    local zOffset = seatConfig.zOffset or 0.45
    local headingOffset = seatConfig.headingOffset or 180.0
    local scenario = seatConfig.scenario or Config.DefaultScenario

    TaskStartScenarioAtPosition(
        ped,
        scenario,
        entityCoords.x,
        entityCoords.y,
        entityCoords.z + zOffset,
        entityHeading + headingOffset,
        0,
        true,
        false
    )

    isSitting = true
end

local function standUp()
    if not isSitting then
        return
    end

    ClearPedTasks(PlayerPedId())
    isSitting = false
end

local function getClosestSeat()
    local ped = PlayerPedId()
    local playerCoords = GetEntityCoords(ped)
    local closestEntity
    local closestDistance = Config.SearchRadius

    for modelName in pairs(Config.SeatModels) do
        local entity = GetClosestObjectOfType(
            playerCoords.x,
            playerCoords.y,
            playerCoords.z,
            Config.SearchRadius,
            joaat(modelName),
            false,
            false,
            false
        )

        if entity ~= 0 then
            local entityCoords = GetEntityCoords(entity)
            local distance = #(playerCoords - entityCoords)
            if distance < closestDistance then
                closestDistance = distance
                closestEntity = entity
            end
        end
    end

    return closestEntity, closestDistance
end

CreateThread(function()
    if not Config.Target.enabled then
        return
    end

    if GetResourceState(Config.Target.resource) ~= 'started' then
        return
    end

    local modelNames = {}
    for modelName in pairs(Config.SeatModels) do
        modelNames[#modelNames + 1] = modelName
    end

    exports[Config.Target.resource]:addModel(modelNames, {
        {
            name = 'animationmtj2024_sit',
            icon = 'fas fa-chair',
            label = 'Sitzen',
            distance = Config.InteractionDistance,
            canInteract = function(entity)
                return not isSitting and getModelConfig(entity) ~= nil
            end,
            onSelect = function(data)
                sitOnSeat(data.entity)
            end
        }
    })
end)

CreateThread(function()
    while true do
        local waitTime = 500
        local ped = PlayerPedId()

        if not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, false) then
            if isSitting then
                waitTime = 0
                showPrompt(Config.PromptStand)
                if IsControlJustReleased(0, Config.StandControl) then
                    standUp()
                end
            elseif not Config.Target.enabled or GetResourceState(Config.Target.resource) ~= 'started' then
                local seatEntity, distance = getClosestSeat()
                if seatEntity and distance <= Config.InteractionDistance then
                    waitTime = 0
                    showPrompt(Config.PromptSit)
                    if IsControlJustReleased(0, Config.SitControl) then
                        sitOnSeat(seatEntity)
                    end
                end
            end
        elseif isSitting then
            standUp()
        end

        Wait(waitTime)
    end
end)
