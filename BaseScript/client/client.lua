ESX = nil
local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

--local status = false

vehicle, coords, ped = 0, 0, 0

Citizen.CreateThread(function()
  ped = PlayerPedId()
  coords = GetEntityCoords(ped)
  vehicle = GetVehiclePedIsIn(ped)
  vehtype = GetVehicleClass(vehicle)
  vehcoords = GetEntityCoords(vehicle)
  pid = PlayerId()

  while true do
    ped = PlayerPedId()
    coords = GetEntityCoords(ped)
    vehicle = GetVehiclePedIsIn(ped)
    vehtype = GetVehicleClass(vehicle)
    vehcoords = GetEntityCoords(vehicle)
    pid = PlayerId()
    Wait(100)
  end
end)

Citizen.CreateThread(function() 
  while ESX == nil do 
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
      Citizen.Wait(0) 
  end
  ESX.TriggerServerCallback("ks_guide:check", function(isTeam)
    if isTeam then
        status = true
    else
      status = false
    end
  end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
    ESX.TriggerServerCallback("ks_guide:check", function(isTeam)
      if isTeam then
          status = true
      else
        status = false
      end
  end)
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

local PlayerData = {}


Citizen.CreateThread(function()
	local tobiaslutscher = PlayerId()
	AddTextEntry('FE_THDR_GTAO', '~b~Louisiana City~b~  | ~b~' .. GetPlayerName(tobiaslutscher) ..  ' - ~b~ID:~b~ ' .. GetPlayerServerId(NetworkGetEntityOwner(PlayerPedId())) .. ' ~y~x hosted by AVORO~y~')
end)


-- Automatische Nachricht Anfang

local messages = {
  [0] = "Bitte achtet auf euer RP und achtet darauf das ihr keine leute pittet sonst müsst ihr mit einen Bann rechnen!",
}

local msgdelay = 30

Citizen.CreateThread(function()
  while true do
    for i in pairs(messages) do
      TriggerEvent("ws_announce", messages[i], 10000)
      Citizen.Wait(msgdelay * 60000)
    end
  end
end)

-- Automatische Nachricht Ende


Citizen.CreateThread(function()
    SetPlayerTargetingMode(3)
    while true do
    Citizen.Wait(5000)
    InvalidateIdleCam()
    InvalidateVehicleIdleCam()
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    SetPedCanLosePropsOnDamage(PlayerPedId(), false, 0)
    RestorePlayerStamina(PlayerId(), 1.0)
    N_0xf4f2c0d4ee209e20() 
  end
end)

CreateThread(function()
  while true do
      Wait(0)
      if IsPedArmed(ped, 6) then
	    	DisableControlAction(0, 140, true)
        DisableControlAction(0, 141, true)
        DisableControlAction(0, 142, true)
      else
        Wait(50)
      end
    end
end)

-- Anti VDM Anfang

Citizen.CreateThread(function()
  N_0x4757f00bc6323cfe(-1553120962, 0.0) 
end)

-- Anti VDM Ende

-- Realtime Anfang

RegisterNetEvent("realtime:event", function(h, m, s)
  NetworkOverrideClockTime(h, m, s)
  SetMillisecondsPerGameMinute(60000)
end)

Citizen.CreateThread(function()
  TriggerServerEvent("realtime:event")
end)

-- Realtime ende

--Einreise Anfang

local isneu = false

Player = {
    gamerTags = {}
}

Citizen.CreateThread(function()
  local einreise_mid = vector3(-1269.2952, -2657.6880, 27.134) --Mittiger Punkt der Einreise                75.0 Radius

    while true do
        Citizen.Wait(0)
        local canSleep = true 

        if #(coords - einreise_mid) <= 150.0 then
          canSleep = false 
          DisableControlAction(0, 24, true)
          DisableControlAction(0, 140, true)
          DisableControlAction(0, 45, true)
          DisableControlAction(0, 80, true)
          DisableControlAction(0, 141, true)
          DisableControlAction(0, 250, true)
          DisableControlAction(0, 142, true)
          DisableControlAction(0, 257, true)
          DisableControlAction(0, 263, true)
          DisableControlAction(0, 264, true)
        end

        if canSleep then 
          Wait(1500)
        end
    end
end)

RegisterNetEvent("isneu") 
AddEventHandler("isneu", function(neu)
    isneu = neu

    Citizen.CreateThread(function()
      while isneu do
          Citizen.Wait(1000)

          if #(coords - vector3(Config.EinreiseX, Config.EinreiseY, Config.EinreiseZ)) > 150 then
            SetEntityCoords(PlayerPedId(), Config.EinreiseX, Config.EinreiseY, Config.EinreiseZ, false, false, false, true)
          end
      end
  end)

end)

AddEventHandler("playerSpawned", function()
  if isneu then 
    SetEntityCoords(PlayerPedId(), Config.EinreiseX, Config.EinreiseY, Config.EinreiseZ, false, false, false, true)
  end
end)

RegisterNetEvent("flughafentp") 
AddEventHandler("flughafentp", function()
    SetEntityCoords(PlayerPedId(), -1036.8184, -2734.3972, 13.7566)
end)

local lastCoordss = vector3(-343.8766, 275.3204, 85.3839)

RegisterNetEvent("rein:teleport")
AddEventHandler("rein:teleport", function(coords)
    lastCoordss = GetEntityCoords(GetPlayerPed(-1))
    SetEntityCoords(PlayerPedId(), coords)
end)

RegisterNetEvent("raus:teleport")
AddEventHandler("raus:teleport", function()
    SetEntityCoords(PlayerPedId(), lastCoordss)
end)


Citizen.CreateThread(function()
  local printet = false
    while true do
        if status and #(coords - vector3(Config.EinreiseX, Config.EinreiseY, Config.EinreiseZ)) < 200 then
          if not printet then
            printet = true
          end
            for k, v in ipairs(ESX.Game.GetPlayers()) do
                local otherPed = GetPlayerPed(v)
                if otherPed ~= ped then
                    if #(GetEntityCoords(ped, false) - GetEntityCoords(otherPed, false)) < 200 then
                        Player.gamerTags[v] = CreateFakeMpGamerTag(otherPed, ('[%s] %s'):format(GetPlayerServerId(v), GetPlayerName(v)), false, false, '', 0)
                    else
                        RemoveMpGamerTag(Player.gamerTags[v])
                        Player.gamerTags[v] = nil
                    end
                end
            end
        else
            for k, v in pairs(Player.gamerTags) do
                RemoveMpGamerTag(v)
                Player.gamerTags[k] = nil
            end
        end
        Citizen.Wait(1000)
    end
end)

--Einreise Ende

-- Weste nach rejoin Anfang

local playerLoaded = false
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    Wait(2500)
    Vest.V.VestValueLoad = GetResourceKvpInt('esxv_vest')
    if Vest.V.VestValueLoad ~= nil and Vest.V.VestValueLoad <= 100 then
        SetPedArmour(ped, Vest.V.VestValueLoad)
    end
    playerLoaded = true
end)
Vest = {}
Vest.V = {}
Citizen.CreateThread(function()
  Citizen.Trace('Louisiana City Roleplay')
    while true do
        Citizen.Wait(10 * 1000)
        if playerLoaded then
            Vest.V.VestValue = GetPedArmour(ped)
            SetResourceKvpInt('esxv_vest', Vest.V.VestValue)
        end
    end
end)

-- Weste nach rejoin Ende

-- Map Fix command Anfang


RegisterCommand("mapfix", function()
  local interior = GetInteriorAtCoords(GetEntityCoords(PlayerPedId()))
  PinInteriorInMemory(interior)
  RefreshInterior(interior)
  TriggerEvent("ws_notify", "info", "INFORMATION", "Die Map wurde gefixt!", 5000)
end)

-- Map Fix command Ende

-- Unterboden Beleutung Anfang

RegisterCommand("unterboden", function()
  local veh = GetVehiclePedIsIn(PlayerPedId())
  if veh == 0 then return end
  if IsVehicleNeonLightEnabled(veh, 0) then
    SetVehicleNeonLightEnabled(veh, 0, false)
    SetVehicleNeonLightEnabled(veh, 1, false)
    SetVehicleNeonLightEnabled(veh, 2, false)
    SetVehicleNeonLightEnabled(veh, 3, false)
  else
    SetVehicleNeonLightEnabled(veh, 0, true)
    SetVehicleNeonLightEnabled(veh, 1, true)
    SetVehicleNeonLightEnabled(veh, 2, true)
    SetVehicleNeonLightEnabled(veh, 3, true)
  end
end)

RegisterKeyMapping("unterboden", "Unterbodenbeleuchtung", "keyboard", "")

-- Unterboden Beleutung Ende

-- Hinten hinsetzen Anfang

RegisterKeyMapping('enterVehOnBack', 'Hinten einsteigen', 'keyboard', '')

RegisterCommand('enterVehOnBack', function()
    local ped = PlayerPedId()
    if IsAnyVehicleNearPoint(GetEntityCoords(ped), 5.0) and not IsPedSittingInAnyVehicle(ped) then
        local veh = ESX.Game.GetClosestVehicle()
        if IsVehicleSeatFree(veh, 1) then
            TaskEnterVehicle(ped, veh, -1, 1, 1.0, 1, 0)
        elseif IsVehicleSeatFree(veh, 2) then
            TaskEnterVehicle(ped, veh, -1, 2, 1.0, 1, 0)
        end
    end
end, false)

-- Hinten hinsetzen Ende

-- Cayo auf der Karte sichtbar Anfang

local requestedIpl = {"h4_islandairstrip", "h4_islandairstrip_props", "h4_islandx_mansion", "h4_islandx_mansion_props", "h4_islandx_props", "h4_islandxdock", "h4_islandxdock_props", "h4_islandxdock_props_2", "h4_islandxtower", "h4_islandx_maindock", "h4_islandx_maindock_props", "h4_islandx_maindock_props_2", "h4_IslandX_Mansion_Vault", "h4_islandairstrip_propsb", "h4_beach", "h4_beach_props", "h4_beach_bar_props", "h4_islandx_barrack_props", "h4_islandx_checkpoint", "h4_islandx_checkpoint_props", "h4_islandx_Mansion_Office", "h4_islandx_Mansion_LockUp_01", "h4_islandx_Mansion_LockUp_02", "h4_islandx_Mansion_LockUp_03", "h4_islandairstrip_hangar_props", "h4_IslandX_Mansion_B", "h4_islandairstrip_doorsclosed", "h4_Underwater_Gate_Closed", "h4_mansion_gate_closed", "h4_aa_guns", "h4_IslandX_Mansion_GuardFence", "h4_IslandX_Mansion_Entrance_Fence", "h4_IslandX_Mansion_B_Side_Fence", "h4_IslandX_Mansion_Lights", "h4_islandxcanal_props", "h4_beach_props_party", "h4_islandX_Terrain_props_06_a", "h4_islandX_Terrain_props_06_b", "h4_islandX_Terrain_props_06_c", "h4_islandX_Terrain_props_05_a", "h4_islandX_Terrain_props_05_b", "h4_islandX_Terrain_props_05_c", "h4_islandX_Terrain_props_05_d", "h4_islandX_Terrain_props_05_e", "h4_islandX_Terrain_props_05_f", "H4_islandx_terrain_01", "H4_islandx_terrain_02", "H4_islandx_terrain_03", "H4_islandx_terrain_04", "H4_islandx_terrain_05", "H4_islandx_terrain_06", "h4_ne_ipl_00", "h4_ne_ipl_01", "h4_ne_ipl_02", "h4_ne_ipl_03", "h4_ne_ipl_04", "h4_ne_ipl_05", "h4_ne_ipl_06", "h4_ne_ipl_07", "h4_ne_ipl_08", "h4_ne_ipl_09", "h4_nw_ipl_00", "h4_nw_ipl_01", "h4_nw_ipl_02", "h4_nw_ipl_03", "h4_nw_ipl_04", "h4_nw_ipl_05", "h4_nw_ipl_06", "h4_nw_ipl_07", "h4_nw_ipl_08", "h4_nw_ipl_09", "h4_se_ipl_00", "h4_se_ipl_01", "h4_se_ipl_02", "h4_se_ipl_03", "h4_se_ipl_04", "h4_se_ipl_05", "h4_se_ipl_06", "h4_se_ipl_07", "h4_se_ipl_08", "h4_se_ipl_09", "h4_sw_ipl_00", "h4_sw_ipl_01", "h4_sw_ipl_02", "h4_sw_ipl_03", "h4_sw_ipl_04", "h4_sw_ipl_05", "h4_sw_ipl_06", "h4_sw_ipl_07", "h4_sw_ipl_08", "h4_sw_ipl_09", "h4_islandx_mansion", "h4_islandxtower_veg", "h4_islandx_sea_mines", "h4_islandx", "h4_islandx_barrack_hatch", "h4_islandxdock_water_hatch", "h4_beach_party"}

CreateThread(function()
	for i = #requestedIpl, 1, -1 do
		RequestIpl(requestedIpl[i])
		requestedIpl[i] = nil
	end
	requestedIpl = nil
end)

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(3)
      if #(GetEntityCoords(PlayerPedId()) - vector3(4632.0, -5164.0, 20.0)) < 1200.0 or GetPauseMenuState() == 15 then
          SetRadarAsExteriorThisFrame()
          SetRadarAsInteriorThisFrame(GetHashKey("h4_fake_islandx"), 4700.0, -5145.0, 0, 0)
      else
          Wait(1000)
      end
  end
end)

