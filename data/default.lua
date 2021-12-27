include('includes/config')

function get_sets()

	send_command("echo Clearing all keybinds..")
	send_command('clearbinds')
	send_command("echo Clearing all aliases..")
	send_command('clearaliases')
	send_command("echo Executing Windower key binds..")
	send_command('exec windower-bindings')
	send_command("echo Executing "..player.main_job.." key binds..")
	send_command('exec "binds/'..server..'/'..player.name..'_'..player.main_job..'"')
	send_command("echo Executing alias setup..")
	send_command('exec "aliases/common"')
	send_command('exec "aliases/'..server..'/'..player.name..'_'..player.main_job..'"')
	
	if server ~= "retail" then
		send_command('wait 1;gs load "private servers/'..server..'/'..player.name..'_'..player.main_job..'"')	
	else
		send_command('wait 1;gs load "retail/'..player.name..'_'..player.main_job..'"')
	end
	
end