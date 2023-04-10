Config = {}

--Einreise Anfang
Config.EinreiseX = -1293.4331
Config.EinreiseY = -2631.7932
Config.EinreiseZ = 27.1347

Config.Position = vector3(-1227.0891, -2681.0049, 27.1347)

-- Einreise ende

-- Visum Stufen ANFANG

Config.Command = {
    enabled = true,
    cmd = 'spielzeit' -- /spielzeit <id>
}

-- Visum Stufen ENDE

-- Fraksperre Anfang

Config.time = 4320 --WIE LANGE DIE FRAKSPERRE ANHALTEN SOLL! IN MINUTEN
Config.CommandName = "removefraksperre"
Config.CommandAllowedGroups = {
    "admin"
}
Config.unemployed = "unemployed"

-- Fraksperre Ende

-- Gym Anfang

Config.Gym = vector3(-1201.45,-1567.97,4.61)
Config.Actions = {
    {coords = vector3(-1200.05,-1571.16,3.61), heading = 209.66, anim = "e chinup"},
    {coords = vector3(-1204.73,-1564.38,3.61), heading = 38.36, anim = "e chinup"},
    {coords = vector3(-1199.19,-1565.23,4.02), heading = 304.39, anim = "e situp"},
    {coords = vector3(-1201.41,-1566.44,4.02), heading = 215.57, anim = "e situp"},
    {coords = vector3(1643.40, 2527.71, 44.56), heading = 53.40, anim = "e chinup"},
    {coords = vector3(1640.47, 2522.32, 44.94), heading = 51.87, anim = "e situp"},
}

-- Gym Ende