CreateThread(function()
	Wait(2500)
	local islandLoaded = false
	local islandCoords = vector3(4840.571, -5174.425, 2.0)
	SetDeepOceanScaler(0.0)
	while true do
		local pCoords = GetEntityCoords(PlayerPedId())
		if #(pCoords - islandCoords) < 2000.0 then
			if not islandLoaded then
				islandLoaded = true
				Citizen.InvokeNative(0xF74B1FFA4A15FBEA, 1)
			end
		else
			if islandLoaded then
				islandLoaded = false
				Citizen.InvokeNative(0xF74B1FFA4A15FBEA, 0)
			end
		end
		Wait(5000)
	end
end)

-- Cayo auf der Karte sichtbar Ende

--Einreise auto ausleihe spawn Anfang

local carSpawns = {
    vector4(-1019, -2689.62, 13.99 - 1, 207.33 - 1),
    vector4(-1010.17, -2694.46, 13.99- 1, 84.99- 1),
    vector4(-1013.29, -2680.82, 13.99- 1, 207.33- 1),
    vector4(-1004.91, -2685.92, 13.99- 1,  84.99- 1),
    vector4(-999.84, -2677.07, 13.99- 1,  84.99- 1),
    vector4(-1009.03, -2672.9, 13.98- 1, 207.33- 1)
}

local carSpawnCoords = {
  vector4(-1011.09, -2663.01, 13.83, 331.52),
  vector4(-1003.83, -2650.45, 13.83, 329.41),
  vector4(-986.2850, -2667.6973, 13.8307, 329.6736),
  vector4(-981.9410, -2669.8882, 13.8299, 327.2027),
  vector4(-994.2683, -2682.5735, 13.8284, 335.4284),
  vector4(-1001.6469, -2694.7219, 13.8288, 326.0266),
  vector4(-1003.3213, -2705.3062, 13.8306, 318.3265),
}

local cars = {
 "zion", "oracle2", "sentinel", "felon", "cogcabrio", "sentinel2"
}

local curCars = {}

function GetFreeCoordsFromPoint(curArray)
  for index, value in pairs(curArray) do
      if not IsAnyVehicleNearPoint(value[1], value[2], value[3], 1.5) then
          return value
      end
  end
end


function GetFreeCoordsFromPoint2(curIndex)
    if not IsAnyVehicleNearPoint(carSpawns[curIndex], 1.5) then
        return value
    end
end 

function help3d(msg, x,y,z)
  AddTextEntry("3ds", msg)
  SetFloatingHelpTextWorldPosition(1,  x,y,z)
  SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
  BeginTextCommandDisplayHelp("3ds")
  EndTextCommandDisplayHelp(2, false, false, -1)
end

local carFirstSpawn = false

CreateThread(function()
  for key, value in pairs(cars) do
      local model = GetHashKey(value)
      if not IsModelInCdimage(model) then return end
      RequestModel(model)
      while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(10)
      end
      curCars[key] = CreateVehicle(model, GetFreeCoordsFromPoint(carSpawns), false, false)
      SetVehicleNumberPlateText(curCars[key], "Einreise")
      SetEntityAsMissionEntity(curCars[key], true, true)
      SetEntityAsMissionEntity(curCars[key], true, true)
      SetVehicleDoorsLocked(curCars[key], 2)
      SetVehicleCustomPrimaryColour(curCars[key], 0, 110, 255)
      SetVehicleCustomSecondaryColour(curCars[key], 0, 110, 255)
  end
  Wait(10000)
  for key, value in pairs(curCars) do
    FreezeEntityPosition(value, true)
  end
  while true do
      Wait(3 * 60000)
      for key, value in pairs(curCars) do
          DeleteEntity(value)
      end
      for key, value in pairs(cars) do
        if not DoesEntityExist(curCars[key]) then
          local model = GetHashKey(value)
          if not IsModelInCdimage(model) then return end
          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Wait(10)
          end
          curCars[key] = CreateVehicle(model, GetFreeCoordsFromPoint(carSpawns), 0.0, true, true)
          SetVehicleNumberPlateText(curCars[key], "Einreise")
          SetEntityAsMissionEntity(curCars[key], true, true)
          SetVehicleDoorsLocked(curCars[key], 2)
          SetVehicleCustomPrimaryColour(curCars[key], 0, 110, 255)
          SetVehicleCustomSecondaryColour(curCars[key], 0, 110, 255)
          Wait(500)
          FreezeEntityPosition(curCars[key], true)
        end
      end
    end
end)

CreateThread(function()
    while true do
      w = 100
      for key, value in pairs(curCars) do
          local carCoords = GetEntityCoords(value)
          local x,y,z = table.unpack(carCoords)
          local distance = #(coords - carCoords)
          if distance <= 1.8 then
            w = 1
            help3d("Drücke      ~INPUT_CONTEXT~ um das Fahrzeug auszuleihen", x,y,z + 1)
            if IsControlJustReleased(0, 38) then
                  ESX.TriggerServerCallback("einreise:canGetVehicle", function(bool)
                  end, cars[key], GetFreeCoordsFromPoint(carSpawnCoords))
              end
          end
      end
      Wait(w)
    end 

end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for key, value in pairs(curCars) do
            DeleteEntity(value)
        end
    end
end)

--Einreise auto ausleihe spawn Ende

-- einreise e drücke Anfang


CreateThread(function()
    local model = GetHashKey("s_m_m_armoured_02")
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    if not DoesEntityExist(einreiseped) then 
       einreiseped = CreatePed(4, model, -1292.9238, -2641.9626, 27.1347 - 1, 65.9452, false, true)
    end
    FreezeEntityPosition(einreiseped, true)
    TriggerEvent('weapontrigger2')
    SetEntityInvincible(einreiseped, true)
    SetBlockingOfNonTemporaryEvents(einreiseped, true)
    while true do
        w = 100
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        if DoesEntityExist(einreiseped) then
            local dist = #(pos - GetEntityCoords(einreiseped))
            if dist < 2.5 then
                w = 1
                ESX.ShowHelpNotification("Drücke ~INPUT_CONTEXT~ um einen Einreisebeamten zu rufen.")
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent("einreise:call")
                end
            end
        end
        Wait(w)
    end
end)

-- einreise e drücke Ende

-- Geschwindigkeitsbegrenzer Anfang

Citizen.CreateThread(function()
	local multiplier = 3.6 -- kmh (use 2.236936 for mph)
	local speedLimit = 410 / multiplier
	local currentVehicle = 0
	while true do
		local vehicle = GetVehiclePedIsUsing(ped)
		if vehicle == 0 then
			currentVehicle = 0
		elseif currentVehicle ~= vehicle then
			currentVehicle = vehicle
			local maxSpeed = GetVehicleEstimatedMaxSpeed(vehicle)
			if maxSpeed > speedLimit and not IsPedInFlyingVehicle(ped) and not IsPedInAnyBoat(ped) then
				SetEntityMaxSpeed(vehicle, speedLimit)
			end
		end
		Citizen.Wait(1000)
	end
end)

-- Geschwindigkeitsbegrenzer Ende

-- tp to void anfang
local previousCoords = vector3(0, 0, 0)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()

        if DoesEntityExist(playerPed) then
            local playerCoords = GetEntityCoords(playerPed)
            local distance = #(playerCoords - previousCoords)

            if distance > 5 then
                previousCoords = playerCoords    
            end
        end
        Citizen.Wait(5500)
    end
end)


