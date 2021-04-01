-- Manifest data
fx_version 'cerulean'
games {'gta5'}

-- Resource stuff
name 'fivem-hud'
description 'Adds a simple hud to your server'
version 'v0.0.1'
author 'Kye Norman-Gill'

-- Leave this set to '0' to prevent compatibility issues 
-- and to keep the save files your users.
-- experimental_features_enabled '0'

ui_page 'html/index.html'

client_script 'client.lua'

files {
  'html/index.html',
  'html/css/style.css',
  'html/js/index.js'
}