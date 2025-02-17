RegisterNetEvent("startEarthquake")
AddEventHandler("startEarthquake", function()
    local duration = 20000 -- Durée du tremblement (20 secondes)
    local startTime = GetGameTimer()

    -- Active le tremblement de caméra
    ShakeGameplayCam("LARGE_EXPLOSION_SHAKE", 1.0) -- Active un tremblement fort

    -- Joue le son du tremblement
    SendNUIMessage({
        transactionType = "playSound",
        transactionFile = "earthquake.ogg",
        transactionVolume = 3.8
    })

    while GetGameTimer() - startTime < duration do
        -- Augmente et diminue l'amplitude du tremblement
        local shakeIntensity = math.random(2, 6) / 10.0
        SetCamShakeAmplitude(shakeIntensity)

        -- Applique un petit mouvement de caméra aléatoire
        local playerPed = PlayerPedId()
        local camCoords = GetGameplayCamCoord()
        SetGameplayCamRelativeHeading(GetGameplayCamRelativeHeading() + math.random(-3, 3)) -- Secousses gauche/droite
        SetGameplayCamRelativePitch(GetGameplayCamRelativePitch() + math.random(-2, 2), 1.0) -- Secousses haut/bas

        Citizen.Wait(300) -- Pause entre chaque secousse
    end

    -- Arrête le tremblement
    StopGameplayCamShaking(true)
end)