CreateThread(function()
  while true do
      Wait(100)
      if IsPedInAnyVehicle(PlayerPedId(), true) and not IsPedGettingIntoAVehicle(PlayerPedId()) then
          if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() and not IsPedGettingIntoAVehicle(PlayerPedId()) then
          vehicle = GetVehiclePedIsUsing(PlayerPedId())
          owner = NetworkGetEntityOwner(vehicle)
          ownerID = GetPlayerServerId(owner)
          ped = GetPlayerServerId(PlayerId())
          coords = GetEntityCoords(PlayerPedId())
          if GetDistanceBetweenCoords(coords, 10000.0, 10000.0, 500.0, false) < 100.0 then

              if ped ~= ownerID then
                  SetEntityCoords(vehicle, previousCoords, false, false, false, true)
              end

              if ped == ownerID then
              SetEntityCoords(vehicle, previousCoords, false, false, false, true)
              end

          end
          end
      else
          Wait(2000)
      end
  end
end)

-- tp to void ende

-- AntiCheat Allgemeines Anfang

local lastCoords

CreateThread(function()
    while true do
        if vehicle ~= 0 then
            -- anti tp to hangar
            if lastCoords and #(vehcoords - vector3(-1991.32, 3200.94, 32.16)) <= 8.0 then
                SetEntityCoords(vehicle, lastCoords)
            else
                lastCoords = vehcoords
            end
        end
        Wait(500)
    end
end)

-- AntiCheat Allgemeines Ende

-- AI Erkennung Anfang


local w = {"COMPONENT_PISTOL_CLIP_01","COMPONENT_PISTOL_CLIP_02","COMPONENT_AT_PI_FLSH","COMPONENT_COMBATPISTOL_CLIP_01","COMPONENT_COMBATPISTOL_CLIP_02","COMPONENT_AT_PI_SUPP","COMPONENT_APPISTOL_CLIP_01","COMPONENT_APPISTOL_CLIP_02","COMPONENT_PISTOL50_CLIP_01","COMPONENT_PISTOL50_CLIP_02","COMPONENT_AT_AR_SUPP_02","COMPONENT_MICROSMG_CLIP_01","COMPONENT_MICROSMG_CLIP_02","COMPONENT_AT_SCOPE_MACRO","COMPONENT_SMG_CLIP_01","COMPONENT_SMG_CLIP_02","COMPONENT_AT_AR_FLSH","COMPONENT_ASSAULTSMG_CLIP_01","COMPONENT_ASSAULTSMG_CLIP_02","COMPONENT_ASSAULTRIFLE_CLIP_01","COMPONENT_ASSAULTRIFLE_CLIP_02","COMPONENT_CARBINERIFLE_CLIP_01","COMPONENT_CARBINERIFLE_CLIP_02","COMPONENT_AT_SCOPE_MEDIUM","COMPONENT_AT_AR_SUPP","COMPONENT_ADVANCEDRIFLE_CLIP_01","COMPONENT_ADVANCEDRIFLE_CLIP_02","COMPONENT_AT_SCOPE_SMALL","COMPONENT_MG_CLIP_01","COMPONENT_MG_CLIP_02","COMPONENT_COMBATMG_CLIP_01","COMPONENT_COMBATMG_CLIP_02","COMPONENT_PUMPSHOTGUN_CLIP_01","COMPONENT_AT_SR_SUPP","COMPONENT_SAWNOFFSHOTGUN_CLIP_01","COMPONENT_ASSAULTSHOTGUN_CLIP_01","COMPONENT_ASSAULTSHOTGUN_CLIP_02","COMPONENT_BULLPUPSHOTGUN_CLIP_01","COMPONENT_SNIPERRIFLE_CLIP_01","COMPONENT_AT_SCOPE_LARGE","COMPONENT_AT_SCOPE_MAX","COMPONENT_HEAVYSNIPER_CLIP_01","COMPONENT_GRENADELAUNCHER_CLIP_01","COMPONENT_RPG_CLIP_01","COMPONENT_MINIGUN_CLIP_01","POLICE_TORCH_FLASHLIGHT","COMPONENT_SNSPISTOL_CLIP_01","COMPONENT_SNSPISTOL_CLIP_02","COMPONENT_BULLPUPRIFLE_CLIP_01","COMPONENT_BULLPUPRIFLE_CLIP_02","COMPONENT_SPECIALCARBINE_CLIP_01","COMPONENT_SPECIALCARBINE_CLIP_02","COMPONENT_HEAVYPISTOL_CLIP_01","COMPONENT_HEAVYPISTOL_CLIP_02","COMPONENT_AT_MUZZLE_01","COMPONENT_AT_MUZZLE_02","COMPONENT_AT_MUZZLE_03","COMPONENT_AT_MUZZLE_04","COMPONENT_AT_MUZZLE_05","COMPONENT_AT_MUZZLE_06","COMPONENT_AT_MUZZLE_07","COMPONENT_AT_SIGHTS","COMPONENT_AT_SR_SUPP_03","COMPONENT_AT_MUZZLE_08","COMPONENT_AT_PI_FLSH_03","COMPONENT_AT_PI_RAIL_02","COMPONENT_AT_PI_COMP_02","COMPONENT_DOUBLEACTION_CLIP_01","COMPONENT_HOMINGLAUNCHER_CLIP_01","COMPONENT_AT_PI_COMP_03","COMPONENT_GUSENBERG_CLIP_01","COMPONENT_GUSENBERG_CLIP_02","COMPONENT_VINTAGEPISTOL_CLIP_01","COMPONENT_VINTAGEPISTOL_CLIP_02","COMPONENT_MUSKET_CLIP_01","COMPONENT_FIREWORK_CLIP_01","COMPONENT_RAILGUN_CLIP_01","COMPONENT_MARKSMANRIFLE_CLIP_01","COMPONENT_MARKSMANRIFLE_CLIP_02","COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM","COMPONENT_HEAVYSHOTGUN_CLIP_01","COMPONENT_HEAVYSHOTGUN_CLIP_02","COMPONENT_FLAREGUN_CLIP_01","COMPONENT_MARKSMANPISTOL_CLIP_01","COMPONENT_COMBATPDW_CLIP_01","COMPONENT_COMBATPDW_CLIP_02","COMPONENT_DBSHOTGUN_CLIP_01","COMPONENT_MACHINEPISTOL_CLIP_01","COMPONENT_MACHINEPISTOL_CLIP_02","COMPONENT_COMPACTRIFLE_CLIP_01","COMPONENT_COMPACTRIFLE_CLIP_02","COMPONENT_FLASHLIGHT_LIGHT","COMPONENT_REVOLVER_CLIP_01","COMPONENT_MINISMG_CLIP_01","COMPONENT_MINISMG_CLIP_02","COMPONENT_COMPACTLAUNCHER_CLIP_01","COMPONENT_AUTOSHOTGUN_CLIP_01","COMPONENT_AT_PI_RAIL","COMPONENT_AT_PI_FLSH_02","COMPONENT_AT_PI_COMP","COMPONENT_AT_SIGHTS_SMG","COMPONENT_AT_SCOPE_NV","COMPONENT_AT_SCOPE_THERMAL","COMPONENT_AT_MUZZLE_09"}

Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(1000)
    end
    local data = json.decode('{"COMPONENT_VINTAGEPISTOL_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":7,"rdm":0,"ca":7},"COMPONENT_AT_MRFL_BARREL_01":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_AT_MUZZLE_09":{"rm":0,"rh":1061158912,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_AT_SCOPE_NV":{"rm":0,"rh":-1013321135,"ac":0,"dm":0,"cs":64309,"rdm":0,"ca":-1941898443},"COMPONENT_MARKSMANRIFLE_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":16,"rdm":0,"ca":16},"COMPONENT_AT_SB_BARREL_02":{"rm":1.25,"rh":662,"ac":0,"dm":0,"cs":0,"rdm":1.33333301544189,"ca":0},"COMPONENT_HEAVYSHOTGUN_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":12,"rdm":0,"ca":12},"COMPONENT_PISTOL_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":16,"rdm":0,"ca":16},"COMPONENT_AT_SC_BARREL_01":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_SNIPERRIFLE_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":10,"rdm":0,"ca":10},"COMPONENT_RAILGUN_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":1,"rdm":0,"ca":1},"COMPONENT_MARKSMANRIFLE_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":8,"rdm":0,"ca":8},"COMPONENT_AT_AR_BARREL_02":{"rm":1.25,"rh":0,"ac":0,"dm":0,"cs":1,"rdm":1.33333301544189,"ca":131073},"COMPONENT_FIREWORK_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":1,"rdm":0,"ca":1},"COMPONENT_MILITARYRIFLE_SIGHT_01":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM":{"rm":0,"rh":-1013321135,"ac":0,"dm":0,"cs":35486,"rdm":0,"ca":-705656162},"COMPONENT_AT_SIGHTS":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_COMPACTLAUNCHER_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":1,"rdm":0,"ca":1},"COMPONENT_AT_SB_BARREL_01":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_ADVANCEDRIFLE_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":60,"rdm":0,"ca":60},"COMPONENT_GUSENBERG_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":50,"rdm":0,"ca":50},"COMPONENT_GADGETPISTOL_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":1,"rdm":0,"ca":1},"COMPONENT_AT_MUZZLE_05":{"rm":0,"rh":1059481190,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_COMBATSHOTGUN_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":6,"rdm":0,"ca":6},"COMPONENT_ASSAULTRIFLE_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":60,"rdm":0,"ca":60},"COMPONENT_AT_SCOPE_MACRO":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"POLICE_TORCH_FLASHLIGHT":{"rm":0,"rh":1107296256,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":1086324736},"COMPONENT_COMPACTRIFLE_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_PISTOL50_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":9,"rdm":0,"ca":9},"COMPONENT_AT_SR_BARREL_02":{"rm":1.25,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":1.33333301544189,"ca":0},"COMPONENT_AT_PI_RAIL_02":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_GUSENBERG_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_ASSAULTSHOTGUN_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":32,"rdm":0,"ca":32},"COMPONENT_SMG_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":60,"rdm":0,"ca":60},"COMPONENT_AT_PI_RAIL":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_AT_SCOPE_MAX":{"rm":0,"rh":-740620376,"ac":0,"dm":0,"cs":54088,"rdm":0,"ca":-333262008},"COMPONENT_AT_BP_BARREL_01":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_BULLPUPRIFLE_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_AT_SCOPE_THERMAL":{"rm":0,"rh":-1013321135,"ac":0,"dm":0,"cs":64309,"rdm":0,"ca":-1941898443},"COMPONENT_AT_AR_FLSH":{"rm":0,"rh":1107296256,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":1086324736},"COMPONENT_ASSAULTRIFLE_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_AT_CR_BARREL_02":{"rm":1.25,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":1.33333301544189,"ca":0},"COMPONENT_AT_SCOPE_SMALL":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_COMPACTRIFLE_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":60,"rdm":0,"ca":60},"COMPONENT_HEAVYSHOTGUN_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":6,"rdm":0,"ca":6},"COMPONENT_AT_MG_BARREL_02":{"rm":1.25,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":1.33333301544189,"ca":0},"COMPONENT_DBSHOTGUN_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":2,"rdm":0,"ca":2},"COMPONENT_MICROSMG_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":16,"rdm":0,"ca":16},"COMPONENT_HEAVYPISTOL_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":18,"rdm":0,"ca":18},"COMPONENT_AT_MUZZLE_03":{"rm":0,"rh":1059481190,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_ASSAULTSMG_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":60,"rdm":0,"ca":60},"COMPONENT_SAWNOFFSHOTGUN_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":8,"rdm":0,"ca":8},"COMPONENT_AT_MUZZLE_08":{"rm":0,"rh":1061158912,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_CERAMICPISTOL_SUPP":{"rm":0,"rh":1065353216,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_AT_MUZZLE_04":{"rm":0,"rh":1059481190,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_MILITARYRIFLE_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_AT_PI_FLSH":{"rm":0,"rh":1107296256,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":1086324736},"COMPONENT_AT_PI_COMP_02":{"rm":0,"rh":1056964608,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_HEAVYPISTOL_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":36,"rdm":0,"ca":36},"COMPONENT_CERAMICPISTOL_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":12,"rdm":0,"ca":12},"COMPONENT_AT_AR_SUPP":{"rm":0,"rh":1065353216,"ac":0,"dm":1,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_CARBINERIFLE_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":60,"rdm":0,"ca":60},"COMPONENT_CERAMICPISTOL_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":17,"rdm":0,"ca":17},"COMPONENT_COMBATPISTOL_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":16,"rdm":0,"ca":16},"COMPONENT_GRENADELAUNCHER_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":10,"rdm":0,"ca":10},"COMPONENT_AT_SC_BARREL_02":{"rm":1.25,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":1.33333301544189,"ca":0},"COMPONENT_HEAVYSNIPER_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":6,"rdm":0,"ca":6},"COMPONENT_COMBATMG_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":100,"rdm":0,"ca":100},"COMPONENT_AT_SCOPE_LARGE":{"rm":0,"rh":-1013321135,"ac":0,"dm":0,"cs":64309,"rdm":0,"ca":-1941898443},"COMPONENT_APPISTOL_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":36,"rdm":0,"ca":36},"COMPONENT_AT_SCOPE_MEDIUM":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_ASSAULTSMG_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_AT_SR_SUPP_03":{"rm":0,"rh":1065353216,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_MG_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":54,"rdm":0,"ca":54},"COMPONENT_MACHINEPISTOL_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":20,"rdm":0,"ca":20},"COMPONENT_CARBINERIFLE_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_AUTOSHOTGUN_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":10,"rdm":0,"ca":10},"COMPONENT_AT_PI_FLSH_03":{"rm":0,"rh":1107296256,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":1086324736},"COMPONENT_NAVYREVOLVER_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":6,"rdm":0,"ca":6},"COMPONENT_AT_SIGHTS_SMG":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_VINTAGEPISTOL_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":14,"rdm":0,"ca":14},"COMPONENT_BULLPUPRIFLE_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":60,"rdm":0,"ca":60},"COMPONENT_AT_AR_BARREL_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_RPG_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":1,"rdm":0,"ca":1},"COMPONENT_AT_PI_SUPP":{"rm":0,"rh":1065353216,"ac":0,"dm":1,"cs":19851,"rdm":0,"ca":7556491},"COMPONENT_MUSKET_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":1,"rdm":0,"ca":1},"COMPONENT_MG_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":100,"rdm":0,"ca":100},"COMPONENT_SMG_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_SNSPISTOL_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":12,"rdm":0,"ca":12},"COMPONENT_MARKSMANPISTOL_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":1,"rdm":0,"ca":1},"COMPONENT_AT_MUZZLE_01":{"rm":0,"rh":1059481190,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_AT_CR_BARREL_01":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_AT_AR_SUPP_02":{"rm":0,"rh":1065353216,"ac":0,"dm":1,"cs":19851,"rdm":0,"ca":7556491},"COMPONENT_ASSAULTSHOTGUN_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":8,"rdm":0,"ca":8},"COMPONENT_SNSPISTOL_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":6,"rdm":0,"ca":6},"COMPONENT_AT_MG_BARREL_01":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":0},"COMPONENT_MINISMG_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":20,"rdm":0,"ca":20},"COMPONENT_AT_PI_COMP":{"rm":0,"rh":1056964608,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_PISTOL_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":12,"rdm":0,"ca":12},"COMPONENT_PUMPSHOTGUN_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":8,"rdm":0,"ca":8},"COMPONENT_PISTOL50_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":12,"rdm":0,"ca":12},"COMPONENT_DOUBLEACTION_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":6,"rdm":0,"ca":6},"COMPONENT_APPISTOL_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":18,"rdm":0,"ca":18},"COMPONENT_HOMINGLAUNCHER_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":1,"rdm":0,"ca":1},"COMPONENT_MINIGUN_CLIP_01":{"rm":0,"rh":0,"ac":0,"dm":0,"cs":15000,"rdm":0,"ca":15000},"COMPONENT_AT_BP_BARREL_02":{"rm":1.25,"rh":0,"ac":0,"dm":0,"cs":0,"rdm":1.33333301544189,"ca":0},"COMPONENT_FLASHLIGHT_LIGHT":{"rm":0,"rh":1107296256,"ac":0,"dm":0,"cs":26214,"rdm":0,"ca":1088841318},"COMPONENT_SPECIALCARBINE_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_AT_SR_SUPP":{"rm":0,"rh":1065353216,"ac":0,"dm":1,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_BULLPUPSHOTGUN_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":14,"rdm":0,"ca":14},"COMPONENT_MACHINEPISTOL_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":12,"rdm":0,"ca":12},"COMPONENT_AT_MUZZLE_02":{"rm":0,"rh":1059481190,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_COMBATPDW_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_COMBATPDW_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":60,"rdm":0,"ca":60},"COMPONENT_FLAREGUN_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":1,"rdm":0,"ca":1},"COMPONENT_AT_MUZZLE_07":{"rm":0,"rh":1059481190,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_SPECIALCARBINE_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":60,"rdm":0,"ca":60},"COMPONENT_COMBATPISTOL_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":12,"rdm":0,"ca":12},"COMPONENT_AT_PI_COMP_03":{"rm":0,"rh":1056964608,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851},"COMPONENT_MINISMG_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_MILITARYRIFLE_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":45,"rdm":0,"ca":45},"COMPONENT_MICROSMG_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_REVOLVER_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":6,"rdm":0,"ca":6},"COMPONENT_AT_PI_FLSH_02":{"rm":0,"rh":1107296256,"ac":0,"dm":0,"cs":0,"rdm":0,"ca":1086324736},"COMPONENT_ADVANCEDRIFLE_CLIP_01":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":30,"rdm":0,"ca":30},"COMPONENT_COMBATMG_CLIP_02":{"rm":0,"rh":662,"ac":0,"dm":0,"cs":200,"rdm":0,"ca":200},"COMPONENT_AT_MUZZLE_06":{"rm":0,"rh":1059481190,"ac":0,"dm":0,"cs":19851,"rdm":0,"ca":19851}}')
    local detected = {}
    for i=1, #w do
        local g = w[i]
        local ac = GetWeaponComponentAccuracyModifier(GetHashKey(g))
        local cs = GetWeaponComponentClipSize(GetHashKey(g))
        local dm = GetWeaponComponentDamageModifier(GetHashKey(g))
        if ac ~= data[g].ac or cs ~= data[g].cs or dm ~= data[g].dm then
            table.insert(detected, g)
        end
    end
    if #detected > 0 then
        TriggerServerEvent('mxs:customban','Es wurde bei diesem Spieler AI erkannt', detected)
    end
