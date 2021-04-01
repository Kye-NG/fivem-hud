-- Sending info to healthbar
-- SendNUIMessage({
--   type = 'ui',
--   status = menuOpen
-- })

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