include('includes/config')

function get_sets()
	send_command("echo Clearing all keybinds..")
	send_command('clearbinds')
	send_command("echo Clearing all aliases..")
	send_command('clearaliases')
	send_command('clear')
	send_command('wait 0.2; echo Dependency: "run" plugin - attempting to load.')
	send_command('load run')
	send_command('run addons/gearswap/data/copy-scripts.bat')
	send_command("wait 0.2; echo Executing Windower key binds..")
	send_command('exec windower-bindings')
	send_command("echo Executing "..player.main_job.." key binds..")
	send_command('exec "binds/common"')
	send_command('exec "binds/'..server..'/'..player.name..'_'..player.main_job..'"')
	send_command("echo Executing alias setup..") 
	send_command('exec "aliases/common"')
	send_command('exec "aliases/'..server..'/'..player.name..'_'..player.main_job..'"')
	
	if server ~= "retail" then
		-- send_command('exec '..windower.windower_path..'/addons/gearswap/data/private servers/'..server..'/binds/'..player.name..'_'..player.main_job..'.txt')
		send_command('wait 1;gs load "private servers/'..server..'/'..player.name..'_'..player.main_job..'"')
	else
		-- send_command('exec "../addons/gearswap/retail/binds/'..player.name..'_'..player.main_job..'.txt"')
		send_command('wait 1;gs load "retail/'..player.name..'_'..player.main_job..'"')
	end
end
