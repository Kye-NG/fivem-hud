RegisterCommand('dmg', function(source, args)
  if (source > 0) then
    TriggerClientEvent('dmg', source, '')
  else
    print('Server cannot run this command')
  end
end)

RegisterCommand('heal', function(source, args)
  if (source > 0) then
    TriggerClientEvent('heal', source, '')
  else
    print('Server cannot run this command')
  end
end)