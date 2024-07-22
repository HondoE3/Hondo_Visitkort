fx_version 'cerulean'
game 'gta5'

description 'Firmakort med ox_lib'
author 'Hondo'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua', -- Sørg for at oxmysql er korrekt opsat, nogen glemmer det somehow.
    'server/main.lua'
}

client_scripts {
    'client/main.lua'
}

dependencies {
    'qb-core',
    'qb-inventory',
    'ox_lib'
}