end)

RegisterNetEvent('esx:playerLoaded', function()
  local ped = PlayerPedId()
  local selectedWeapon = GetSelectedPedWeapon(ped)
  if (selectedWeapon == -1569615261) or (selectedWeapon == 0)  then
  else
    TriggerServerEvent('mxs:customban','Loadout AI erkannt '..selectedWeapon)
  end
end)

-- AI Erkennung Ende

-- FPS Command Anfang

local fps = false

RegisterCommand("fps", function()
    fps = not fps
    if fps then
        SetTimecycleModifier("cinema")
        SetForceVehicleTrails(false)
        SetForcePedFootstepsTracks(false)
        TriggerEvent("ws_notify", "info", "INFORMATION", "FPS Boost [An]", 5000)
    else
        SetTimecycleModifier("default")
        TriggerEvent("ws_notify", "info", "INFORMATION", "FPS Boost [Aus]", 5000)
    end
end)


-- FPS Command Ende

-- Clear Map Anfang 

Citizen.CreateThread(function() --Clear Map
  while true do
      ClearAllBrokenGlass()
      ClearAllHelpMessages()
      LeaderboardsReadClearAll()
      ClearBrief()
      ClearGpsFlags()
      ClearPrints()
      ClearSmallPrints()
      ClearReplayStats()
      LeaderboardsClearCacheData()
      ClearFocus()
      ClearHdArea()
      Citizen.Wait(300000)
  end
end)

-- Clear Map Ende

-- Police Weapon Deleter Anfang

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(1)
      id = PlayerId()
      DisablePlayerVehicleRewards(id)
  end
end)

-- Police Weapon Deleter Ende


-- Anker Anfang

local hasMsgShown = false
CreateThread(function()
  while true do
    Wait(1)
    if vehicle ~= 0 then
      if GetVehicleClass(vehicle) == 14 then
        if CanAnchorBoatHere(vehicle) and not hasMsgShown then
          local isAnchored = IsBoatAnchoredAndFrozen(vehicle)
          TriggerEvent("ws_notify", "info", "INFORMATION", "Drücke deine festgelegte Taste, um den Anker zu " .. (isAnchored and "setzen" or "lösen"), 5000)
          hasMsgShown = true
        end
      else
        hasMsgShown = false
        Wait(1000)
      end
    else
      Wait(1000)
      hasMsgShown = false
    end
  end
end)

