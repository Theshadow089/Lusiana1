fx_version 'cerulean'
game 'gta5'

files {
    'html/*.*',
    'html/**/*.*'
}

lua54 'yes'

escrow_ignore {
    'config.lua'
}

ui_page 'html/ui.html'

shared_script 'config.lua'

client_script 'client.lua'

server_scripts {
	'@mysql-async/lib/MySQL.lua', 
    'server.lua'
}

dependency '/assetpacks'