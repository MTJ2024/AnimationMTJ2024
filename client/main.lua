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

local function isLikelyFurnitureSeat(entity)
    if not Config.GenericDetection.enabled then
        return false
    end

    if entity == 0 or not DoesEntityExist(entity) or not IsEntityAnObject(entity) then
        return false
    end

    local model = GetEntityModel(entity)
    if model == 0 then
        return false
    end

    local minDim, maxDim = GetModelDimensions(model)
    local width = math.abs(maxDim.x - minDim.x)
    local depth = math.abs(maxDim.y - minDim.y)
    local height = math.abs(maxDim.z - minDim.z)

    if width < Config.GenericDetection.minWidth or depth < Config.GenericDetection.minDepth or height < Config.GenericDetection.minHeight then
        return false
    end

    if width > Config.GenericDetection.maxWidth or depth > Config.GenericDetection.maxDepth or height > Config.GenericDetection.maxHeight then
        return false
    end

    return true
end

local function isSeatEntity(entity)
    if entity == 0 or not DoesEntityExist(entity) or not IsEntityAnObject(entity) then
        return false
    end

    return getModelConfig(entity) ~= nil or isLikelyFurnitureSeat(entity)
end

local function resolveSeatData(entity)
    local seatConfig = getModelConfig(entity)
    local entityCoords = GetEntityCoords(entity)
    local entityHeading = GetEntityHeading(entity)
    local _, maxDim = GetModelDimensions(GetEntityModel(entity))

    local zOffset = Config.DefaultZOffset
    local headingOffset = Config.DefaultHeadingOffset
    local scenario = Config.DefaultScenario

    if seatConfig then
        zOffset = seatConfig.zOffset or zOffset
        headingOffset = seatConfig.headingOffset or headingOffset
        scenario = seatConfig.scenario or scenario
    else
        zOffset = math.max(0.30, math.min(0.60, math.abs(maxDim.z) * 0.6))
    end

    return entityCoords, entityHeading, zOffset, headingOffset, scenario
end

local function sitOnSeat(entity)
    if isSitting or not isSeatEntity(entity) then
        return
    end

    local ped = PlayerPedId()
    if IsEntityDead(ped) or IsPedInAnyVehicle(ped, false) then
        return
    end

    local pedCoords = GetEntityCoords(ped)
    local entityCoords = GetEntityCoords(entity)
    if #(pedCoords - entityCoords) > (Config.InteractionDistance + 0.5) then
        return
    end

    local resolvedCoords, entityHeading, zOffset, headingOffset, scenario = resolveSeatData(entity)

    TaskStartScenarioAtPosition(
        ped,
        scenario,
        resolvedCoords.x,
        resolvedCoords.y,
        resolvedCoords.z + zOffset,
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
            if distance < closestDistance and isSeatEntity(entity) then
                closestDistance = distance
                closestEntity = entity
            end
        end
    end

    if closestEntity then
        return closestEntity, closestDistance
    end

    local objects = GetGamePool('CObject')
    local processed = 0

    for i = 1, #objects do
        local entity = objects[i]
        local entityCoords = GetEntityCoords(entity)
        local distance = #(playerCoords - entityCoords)

        if distance < closestDistance and isSeatEntity(entity) then
            closestDistance = distance
            closestEntity = entity
        end

        processed = processed + 1
        if processed >= Config.MaxScanObjects then
            break
        end
    end

    return closestEntity, closestDistance
end

CreateThread(function()
    if not Config.Target.enabled then
        return
    end

    while GetResourceState(Config.Target.resource) ~= 'started' do
        Wait(1000)
    end

    local modelNames = {}
    for modelName in pairs(Config.SeatModels) do
        modelNames[#modelNames + 1] = modelName
    end

    local targetOptions = {
        {
            name = 'animationmtj2024_sit',
            icon = 'fas fa-chair',
            label = 'Sitzen',
            distance = Config.InteractionDistance,
            canInteract = function(entity)
                return not isSitting and isSeatEntity(entity)
            end,
            onSelect = function(data)
                sitOnSeat(data.entity)
            end
        }
    }

    exports[Config.Target.resource]:addModel(modelNames, targetOptions)

    if Config.Target.useGlobalObject then
        exports[Config.Target.resource]:addGlobalObject({
            {
                name = 'animationmtj2024_sit_generic',
                icon = 'fas fa-chair',
                label = 'Sitzen',
                distance = Config.InteractionDistance,
                canInteract = function(entity)
                    return not isSitting and isSeatEntity(entity)
                end,
                onSelect = function(data)
                    sitOnSeat(data.entity)
                end
            }
        })
    end
end)

CreateThread(function()
    while true do
        local waitTime = Config.IdleCheckInterval or 500
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