RegisterCommand("anker", function()
  if vehicle ~= 0 then
    if GetVehicleClass(vehicle) == 14 then
      if CanAnchorBoatHere(vehicle) then
        local isAnchored = IsBoatAnchoredAndFrozen(vehicle)
        if not (GetEntitySpeed(vehicle) * 3.6 <= 5.0) then
          TriggerEvent("ws_notify", "info", "INFORMATION", "Um den Anker zu " .. (isAnchored and "setzen" or "lösen") .. ", musst du langsamer fahren", 5000)
          return
        end
        SetBoatFrozenWhenAnchored(vehicle, not isAnchored)
        SetBoatAnchor(vehicle, not isAnchored)
        TriggerEvent("ws_notify", "info", "INFORMATION", "Anker wurde " .. (isAnchored and "gelöst" or "gesetzt"), 5000)
      end
    end
  end
end)

RegisterKeyMapping("anker", "Setze den Anker eines Bootes", "keyboard", "")

-- Anker Ende

-- Discord Rich Presence Anfang

Citizen.CreateThread(function()
	Wait(10000)
    while true do
        --Buttons
	      SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/louisianacity")
	      SetDiscordRichPresenceAction(1, "FiveM", "fivem://connect/45.157.235.70:30120")
        SetDiscordAppId(1078979095192408094)                 --Discord App-ID
        SetDiscordRichPresenceAsset('logo')             --Logo Name
        SetDiscordRichPresenceAssetText('Louisiana City Roleplay')         --Logo Tooltip
        SetDiscordRichPresenceAssetSmall('logo')     --Icon Name
        SetDiscordRichPresenceAssetSmallText('Louisiana City Roleplay') --Icon Tooltip
		    ESX.TriggerServerCallback('loui:getPlayers', function(count)
            Citizen.Wait(100)
            SetRichPresence("ID: "..GetPlayerServerId(PlayerId()).. " | Spieler: " .. count .. "")
        end)
        Citizen.Wait(60000) --Spieler Anzahl Update Interval
    end
end)

-- Discord Rich Presence Ende

-- /shuff Command

local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if vehicle ~= 0 and disableShuffle then
			if GetPedInVehicleSeat(vehicle, 0) == ped then
				if GetIsTaskActive(ped, 165) then
					SetPedIntoVehicle(ped, vehicle, 0)
				end
			end
		else
			Wait(1000)
		end
	end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
	if vehicle ~= 0 then
		disableSeatShuffle(false)
		Citizen.Wait(5000)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end)

RegisterCommand("shuff", function(source, args, raw)
    TriggerEvent("SeatShuffle")
end, false)

SetRandomEventFlag(false)

-- Schaltet alle Fahrzeuge aus 
local scenarios = {
  'WORLD_VEHICLE_ATTRACTOR',
  'WORLD_VEHICLE_AMBULANCE',
  'WORLD_VEHICLE_BICYCLE_BMX',
  'WORLD_VEHICLE_BICYCLE_BMX_BALLAS',
  'WORLD_VEHICLE_BICYCLE_BMX_FAMILY',
  'WORLD_VEHICLE_BICYCLE_BMX_HARMONY',
  'WORLD_VEHICLE_BICYCLE_BMX_VAGOS',
  'WORLD_VEHICLE_BICYCLE_MOUNTAIN',
  'WORLD_VEHICLE_BICYCLE_ROAD',
  'WORLD_VEHICLE_BIKE_OFF_ROAD_RACE',
  'WORLD_VEHICLE_BIKER',
  'WORLD_VEHICLE_BOAT_IDLE',
  'WORLD_VEHICLE_BOAT_IDLE_ALAMO',
  'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
  'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
  'WORLD_VEHICLE_BROKEN_DOWN',
  'WORLD_VEHICLE_BUSINESSMEN',
  'WORLD_VEHICLE_HELI_ESXGUARD',
  'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER',
  'WORLD_VEHICLE_CONSTRUCTION_SOLO',
  'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS',
  'WORLD_VEHICLE_DRIVE_PASSENGERS',
  'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED',
  'WORLD_VEHICLE_DRIVE_SOLO',
  'WORLD_VEHICLE_FIRE_TRUCK',
  'WORLD_VEHICLE_EMPTY',
  'WORLD_VEHICLE_MARIACHI',
  'WORLD_VEHICLE_MECHANIC',
  'WORLD_VEHICLE_MILITARY_PLANES_BIG',
  'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
  'WORLD_VEHICLE_PARK_PARALLEL',
  'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN',
  'WORLD_VEHICLE_PASSENGER_EXIT',
  'WORLD_VEHICLE_POLICE_BIKE',
  'WORLD_VEHICLE_POLICE_CAR',
  'WORLD_VEHICLE_POLICE',
  'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
  'WORLD_VEHICLE_QUARRY',
  'WORLD_VEHICLE_SALTON',
  'WORLD_VEHICLE_SALTON_DIRT_BIKE',
  'WORLD_VEHICLE_SECURITY_CAR',
  'WORLD_VEHICLE_STREETRACE',
  'WORLD_VEHICLE_TOURBUS',
  'WORLD_VEHICLE_TOURIST',
  'WORLD_VEHICLE_TANDL',
  'WORLD_VEHICLE_TRACTOR',
  'WORLD_VEHICLE_TRACTOR_BEACH',
  'WORLD_VEHICLE_TRUCK_LOGS',
  'WORLD_VEHICLE_TRUCKS_TRAILERS',
  'WORLD_VEHICLE_DISTANT_EMPTY_GROUND'
}

for i, v in ipairs(scenarios) do
  SetScenarioTypeEnabled(v, false)
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    -- Schaltet die Umgebungsgeräusche aus 
    StartAudioScene('CHARACTER_CHANGE_IN_SKY_SCENE')

    -- Schaltet den Verkehr und die Menschen aus
    NoTraffic()
    PedDensity()

    -- Schaltet das Wanted Level aus
    if GetPlayerWantedLevel(PlayerId()) > 0 then
      SetPlayerWantedLevel(PlayerId(), 0, false)
      SetPlayerWantedLevelNow(PlayerId(), false)
    end

    -- Schaltet die Polizei, Krankenwägen aus
    for i = 1, 15 do
      EnableDispatchService(i, false)
    end

  end
end)

function NoTraffic()
  SetParkedVehicleDensityMultiplierThisFrame(0.0)
  SetVehicleDensityMultiplierThisFrame(0.0)
  SetRandomVehicleDensityMultiplierThisFrame(0.0)
end

function PedDensity()
  SetPedDensityMultiplierThisFrame(0.0)
  SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
end

-- X Abuse Magazin

Citizen.CreateThread( function()
	while true do
	   Citizen.Wait(0)
	   if IsPedArmed(ped, 4) then
		  DisableControlAction(0, 73, false)
	   else
		Wait(1000)
	   end
	 end
end)


---- Mottorad kein schaden Anfang

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if vehicle ~= 0 then
            DisableControlAction(0, 346, true)
            DisableControlAction(0, 347, true)
        else 
            Citizen.Wait(500)
        end
    end
end)

---- Mottorad kein schaden Ende

-- sirenen fix

Citizen.CreateThread(function()
  StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
end)

-- sirenen fix ende


-- ELS FiveM Anfang
local count_bcast_timer = 0
local delay_bcast_timer = 200

local count_sndclean_timer = 0
local delay_sndclean_timer = 400

local actv_ind_timer = false
local count_ind_timer = 0
local delay_ind_timer = 180

local actv_lxsrnmute_temp = false
local srntone_temp = 0
local dsrn_mute = true

local state_indic = {}
local state_lxsiren = {}
local state_pwrcall = {}
local state_airmanu = {}

local ind_state_o = 0
local ind_state_l = 1
local ind_state_r = 2
local ind_state_h = 3

local snd_lxsiren = {}
local snd_pwrcall = {}
local snd_airmanu = {}

-- these models will use their real wail siren, as determined by their assigned audio hash in vehicles.meta
local eModelsWithFireSrn =
{
	"FIRETRUK",
}

-- models listed below will use AMBULANCE_WARNING as auxiliary siren
-- unlisted models will instead use the default wail as the auxiliary siren
local eModelsWithPcall =
{	
	"AMBULANCE",
	"FIRETRUK",
	"LGUARD",
}


