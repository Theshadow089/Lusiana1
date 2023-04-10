Config = {}

-- DONT SET THE RESET TIME ON A SERVER RESTART, PLEASE 1-3 MINUTES BEFORE
Config.Reset = {
    hour = 21, -- hour when it should be resetet
    min = 15, -- minute when it should be resetet
} 


Config.CollectPositions = {
    vector4(228.65, -906.7552, 30.0000, 49.3952)
}

Config.Ped = `s_m_y_clown_01` -- what ped should be spawned

Config.Notify = function(msg)
    ESX.ShowNotification(msg)
end

Config.Settings = {
    Blip = {
        name = "LC-Reward",
        sprite = 304,
        size = 0.8,
        color = 53,
        shortrange = true
    },
}

Config.DailyRewards = { -- RANDOM REWARDS
    {type = "account", account = "money", amount = 20000},
    {type = "account", account = "bank", amount = 25000},
    {type = "account", account = "black_money", amount = 15000},
    {type = "item", item = "doener", amount = 5},
    {type = "item", item = "weabox", amount = 5},
    {type = "item", item = "cheeseburger", amount = 5},
    {type = "item", item = "bulletproof", amount = 5},
    {type = "item", item = "lccoins100", amount = 1},
    {type = "item", item = "tint_platinum", amount = 1},
    {type = "item", item = "tint_lspd", amount = 1},
    {type = "item", item = "joint", amount = 5},
    {type = "item", item = "lccoins50", amount = 1},
    {type = "item", item = "lccoins50", amount = 1},
    {type = "item", item = "redbull", amount = 5},
    {type = "weapon", weapon = "weapon_pistol", ammo = 200},
    {type = "weapon", weapon = "weapon_pistol", ammo = 200},
}

Config.Locales = {
    notReady = "Du hast deine tägliche Belohnung bereits abgeholt.",
    gotMoney = "Du hast %s$ in %s erhalten.", -- e.g. Du hast 5000$ in Schwarzgeld erhalten.
    gotItem = "Du hast %sx %s erhalten.", -- e.g. Du hast 3x Brot erhalten.
    gotWeapon = "Du hast ein/e %s mit %s Schuss erhalten." -- Du hast ein/e Pistole mit 100 Schuss erhalten.
}