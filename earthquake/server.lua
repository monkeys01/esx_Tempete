RegisterCommand("earthquake", function(source, args, rawCommand)
    print("^1[EARTHQUAKE] Un tremblement de terre commence !")
    TriggerClientEvent("startEarthquake", -1) -- Active le tremblement pour tous les joueurs
end, true)