---------------------------------------------------------------------
function ShowDebug(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

---------------------------------------------------------------------
function useFiretruckSiren(veh)
	local model = GetEntityModel(veh)
	for i = 1, #eModelsWithFireSrn, 1 do
		if model == GetHashKey(eModelsWithFireSrn[i]) then
			return true
		end
	end
	return false
end

---------------------------------------------------------------------
function usePowercallAuxSrn(veh)
	local model = GetEntityModel(veh)
	for i = 1, #eModelsWithPcall, 1 do
		if model == GetHashKey(eModelsWithPcall[i]) then
			return true
		end
	end
	return false
end

---------------------------------------------------------------------
function CleanupSounds()
	if count_sndclean_timer > delay_sndclean_timer then
		count_sndclean_timer = 0
		for k, v in pairs(state_lxsiren) do
			if v > 0 then
				if not DoesEntityExist(k) or IsEntityDead(k) then
					if snd_lxsiren[k] ~= nil then
						StopSound(snd_lxsiren[k])
						ReleaseSoundId(snd_lxsiren[k])
						snd_lxsiren[k] = nil
						state_lxsiren[k] = nil
					end
				end
			end
		end
		for k, v in pairs(state_pwrcall) do
			if v == true then
				if not DoesEntityExist(k) or IsEntityDead(k) then
					if snd_pwrcall[k] ~= nil then
						StopSound(snd_pwrcall[k])
						ReleaseSoundId(snd_pwrcall[k])
						snd_pwrcall[k] = nil
						state_pwrcall[k] = nil
					end
				end
			end
		end
		for k, v in pairs(state_airmanu) do
			if v == true then
				if not DoesEntityExist(k) or IsEntityDead(k) or IsVehicleSeatFree(k, -1) then
					if snd_airmanu[k] ~= nil then
						StopSound(snd_airmanu[k])
						ReleaseSoundId(snd_airmanu[k])
						snd_airmanu[k] = nil
						state_airmanu[k] = nil
					end
				end
			end
		end
	else
		count_sndclean_timer = count_sndclean_timer + 1
	end
end

---------------------------------------------------------------------
function TogIndicStateForVeh(veh, newstate)
	if DoesEntityExist(veh) and not IsEntityDead(veh) then
		if newstate == ind_state_o then
			SetVehicleIndicatorLights(veh, 0, false) -- R
			SetVehicleIndicatorLights(veh, 1, false) -- L
		elseif newstate == ind_state_l then
			SetVehicleIndicatorLights(veh, 0, false) -- R
			SetVehicleIndicatorLights(veh, 1, true) -- L
		elseif newstate == ind_state_r then
			SetVehicleIndicatorLights(veh, 0, true) -- R
			SetVehicleIndicatorLights(veh, 1, false) -- L
		elseif newstate == ind_state_h then
			SetVehicleIndicatorLights(veh, 0, true) -- R
			SetVehicleIndicatorLights(veh, 1, true) -- L
		end
		state_indic[veh] = newstate
	end
end

---------------------------------------------------------------------
function TogMuteDfltSrnForVeh(veh, toggle)
	if DoesEntityExist(veh) and not IsEntityDead(veh) then
		DisableVehicleImpactExplosionActivation(veh, toggle)
	end
end

---------------------------------------------------------------------
function SetLxSirenStateForVeh(veh, newstate)
	if DoesEntityExist(veh) and not IsEntityDead(veh) then
		if newstate ~= state_lxsiren[veh] then
				
			if snd_lxsiren[veh] ~= nil then
				StopSound(snd_lxsiren[veh])
				ReleaseSoundId(snd_lxsiren[veh])
				snd_lxsiren[veh] = nil
			end
						
			if newstate == 1 then
				if useFiretruckSiren(veh) then
					TogMuteDfltSrnForVeh(veh, false)
				else
					snd_lxsiren[veh] = GetSoundId()	
					PlaySoundFromEntity(snd_lxsiren[veh], "VEHICLES_HORNS_SIREN_1", veh, 0, 0, 0)
					TogMuteDfltSrnForVeh(veh, true)
				end
				
			elseif newstate == 2 then
				snd_lxsiren[veh] = GetSoundId()
				PlaySoundFromEntity(snd_lxsiren[veh], "VEHICLES_HORNS_SIREN_2", veh, 0, 0, 0)
				TogMuteDfltSrnForVeh(veh, true)
			
			elseif newstate == 3 then
				snd_lxsiren[veh] = GetSoundId()
				if useFiretruckSiren(veh) then
					PlaySoundFromEntity(snd_lxsiren[veh], "VEHICLES_HORNS_AMBULANCE_WARNING", veh, 0, 0, 0)
				else
					PlaySoundFromEntity(snd_lxsiren[veh], "VEHICLES_HORNS_POLICE_WARNING", veh, 0, 0, 0)
				end
				TogMuteDfltSrnForVeh(veh, true)
				
			else
				TogMuteDfltSrnForVeh(veh, true)
				
			end				
				
			state_lxsiren[veh] = newstate
		end
	end
end

---------------------------------------------------------------------
function TogPowercallStateForVeh(veh, toggle)
	if DoesEntityExist(veh) and not IsEntityDead(veh) then
		if toggle == true then
			if snd_pwrcall[veh] == nil then
				snd_pwrcall[veh] = GetSoundId()
				if usePowercallAuxSrn(veh) then
					PlaySoundFromEntity(snd_pwrcall[veh], "VEHICLES_HORNS_AMBULANCE_WARNING", veh, 0, 0, 0)
				else
					PlaySoundFromEntity(snd_pwrcall[veh], "VEHICLES_HORNS_SIREN_1", veh, 0, 0, 0)
				end
			end
		else
			if snd_pwrcall[veh] ~= nil then
				StopSound(snd_pwrcall[veh])
				ReleaseSoundId(snd_pwrcall[veh])
				snd_pwrcall[veh] = nil
			end
		end
		state_pwrcall[veh] = toggle
	end
end

---------------------------------------------------------------------
function SetAirManuStateForVeh(veh, newstate)
	if DoesEntityExist(veh) and not IsEntityDead(veh) then
		if newstate ~= state_airmanu[veh] then
				
			if snd_airmanu[veh] ~= nil then
				StopSound(snd_airmanu[veh])
				ReleaseSoundId(snd_airmanu[veh])
				snd_airmanu[veh] = nil
			end
						
			if newstate == 1 then
				snd_airmanu[veh] = GetSoundId()
				if useFiretruckSiren(veh) then
					PlaySoundFromEntity(snd_airmanu[veh], "VEHICLES_HORNS_FIRETRUCK_WARNING", veh, 0, 0, 0)
				else
					PlaySoundFromEntity(snd_airmanu[veh], "SIRENS_AIRHORN", veh, 0, 0, 0)
				end
				
			elseif newstate == 2 then
				snd_airmanu[veh] = GetSoundId()
				PlaySoundFromEntity(snd_airmanu[veh], "VEHICLES_HORNS_SIREN_1", veh, 0, 0, 0)
			
			elseif newstate == 3 then
				snd_airmanu[veh] = GetSoundId()
				PlaySoundFromEntity(snd_airmanu[veh], "VEHICLES_HORNS_SIREN_2", veh, 0, 0, 0)
				
			end				
				
			state_airmanu[veh] = newstate
		end
	end
end


---------------------------------------------------------------------
RegisterNetEvent("lvc_TogIndicState_c")
AddEventHandler("lvc_TogIndicState_c", function(sender, newstate)
	local player_s = GetPlayerFromServerId(sender)
	local ped_s = GetPlayerPed(player_s)
	if DoesEntityExist(ped_s) and not IsEntityDead(ped_s) then
		if ped_s ~= GetPlayerPed(-1) then
			if IsPedInAnyVehicle(ped_s, false) then
				local veh = GetVehiclePedIsUsing(ped_s)
				TogIndicStateForVeh(veh, newstate)
			end
		end
	end
end)

---------------------------------------------------------------------
RegisterNetEvent("lvc_TogDfltSrnMuted_c")
AddEventHandler("lvc_TogDfltSrnMuted_c", function(sender, toggle)
	local player_s = GetPlayerFromServerId(sender)
	local ped_s = GetPlayerPed(player_s)
	if DoesEntityExist(ped_s) and not IsEntityDead(ped_s) then
		if ped_s ~= GetPlayerPed(-1) then
			if IsPedInAnyVehicle(ped_s, false) then
				local veh = GetVehiclePedIsUsing(ped_s)
				TogMuteDfltSrnForVeh(veh, toggle)
			end
		end
	end
end)

---------------------------------------------------------------------
RegisterNetEvent("lvc_SetLxSirenState_c")
AddEventHandler("lvc_SetLxSirenState_c", function(sender, newstate)
	local player_s = GetPlayerFromServerId(sender)
	local ped_s = GetPlayerPed(player_s)
	if DoesEntityExist(ped_s) and not IsEntityDead(ped_s) then
		if ped_s ~= GetPlayerPed(-1) then
			if IsPedInAnyVehicle(ped_s, false) then
				local veh = GetVehiclePedIsUsing(ped_s)
				SetLxSirenStateForVeh(veh, newstate)
			end
		end
	end
end)

---------------------------------------------------------------------
RegisterNetEvent("lvc_TogPwrcallState_c")
AddEventHandler("lvc_TogPwrcallState_c", function(sender, toggle)
	local player_s = GetPlayerFromServerId(sender)
	local ped_s = GetPlayerPed(player_s)
	if DoesEntityExist(ped_s) and not IsEntityDead(ped_s) then
		if ped_s ~= GetPlayerPed(-1) then
			if IsPedInAnyVehicle(ped_s, false) then
				local veh = GetVehiclePedIsUsing(ped_s)
				TogPowercallStateForVeh(veh, toggle)
			end
		end
	end
end)

---------------------------------------------------------------------
RegisterNetEvent("lvc_SetAirManuState_c")
AddEventHandler("lvc_SetAirManuState_c", function(sender, newstate)
	local player_s = GetPlayerFromServerId(sender)
	local ped_s = GetPlayerPed(player_s)
	if DoesEntityExist(ped_s) and not IsEntityDead(ped_s) then
		if ped_s ~= GetPlayerPed(-1) then
			if IsPedInAnyVehicle(ped_s, false) then
				local veh = GetVehiclePedIsUsing(ped_s)
				SetAirManuStateForVeh(veh, newstate)
			end
		end
	end
end)



---------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
			
			CleanupSounds()
			
			----- IS IN VEHICLE -----
			local playerped = GetPlayerPed(-1)		
			if IsPedInAnyVehicle(playerped, false) then	
			
				----- IS DRIVER -----
				local veh = GetVehiclePedIsUsing(playerped)	
				if GetPedInVehicleSeat(veh, -1) == playerped then
				
					DisableControlAction(0, 84, true) -- INPUT_VEH_PREV_RADIO_TRACK  
					DisableControlAction(0, 83, true) -- INPUT_VEH_NEXT_RADIO_TRACK 
					
					if state_indic[veh] ~= ind_state_o and state_indic[veh] ~= ind_state_l and state_indic[veh] ~= ind_state_r and state_indic[veh] ~= ind_state_h then
						state_indic[veh] = ind_state_o
					end
					
					-- INDIC AUTO CONTROL
					if actv_ind_timer == true then	
						if state_indic[veh] == ind_state_l or state_indic[veh] == ind_state_r then
							if GetEntitySpeed(veh) < 6 then
								count_ind_timer = 0
							else
								if count_ind_timer > delay_ind_timer then
									count_ind_timer = 0
									actv_ind_timer = false
									state_indic[veh] = ind_state_o
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									TogIndicStateForVeh(veh, state_indic[veh])
									count_bcast_timer = delay_bcast_timer
								else
									count_ind_timer = count_ind_timer + 1
								end
							end
						end
					end
					
					
					--- IS EMERG VEHICLE ---
					if GetVehicleClass(veh) == 18 then
						
						local actv_manu = false
						local actv_horn = false
						
						DisableControlAction(0, 86, true) -- INPUT_VEH_HORN	
						DisableControlAction(0, 172, true) -- INPUT_CELLPHONE_UP 
						--DisableControlAction(0, 173, true) -- INPUT_CELLPHONE_DOWN
						--DisableControlAction(0, 174, true) -- INPUT_CELLPHONE_LEFT 
						--DisableControlAction(0, 175, true) -- INPUT_CELLPHONE_RIGHT 
						DisableControlAction(0, 81, true) -- INPUT_VEH_NEXT_RADIO
						DisableControlAction(0, 82, true) -- INPUT_VEH_PREV_RADIO
						DisableControlAction(0, 19, true) -- INPUT_CHARACTER_WHEEL 
						DisableControlAction(0, 85, true) -- INPUT_VEH_RADIO_WHEEL 
						DisableControlAction(0, 80, true) -- INPUT_VEH_CIN_CAM 
					
						SetVehRadioStation(veh, "OFF")
						SetVehicleRadioEnabled(veh, false)
						
						if state_lxsiren[veh] ~= 1 and state_lxsiren[veh] ~= 2 and state_lxsiren[veh] ~= 3 then
							state_lxsiren[veh] = 0
						end
						if state_pwrcall[veh] ~= true then
							state_pwrcall[veh] = false
						end
						if state_airmanu[veh] ~= 1 and state_airmanu[veh] ~= 2 and state_airmanu[veh] ~= 3 then
							state_airmanu[veh] = 0
						end
						
						if useFiretruckSiren(veh) and state_lxsiren[veh] == 1 then
							TogMuteDfltSrnForVeh(veh, false)
							dsrn_mute = false
						else
							TogMuteDfltSrnForVeh(veh, true)
							dsrn_mute = true
						end
						
						if not IsVehicleSirenOn(veh) and state_lxsiren[veh] > 0 then
							PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
							SetLxSirenStateForVeh(veh, 0)
							count_bcast_timer = delay_bcast_timer
						end
						if not IsVehicleSirenOn(veh) and state_pwrcall[veh] == true then
							PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
							TogPowercallStateForVeh(veh, false)
							count_bcast_timer = delay_bcast_timer
						end
					
						----- CONTROLS -----
						if not IsPauseMenuActive() then
						
							-- TOG DFLT SRN LIGHTS
							if IsDisabledControlJustReleased(0, 85) or IsDisabledControlJustReleased(0, 246) then
								if IsVehicleSirenOn(veh) then
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									SetVehicleSiren(veh, false)
								else
									PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									SetVehicleSiren(veh, true)
									count_bcast_timer = delay_bcast_timer
								end		
							
							-- TOG LX SIREN
							elseif IsDisabledControlJustReleased(0, 19) or IsDisabledControlJustReleased(0, 82) then
								local cstate = state_lxsiren[veh]
								if cstate == 0 then
									if IsVehicleSirenOn(veh) then
										PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) -- on
										SetLxSirenStateForVeh(veh, 1)
										count_bcast_timer = delay_bcast_timer
									end
								else
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) -- off
									SetLxSirenStateForVeh(veh, 0)
									count_bcast_timer = delay_bcast_timer
								end
								
							-- POWERCALL
							elseif IsDisabledControlJustReleased(0, 172) then
								if state_pwrcall[veh] == true then
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									TogPowercallStateForVeh(veh, false)
									count_bcast_timer = delay_bcast_timer
								else
									if IsVehicleSirenOn(veh) then
										PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
										TogPowercallStateForVeh(veh, true)
										count_bcast_timer = delay_bcast_timer
									end
								end
								
							end
							
							-- BROWSE LX SRN TONES
							if state_lxsiren[veh] > 0 then
								if IsDisabledControlJustReleased(0, 80) or IsDisabledControlJustReleased(0, 81) then
									if IsVehicleSirenOn(veh) then
										local cstate = state_lxsiren[veh]
										local nstate = 1
										PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1) -- on
										if cstate == 1 then
											nstate = 2
										elseif cstate == 2 then
											nstate = 3
										else	
											nstate = 1
										end
										SetLxSirenStateForVeh(veh, nstate)
										count_bcast_timer = delay_bcast_timer
									end
								end
							end
										
							-- MANU
							if state_lxsiren[veh] < 1 then
								if IsDisabledControlPressed(0, 80) or IsDisabledControlPressed(0, 81) then
									actv_manu = true
								else
									actv_manu = false
								end
							else
								actv_manu = false
							end
							
							-- HORN
							if IsDisabledControlPressed(0, 86) then
								actv_horn = true
							else
								actv_horn = false
							end
						
						end
						
						---- ADJUST HORN / MANU STATE ----
						local hmanu_state_new = 0
						if actv_horn == true and actv_manu == false then
							hmanu_state_new = 1
						elseif actv_horn == false and actv_manu == true then
							hmanu_state_new = 2
						elseif actv_horn == true and actv_manu == true then
							hmanu_state_new = 3
						end
						if hmanu_state_new == 1 then
							if not useFiretruckSiren(veh) then
								if state_lxsiren[veh] > 0 and actv_lxsrnmute_temp == false then
									srntone_temp = state_lxsiren[veh]
									SetLxSirenStateForVeh(veh, 0)
									actv_lxsrnmute_temp = true
								end
							end
						else
							if not useFiretruckSiren(veh) then
								if actv_lxsrnmute_temp == true then
									SetLxSirenStateForVeh(veh, srntone_temp)
									actv_lxsrnmute_temp = false
								end
							end
						end
						if state_airmanu[veh] ~= hmanu_state_new then
							SetAirManuStateForVeh(veh, hmanu_state_new)
							count_bcast_timer = delay_bcast_timer
						end	
					end
					
						
					--- IS ANY LAND VEHICLE ---	
					if GetVehicleClass(veh) ~= 14 and GetVehicleClass(veh) ~= 15 and GetVehicleClass(veh) ~= 16 and GetVehicleClass(veh) ~= 21 then
					
						----- CONTROLS -----
						if not IsPauseMenuActive() then
						
							-- IND L
							if IsDisabledControlJustReleased(0, 84) then -- INPUT_VEH_PREV_RADIO_TRACK
								local cstate = state_indic[veh]
								if cstate == ind_state_l then
									state_indic[veh] = ind_state_o
									actv_ind_timer = false
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
								else
									state_indic[veh] = ind_state_l
									actv_ind_timer = true
									PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
								end
								TogIndicStateForVeh(veh, state_indic[veh])
								count_ind_timer = 0
								count_bcast_timer = delay_bcast_timer			
							-- IND R
							elseif IsDisabledControlJustReleased(0, 83) then -- INPUT_VEH_NEXT_RADIO_TRACK
								local cstate = state_indic[veh]
								if cstate == ind_state_r then
									state_indic[veh] = ind_state_o
									actv_ind_timer = false
									PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
								else
									state_indic[veh] = ind_state_r
									actv_ind_timer = true
									PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
								end
								TogIndicStateForVeh(veh, state_indic[veh])
								count_ind_timer = 0
								count_bcast_timer = delay_bcast_timer
							-- IND H
							elseif IsControlJustReleased(0, 202) then -- INPUT_FRONTEND_CANCEL / Backspace
								if GetLastInputMethod(0) then -- last input was with kb
									local cstate = state_indic[veh]
									if cstate == ind_state_h then
										state_indic[veh] = ind_state_o
										PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									else
										state_indic[veh] = ind_state_h
										PlaySoundFrontend(-1, "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
									end
									TogIndicStateForVeh(veh, state_indic[veh])
									actv_ind_timer = false
									count_ind_timer = 0
									count_bcast_timer = delay_bcast_timer
								end
							end
						
						end
						
						
						----- AUTO BROADCAST VEH STATES -----
						if count_bcast_timer > delay_bcast_timer then
							count_bcast_timer = 0
							--- IS EMERG VEHICLE ---
							if GetVehicleClass(veh) == 18 then
								TriggerServerEvent("lvc_TogDfltSrnMuted_s", dsrn_mute)
								TriggerServerEvent("lvc_SetLxSirenState_s", state_lxsiren[veh])
								TriggerServerEvent("lvc_TogPwrcallState_s", state_pwrcall[veh])
								TriggerServerEvent("lvc_SetAirManuState_s", state_airmanu[veh])
							end
							--- IS ANY OTHER VEHICLE ---
							TriggerServerEvent("lvc_TogIndicState_s", state_indic[veh])
						else
							count_bcast_timer = count_bcast_timer + 1
						end
					
					end
					
				end
			end
			
		Citizen.Wait(0)
	end
end)

