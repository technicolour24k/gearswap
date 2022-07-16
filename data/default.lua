include('includes/config')
include('includes/common-functions')

function get_sets()
	
	debugLog("Clearing all keybinds..")
	send_command('clearbinds')
	debugLog("Clearing all aliases..")
	send_command('clearaliases')
	send_command('clear')
	send_command('wait 0.2; echo Dependency: "run" plugin - attempting to load.')
	send_command('load run')
	send_command('run addons/gearswap/data/copy-scripts.bat')
	send_command("wait 0.2; echo Executing Windower key binds..")
	send_command('exec windower-bindings')
	debugLog("Executing "..player.main_job.." key binds..")
	send_command('exec "binds/common"')
	send_command('exec "binds/'..server..'/'..player.name..'_'..player.main_job..'"')
	debugLog("Executing alias setup..") 
	send_command('exec "aliases/common"')
	send_command('exec "aliases/'..server..'/'..player.name..'_'..player.main_job..'"')
	
	if server ~= "retail" then
			send_command('wait 1;gs load "private servers/'..server..'/'..player.name..'_'..player.main_job..'"')
	else
			send_command('wait 1;gs load "retail/'..player.name..'_'..player.main_job..'"')
	end
end
