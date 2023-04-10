Config = {}
Config.Cooldown = 600 -- Sekunden

Config.Passive = {
    use = true,
    opacity = 75,
    invincible = true,
}

Config.AmbulanceJobTrigger = "esx_ambulancejob:revive"

Config.Notify = function(msg)
    TriggerEvent("cv_notify", "Kampfunfähigkeit", msg, 0)
end

Config.Locales = {
    ["deathTimeout"] = "Du fühlst dich schwach für %s",
    ["loggedOff"] = "Da du dich das letzte Mal, als du kampfunfähig warst, ausgeloggt hast, bist du nun für %s kampfunfähig."
}

Config.Debug = {
    usecommand = true,
    showprints = true,
}