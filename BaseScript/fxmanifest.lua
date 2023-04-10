fx_version 'bodacious'
game 'gta5'

author 'Louisiana City Roleplay'

server_script {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/server.lua'
}
client_scripts {
    'config.lua',
    'client/blip_info.lua',
    'client/nui_blocker.lua',
    'client/client.lua'
}

ui_page 'nui_blocker.html'

files {
	'nui_blocker.html'
}

export 'ResetBlipInfo'
export 'SetBlipInfo'
export 'SetBlipInfoTitle'
export 'SetBlipInfoImage'
export 'SetBlipInfoEconomy'
export 'AddBlipInfoText'
export 'AddBlipInfoName'
export 'AddBlipInfoHeader'
export 'AddBlipInfoIcon'
