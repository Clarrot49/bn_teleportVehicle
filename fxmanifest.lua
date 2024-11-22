-- Resource Metadata
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Clarrot49'
description 'Admin command to teleport into a player vehicle'
version '1.0.0'

-- What to run
client_scripts {
    'source/client.lua'
}

server_scripts {
    'source/server.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
}