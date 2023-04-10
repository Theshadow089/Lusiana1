fx_version 'cerulean'
game 'gta5'


ui_page 'progress.html'


lua54 'yes'

escrow_ignore {
	'config.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'config.lua',
	'server/main.lua'
}


dependency '/assetpacks'