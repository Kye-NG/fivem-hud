-- Sending info to healthbar
-- SendNUIMessage({
--   type = 'ui',
--   status = menuOpen
-- })

RegisterNetEvent('dmg')
AddEventHandler('dmg', function(arg)
  local ent = GetPlayerPed(-1)
  SetEntityHealth(ent, GetEntityHealth(ent) - 10)
end)

RegisterNetEvent('heal')
AddEventHandler('heal', function(arg)
  local ent = GetPlayerPed(-1)
  local currentHealth = GetEntityHealth(ent);

  if currentHealth < 200 then
    SetEntityHealth(ent, GetEntityHealth(ent) + 10)
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(100)

    SendNUIMessage({
      show = IsPauseMenuActive(),
      health = GetEntityHealth(GetPlayerPed(-1)) - 100,
      armor = GetPedArmour(GetPlayerPed(-1)),
      stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId())
    })
  end
end)