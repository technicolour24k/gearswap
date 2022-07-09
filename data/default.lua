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
		if (player.main_job_level < 99) then
			send_command('wait 1;gs load "private servers/'..server..'/generic"')
		else
			send_command('wait 1;gs load "private servers/'..server..'/'..player.name..'_'..player.main_job..'"')
		end
	else
		if (player.main_job_level < 99) then
			send_command('wait 1;gs load "retail/generic"')
		else
			send_command('wait 1;gs load "retail/'..player.name..'_'..player.main_job..'"')
		end	end
end