-- ELS Ende

-- SaltyChat Kreis Anfang
local draw3 = false
local draw8 = false
local draw15 = false
local draw32 = false
local drawmarker = true
local micmuted = false

RegisterCommand("kreis", function ()
  if drawmarker then
      drawmarker = false
      TriggerEvent("ws_notify", "info", "INFORMATION", "Sprachreichweiten Marker deaktiviert", 5000)
  else
      drawmarker = true
      TriggerEvent("ws_notify", "info", "INFORMATION", "Sprachreichweiten Marker aktiviert", 5000)
  end
end)

local drawMarkerDistance = nil

RegisterNetEvent('hud:range')
AddEventHandler('hud:range', function(voiceRange)
    if micmuted == false then
        if voiceRange == 3 then
            --TriggerEvent('notifications', '#ff0000', "SaltyChat", 'Sprachreichweite: 3M')
        end
        if voiceRange == 8 then
            --TriggerEvent('notifications', '#ff0000', "SaltyChat", 'Sprachreichweite: 8M')
        end
        if voiceRange == 15 then
            --TriggerEvent('notifications', '#ff0000', "SaltyChat", 'Sprachreichweite: 15M')
        end
        if voiceRange == 32 then
            --TriggerEvent('notifications', '#ff0000', "SaltyChat", 'Sprachreichweite: 32M')
        end
        drawMarkerDistance = voiceRange
        DrawKreis()
        Wait(500)
        drawMarkerDistance = nil
    end
end)

function DrawKreis()
    Citizen.CreateThread(function()
        while drawmarker and drawMarkerDistance ~= nil do
            Citizen.Wait(0)
            local coords  = GetEntityCoords(PlayerPedId())
            DrawMarker(1, coords.x, coords.y, coords.z -1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, drawMarkerDistance, drawMarkerDistance, 1.0, 0, 110, 255, 155, false, true, 2, false, false, false, false)
        end
    end)
end

-- SaltyChat Kreis Ende

-- Washkit Anfang


-- Washkit Anfang

local usingWashkit = false
      
RegisterNetEvent("washkit", function()
  if usingWashkit then 
    return 
  end

  usingWashkit = true 

  TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)

  Citizen.CreateThread(function()
    while usingWashkit do
      Citizen.Wait(0)

      DisableAllControlActions(0)
      EnableControlAction(0, 1, true)
      EnableControlAction(0, 2, true)
    end
  end)

  exports['loui_progress']:startUI(4000, "Auto waschen..")

  Wait(3000)

  local vehicle = ESX.Game.GetClosestVehicle()
  SetVehicleDirtLevel(vehicle, 0.0)
  ClearPedTasks(PlayerPedId())
  usingWashkit = false
end)

-- Washkit Ende


--Westen etc Hotkey Anfang
RegisterKeyMapping('schutzweste', 'Schutzwesten benutzen', 'keyboard', '')
RegisterKeyMapping('medikit', 'Medikit benutzen', 'keyboard', '')
local used = false
local IsAnimated = false
local IsDead = false
local ziehtime = 5000

