local currentPlayerPedId = nil
local currentPlayerId = nil

AddEventHandler('playerSpawned', function()
	currentPlayerPedId = PlayerPedId()
end)

RegisterNetEvent('dmg')
AddEventHandler('dmg', function(arg)
  local ent = currentPlayerPedId
  SetEntityHealth(ent, GetEntityHealth(ent) - 10)
end)

RegisterNetEvent('heal')
AddEventHandler('heal', function(arg)
  local ent = currentPlayerPedId
  local currentHealth = GetEntityHealth(ent);

  if currentHealth < 200 then
    SetEntityHealth(ent, GetEntityHealth(ent) + 10)
  end
end)

RegisterNetEvent('armour')
AddEventHandler('armour', function(arg)
  local ent = currentPlayerPedId
  SetPedArmour(ent, 100)
end)


Citizen.CreateThread(function()
  currentPlayerPedId = PlayerPedId()
  currentPlayerId = PlayerId()

  while true do
    Citizen.Wait(100)

    SendNUIMessage({
      show = IsPauseMenuActive(),
      health = GetEntityHealth(currentPlayerPedId) - 100,
      armour = GetPedArmour(currentPlayerPedId),
      stamina = 100 - GetPlayerSprintStaminaRemaining(currentPlayerId)
    })
  end
end)