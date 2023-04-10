fx_version 'cerulean'
game 'gta5'

files {
    'html/*.*'
}
ui_page 'html/index.html'

shared_script 'config.lua'
server_script 'server/server.lua'
client_script 'client/client.lua'

lua54 'yes'
escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'