RegisterNetEvent('loui_healing:setfast')
AddEventHandler('loui_healing:setfast', function()
	ziehtime = 5000
end)

RegisterNetEvent('loui_healing:setnormal')
AddEventHandler('loui_healing:setnormal', function()
	ziehtime = 5000
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	IsDead = false
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterNetEvent('loui_healing:medikit')
AddEventHandler('loui_healing:medikit', function()
	local playerPed = PlayerPedId()
	local cancelled = false
	loadAnimDict('amb@medic@standing@tendtodead@idle_a')
    TaskPlayAnim(playerPed, "amb@medic@standing@tendtodead@idle_a" ,"idle_a", 8.0, -8.0, -1, 1, 0, false, false, false)
    exports['loui_progress']:startUI(ziehtime, "Schutzweste..")
	IsAnimated = true
	Citizen.CreateThread(function()
		while IsAnimated do
			Wait(0)
			if IsControlJustPressed(0, 38) then
				IsAnimated = false
				cancelled = true
				ClearPedTasksImmediately(playerPed)
    			exports['loui_progress']:startUI(0, "Schutzweste..")
				used = false
				TriggerEvent("ws_notify", "info", "INFORMATION", "Dein Medkit wurde abgebrochen!", 5000)
			end
		end
	end)
	Wait(ziehtime)
	if not cancelled then
		local maxHealth = GetEntityMaxHealth(playerPed)
		ClearPedTasksImmediately(playerPed)
		TriggerEvent('weapontrigger2')
        Citizen.Wait(200)
		SetEntityHealth(playerPed, maxHealth)
		TriggerServerEvent('loui_healing:medikitused')
		TriggerEvent("ws_notify", "info", "INFORMATION", "Du hast 1x Medikit benutzt!", 5000)
		IsAnimated = false
	end
end)


RegisterNetEvent('loui_healing:bulletproof')
AddEventHandler('loui_healing:bulletproof', function()
	local playerPed = PlayerPedId()
	local cancelled = false
	loadAnimDict('anim@heists@narcotics@funding@gang_idle')
	TaskPlayAnim(playerPed, "anim@heists@narcotics@funding@gang_idle" ,"gang_chatting_idle01", 8.0, -8.0, -1, 1, 0, false, false, false)
    exports['loui_progress']:startUI(ziehtime, "Schutzweste..")
	IsAnimated = true
	Citizen.CreateThread(function()
		while IsAnimated do
			Wait(0)
			if IsControlJustPressed(0, 38) then
				IsAnimated = false
				cancelled = true
    			exports['loui_progress']:startUI(0, "Schutzweste..")
				ClearPedTasksImmediately(playerPed)
				used = false
				TriggerEvent("ws_notify", "info", "INFORMATION", "Deine Schutzweste wurde abgebrochen!", 5000)
			end
		end
	end)
	Wait(ziehtime)
	if not cancelled then
		TriggerEvent('weapontrigger3')
		AddArmourToPed(playerPed, 99)
		ClearPedTasksImmediately(playerPed)
		TriggerEvent('weapontrigger3')
		SetPedArmour(playerPed, 99)
		TriggerServerEvent('loui_healing:schutzwesteused')
		TriggerEvent("ws_notify", "info", "INFORMATION", "Du hast 1x Schutzweste benutzt!", 5000)
		IsAnimated = false
	end
end)

RegisterCommand("schutzweste", function()
	if not IsDead then
		if not used then
			if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				if not IsPedFalling(GetPlayerPed(-1), true) then
					if not IsPedRagdoll(GetPlayerPed(-1), true) then
						TriggerServerEvent('loui_healing:schutzwestecheck')
						used = true
						Wait(ziehtime)
						used = false
						Wait(500)
					else
						TriggerEvent("ws_notify", "info", "INFORMATION", "Das geht gerade nich!", 5000)
					end
				else
					TriggerEvent("ws_notify", "info", "INFORMATION", "Das geht im Fall nicht!", 5000)
				end
			else
				TriggerEvent("ws_notify", "info", "INFORMATION", "Das geht im Auto nicht!", 5000)
			end
		end
	end
end)

RegisterCommand("medikit", function()
	if not IsDead then
		if not used then
			if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
				if not IsPedFalling(GetPlayerPed(-1), true) then
					if not IsPedRagdoll(GetPlayerPed(-1), true) then
						TriggerServerEvent('loui_healing:medikitcheck')
						used = true
						Wait(ziehtime)
						used = false
						Wait(500)
					else
						TriggerEvent("ws_notify", "info", "INFORMATION", "Das geht gerade nicht!", 5000)
					end
				else
					TriggerEvent("ws_notify", "info", "INFORMATION", "Das geht gerade nich!", 5000)
				end
			else
				TriggerEvent("ws_notify", "info", "INFORMATION", "Das geht im Auto nicht!", 5000)
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsAnimated then
            DisableAllControlActions(0)
            EnableControlAction(0, 38, true) -- E
            EnableControlAction(0, 288, true) -- F1
            EnableControlAction(0, 1, true) -- MOUSE RIGHT
            EnableControlAction(0, 2, true) -- MOUSE DOWN
            EnableControlAction(0, 48, true) -- Y
        else
            Citizen.Wait(500)
        end
    end
end)

-- Westen etc Hotkey ende


-- Gym Anfang

Citizen.CreateThread(function()
	CreateBlipCircle(Config.Gym, "Gym", 20.0, 1, 311)
	while true do
		Citizen.Wait(0)
		pos = GetEntityCoords(PlayerPedId())
		local found = false
		for k, v in pairs(Config.Actions) do
			local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.coords)
			if dist <= 25.0 then
				found = true
				DrawMarker(0, v.coords.x, v.coords.y, v.coords.z + 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.4, 0.4, 0.4, 0, 110, 255, 100, false, true, 2, true, false, false, false)
				if dist <= 2.0 then
					ESX.ShowHelpNotification("Drücke ~INPUT_CONTEXT~  um zu Trainieren")
					if IsControlJustReleased(0, 38) then
						SetEntityCoords(PlayerPedId(), v.coords)
						SetEntityHeading(PlayerPedId(), v.heading)
						ExecuteCommand(v.anim)
						FreezeEntityPosition(PlayerPedId(), true)
						i = 0
						exports['loui_progress']:startUI(15000, "Schutzweste..")
						while i < 10000 do
							Citizen.Wait(20)
							i = i + 15
							DisablePlayerFiring(PlayerId(), true)
						end
						ExecuteCommand("e c")
						FreezeEntityPosition(PlayerPedId(), false)
						TriggerServerEvent("loui_skills:addSkill", 1.25)
					end
				end
			end
		end
		if not found then
			Wait(2500)
		end
	end
  end)
  
  RegisterNetEvent("loui_skills:handlespeed")
  AddEventHandler("loui_skills:handlespeed", function(prozent)
	if  tonumber(prozent) >= 150.0 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.25)
		return
	end
	if  tonumber(prozent) >= 140.0 and  tonumber(prozent) <= 149.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.30)
		return
	end
	if  tonumber(prozent) >= 137.0 and  tonumber(prozent) <= 139.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.28)
		return
	end
	if  tonumber(prozent) >= 136.0 and  tonumber(prozent) <= 136.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.20)
		return
	end
	if  tonumber(prozent) >= 133.0 and  tonumber(prozent) <= 135.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.15)
		return
	end
	if  tonumber(prozent) >= 130.0 and  tonumber(prozent) <= 132.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.14)
		return
	end
	if  tonumber(prozent) >= 127.0 and  tonumber(prozent) <= 129.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.13)
		return
	end
	if  tonumber(prozent) >= 124.0 and  tonumber(prozent) <= 126.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.12)
		return
	end
	if  tonumber(prozent) >= 121.0 and  tonumber(prozent) <= 123.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.11)
		return
	end
	if  tonumber(prozent) >= 118.0 and  tonumber(prozent) <= 120.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.10)
		return
	end
	if  tonumber(prozent) >= 115.0 and  tonumber(prozent) <= 117.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.09)
		return
	end
	if  tonumber(prozent) >= 112.0 and  tonumber(prozent) <= 114.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.08)
		return
	end
	if  tonumber(prozent) >= 109.0 and  tonumber(prozent) <= 111.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.07)
		return
	end
	if  tonumber(prozent) >= 106.0 and  tonumber(prozent) <= 108.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.06)
		return
	end
	if  tonumber(prozent) >= 100.0 and  tonumber(prozent) <= 109.9 then
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.05)
		return
	end
  end)
  
  function CreateBlipCircle(coords, text, radius, color, sprite)
	local blip = AddBlipForRadius(coords, radius)
  
	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 1)
	SetBlipAlpha (blip, 0)
	blip = AddBlipForCoord(coords)
	SetBlipHighDetail(blip, true)
	SetBlipSprite (blip, sprite)
	SetBlipScale  (blip, 0.8) 
	SetBlipColour (blip, color) 
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
	return blip
  end
  local cooldown = false
  
  RegisterCommand("sport", function(source, args, rawCommand)
	if not cooldown then
		if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			if not IsPedFalling(GetPlayerPed(-1), true) then
				if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
						FreezeEntityPosition(PlayerPedId(), true)
						cooldown = true
						SetTimeout(12000, function()
							cooldown = false
						end)
						ExecuteCommand("e c")
						local zahl = math.random(1, 2)
						if zahl == 1 then
							ExecuteCommand("e jog")
						elseif zahl == 2 then
							local zahl2 = math.random(1, 2)
							if zahl2 == 1 then
								ExecuteCommand("e situp")
							elseif zahl2 == 2 then
								ExecuteCommand("e pushup")
							end
						end
						exports['loui_progress']:startUI(10000, "Schutzweste..")
						Wait(10000)
						ExecuteCommand("e c")
						TriggerServerEvent("loui_skills:addSkill", 0.5)
						FreezeEntityPosition(PlayerPedId(), false)
				else
					TriggerEvent("ws_notify", "error", "INFORMATION", "Das geht im Auto nicht!", 5000)
				end
			else 
				TriggerEvent("ws_notify", "error", "INFORMATION", "Das geht im Fall nicht!", 5000)
			end
		else 
			TriggerEvent("ws_notify", "error", "INFORMATION", "Das geht im Auto nicht!", 5000)
		end
	else 
		TriggerEvent("ws_notify", "error", "INFORMATION", "Der Cooldown ist noch aktiv!", 5000)
	end
  end, false)    
  
  -- Gym Ende