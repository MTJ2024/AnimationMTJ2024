local isSitting = false
local targetRegistered = false
local hasArchetypeNameNative = type(GetEntityArchetypeName) == 'function'
local animationMenuOpen = false
local animationMenuIndex = 1
local animationMenuConfig = Config.AnimationMenu or {}
local animationMenuEnabled = animationMenuConfig.enabled == true
local animationMenuEntries = animationMenuConfig.entries or {}
local animationMenuCommand = animationMenuConfig.openCommand or 'animmenu'
local animationMenuKeyMapping = animationMenuConfig.openKeyMapping or 'F6'

local function showPrompt(text)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

local function stopCurrentAction()
    ClearPedTasks(PlayerPedId())
    isSitting = false
end

local function showAnimationMenuPrompt()
    if #animationMenuEntries == 0 then
        showPrompt(animationMenuConfig.noEntriesPrompt or 'Animationsmenü: keine Einträge konfiguriert')
        return
    end

    local currentEntry = animationMenuEntries[animationMenuIndex]
    local basePrompt = animationMenuConfig.prompt or 'Animationsmenü: ↑/↓ auswählen, Enter abspielen, Backspace schließen, X stoppen'
    local label = currentEntry.label or 'Unbenannt'
    showPrompt(('%s~n~Aktuell: ~y~%s~s~ (%d/%d)'):format(basePrompt, label, animationMenuIndex, #animationMenuEntries))
end

local function playAnimationEntry(entry)
    if not entry then
        return
    end

    local ped = PlayerPedId()
    if IsEntityDead(ped) or IsPedInAnyVehicle(ped, false) then
        return
    end

    stopCurrentAction()

    if entry.type == 'scenario' and entry.scenario then
        TaskStartScenarioInPlace(ped, entry.scenario, 0, true)
        return
    end

    if entry.type ~= 'anim' or not entry.dict or not entry.clip then
        return
    end

    RequestAnimDict(entry.dict)
    local timeoutAt = GetGameTimer() + 5000
    while not HasAnimDictLoaded(entry.dict) do
        if GetGameTimer() >= timeoutAt then
            return
        end
        Wait(0)
    end

    TaskPlayAnim(ped, entry.dict, entry.clip, 8.0, -8.0, -1, entry.flag or 49, 0.0, false, false, false)
end

local function toggleAnimationMenu()
    if not animationMenuEnabled then
        return
    end

    animationMenuOpen = not animationMenuOpen
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

    local xOffset = 0.0
    local yOffset = 0.0

    if seatConfig then
        zOffset = seatConfig.zOffset or zOffset
        headingOffset = seatConfig.headingOffset or headingOffset
        scenario = seatConfig.scenario or scenario
        xOffset = seatConfig.xOffset or xOffset
        yOffset = seatConfig.yOffset or yOffset
    else
        zOffset = math.max(0.30, math.min(0.60, math.abs(maxDim.z) * 0.6))
        yOffset = -math.min(0.20, math.abs(maxDim.y) * 0.12)
    end

    local seatCoords = GetOffsetFromEntityInWorldCoords(entity, xOffset, yOffset, 0.0)
    if seatCoords then
        entityCoords = seatCoords
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
            print(('[AnimationMTJ2024] %s konnte innerhalb von %dms nicht gestartet werden. Ox-Target-Sitzmenü wird beim späteren Start automatisch registriert.'):format(
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

if animationMenuEnabled then
    RegisterCommand(animationMenuCommand, function()
        toggleAnimationMenu()
    end, false)

    RegisterKeyMapping(animationMenuCommand, 'AnimationMTJ2024: Animationsmenü öffnen', 'keyboard', animationMenuKeyMapping)
end

CreateThread(function()
    while true do
        local waitTime = Config.IdleCheckInterval or 500
        local ped = PlayerPedId()

        if not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, false) then
            if animationMenuOpen then
                waitTime = 0
                showAnimationMenuPrompt()
                local hasAnimationEntries = #animationMenuEntries > 0

                if hasAnimationEntries and IsControlJustReleased(0, animationMenuConfig.upControl or 172) then
                    animationMenuIndex = animationMenuIndex - 1
                    if animationMenuIndex < 1 then
                        animationMenuIndex = #animationMenuEntries
                    end
                elseif hasAnimationEntries and IsControlJustReleased(0, animationMenuConfig.downControl or 173) then
                    animationMenuIndex = animationMenuIndex + 1
                    if animationMenuIndex > #animationMenuEntries then
                        animationMenuIndex = 1
                    end
                elseif hasAnimationEntries and IsControlJustReleased(0, animationMenuConfig.selectControl or 191) then
                    playAnimationEntry(animationMenuEntries[animationMenuIndex])
                elseif IsControlJustReleased(0, animationMenuConfig.stopControl or 73) then
                    stopCurrentAction()
                elseif IsControlJustReleased(0, animationMenuConfig.closeControl or 194) then
                    animationMenuOpen = false
                end
            else
                if isSitting then
                    waitTime = 0
                    showPrompt(Config.PromptStand)
                    if IsControlJustReleased(0, Config.StandControl) then
                        standUp()
                    end
                end
            end
        elseif isSitting then
            standUp()
        end

        Wait(waitTime)
    end
end)
