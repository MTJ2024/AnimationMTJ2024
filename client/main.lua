local isSitting = false
local lastGenericSeat
local lastGenericScanAt = 0
local targetRegistered = false
local hasArchetypeNameNative = type(GetEntityArchetypeName) == 'function'

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

    local modelName = hasArchetypeNameNative and GetEntityArchetypeName(entity) or nil
    if modelName and modelName ~= '' then
        local normalizedModelName = string.lower(modelName)

        for _, blockedKeyword in ipairs(Config.GenericDetection.blacklistKeywords or {}) do
            if string.find(normalizedModelName, blockedKeyword, 1, true) then
                return false
            end
        end

        if Config.GenericDetection.requireKeywordMatch then
            local keywordMatch = false
            for _, keyword in ipairs(Config.GenericDetection.modelKeywords or {}) do
                if string.find(normalizedModelName, keyword, 1, true) then
                    keywordMatch = true
                    break
                end
            end

            if not keywordMatch then
                return false
            end
        end
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

    local now = GetGameTimer()
    local genericScanInterval = Config.GenericDetection.scanIntervalMs or 1000
    if lastGenericSeat and now - lastGenericScanAt < genericScanInterval and DoesEntityExist(lastGenericSeat) then
        local cachedDistance = #(playerCoords - GetEntityCoords(lastGenericSeat))
        if cachedDistance < closestDistance and isSeatEntity(lastGenericSeat) then
            return lastGenericSeat, cachedDistance
        end
    end

    local objects = GetGamePool('CObject')
    for i = 1, #objects do
        local entity = objects[i]
        local entityCoords = GetEntityCoords(entity)
        local distance = #(playerCoords - entityCoords)

        if distance <= Config.SearchRadius and distance < closestDistance then
            if isSeatEntity(entity) then
                closestDistance = distance
                closestEntity = entity
            end
        end
    end

    lastGenericSeat = closestEntity
    lastGenericScanAt = now

    return closestEntity, closestDistance
end

local function registerTargetOptions()
    if targetRegistered or not Config.Target.enabled then
        return true
    end

    if GetResourceState(Config.Target.resource) ~= 'started' then
        return false
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

    targetRegistered = true
    return true
end

CreateThread(function()
    if not Config.Target.enabled then
        return
    end

    local waitStartedAt = GetGameTimer()
    local waitTimeoutMs = Config.Target.waitTimeoutMs or 15000

    while not registerTargetOptions() do
        if GetGameTimer() - waitStartedAt > waitTimeoutMs then
            print(('[AnimationMTJ2024] %s konnte innerhalb von %dms nicht gestartet werden. Nutze Tastatur-Fallback; spätere Starts werden weiter verarbeitet.'):format(
                Config.Target.resource,
                waitTimeoutMs
            ))
            break
        end
        Wait(1000)
    end
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName == Config.Target.resource then
        registerTargetOptions()
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
            else
                local seatEntity, distance = getClosestSeat()
                local canUseKeyboardFallback = (not Config.Target.enabled) or (not targetRegistered) or Config.AllowKeyboardFallbackWithTarget

                if seatEntity and distance <= Config.InteractionDistance and canUseKeyboardFallback then
                    waitTime = 0
                    if Config.Target.enabled and targetRegistered then
                        showPrompt(Config.PromptSitWithTarget or Config.PromptSit)
                    else
                        showPrompt(Config.PromptSit)
                    end
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
