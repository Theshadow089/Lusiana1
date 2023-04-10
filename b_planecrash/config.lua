Config = {}
Config.UseFlare = false
Config.ESXNotify = true
-- Blip
Config.Blip = 1
Config.BlipScale = 0.8
Config.BlipColor = 1
-- Help msg
Config.CrateHelpMSG = "Drücke ~input_context~ um die Kiste zu looten"
Config.WreckHelpMSg = "Drücke ~input_context~ um das Wrack zu Looten!"

Config.LootWebhook = "https://discord.com/api/webhooks/998573189636567080/pveugSGUIGpjsqiV_ryfN4UekEMKqp1r9WONPc-GaF5Ed7z9gbf3OhAH83e14Ys6OA6H"

Config.Groups = {
    'superadmin',
    'admin',
}

Config.Webhooks = {
    ["reward1"] = "",
    ["reward2"] = "",
    ["finish"] = "",
}

Config.LocationAmount = 2 -- musst die gleiche Anzahl haben wie oben links bei Config.Crash also die letzte wie z.b 3
Config.Crash = {
    [1] = {
        Crashname = "Flugzeug-Absturz",
        Prop = GetHashKey("prop_shamal_crash"),
        Pos = vector3(2812.1118, 4777.3042, 47.4156),
        Heading =  191.6932,
        Doorcoords = vector3(2814.6121, 4773.0967, 48.1119),
        DoorHeading = 98.1409, 
        CrateCoords = vector3(2815.9080, 4776.6099, 47.7018),
        CrateHeading = 110.4588,
        Direction = "south",
        blip = 307,
    },
    [2] = {
        Crashname = "Heli-Absturz",
        Prop = GetHashKey("prop_crashed_heli"),
        Pos = vector3(2592.8569, 4438.9668, 39.9596),
        Heading =  162.6165,
        Doorcoords = vector3(2591.0867, 4439.4111, 39.7908),
        DoorHeading = 249.0245,
        CrateCoords = vector3(2597.5122, 4438.6563, 40.0742),
        CrateHeading = 133.4614,
        Direction = "south",
        blip = 64, 
    }
}

Config.Belohnungen = {
    [1] = {
        type = 'items',        
        reward = {
            [1] = {name = 'bread', amount = math.random(1,10)}
        }
    }
}

Config.CrateLoot = {
    [1] = {
        type = 'money',
        reward = {
            [1] = {account = 'money', amount = math.random(5000,35000)}
        }
    },
    -- [2] = {
	-- 	type = 'weapons',		
	-- 	reward = {
	-- 		[1] = {title = 'Advanced Rifle', weapon = 'WEAPON_ADVANCEDRIFLE', ammo = 50},
	-- 	}
	-- }
}

-- if u want to add black money to the Loot
-- [2] = {
--     type = 'black-money',
--     reward = {
--         [1] = {account = 'black_money', amount = math.random(1000,3500)}
--     }
-- }


-- if u want to add money to the Loot
-- [2] = {
--     type = 'money',
--     reward = {
--         [1] = {account = 'money', amount = math.random(1000,3500)}
--     }
-- }


-- if u want to add weapons to the Loot
-- [1] = {
--     type = 'weapons',		
--     reward = {
--         [1] = {title = 'Pistole', weapon = 'WEAPON_PISTOL', ammo = 50},
--     }
-- }

-- if u want to add items to the Loot
-- [1] = {
--     type = 'items',		
--     reward = {
--         [1] = {name = 'water', amount = 5},
--         [2] = {name = 'bread', amount = math.random(1,2)}
--     }
-- },

Config.Notify = function(color, title, msg)
	TriggerEvent('cv_notify', title, msg, color) 
end

Config.Language = "de"
Config.AdvNotifyTitle = 'Geheim'
Config.AdvNotifySubj = 'Absturzstelle'
Config.AdvNotifyIMG = 'CHAR_MP_SNITCH'
Config.Lang = {
	["de"] = {
		["crashed"] = "Ey yo Homie! Irgendetwas ist abgestürtzt check das mal ab alter! Ich habe es dir auf deinem Navi markiert. Lass dir nicht zu viel Zeit!",
        ["crashedfertig"] = "Das Wrack wurde gelooted!",
        ["hauab"] = "Ey bro! Du bist fertig hau nun ab!",
        ["weapon"] = "Du hast 1x %s bekommen",
        ["item"] = "Du hast %s bekommen",
        ["geld"] = "Du hast %s$ Schwarzgeld bekommen",
        ["Geld2"] = "Du hast %s$ bekommen"
	} 
 }


