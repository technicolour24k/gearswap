math = require('math')
packets = require('packets')
pc = windower.ffxi.get_player() --Used to get Player Skills
skills = pc.skills --Requires a windower.ffxi.get_player() call - Line 3
stats = packets.parse('incoming', windower.packets.last_incoming(0x061)) --Requires "Packets (Line 2)"

playerStats = {}
playerStats.STR = {}
playerStats.STR.Base=stats['Base STR']
playerStats.STR.Added=stats['Added STR']
playerStats.STR.Total=playerStats['STR']['Base']+playerStats['STR']['Added']

playerStats.DEX = {}
playerStats.DEX.Base=stats['Base DEX']
playerStats.DEX.Added=stats['Added DEX']
playerStats.DEX.Total=playerStats['DEX']['Base']+playerStats['DEX']['Added']

playerStats.AGI = {}
playerStats.AGI.Base=stats['Base AGI']
playerStats.AGI.Added=stats['Added AGI']
playerStats.AGI.Total=playerStats['AGI']['Base']+playerStats['AGI']['Added']

playerStats.MND = {}
playerStats.MND.Base=stats['Base MND']
playerStats.MND.Added=stats['Added MND']
playerStats.MND.Total=playerStats['MND']['Base']+playerStats['MND']['Added']

playerStats.INT = {}
playerStats.INT.Base=stats['Base INT']
playerStats.INT.Added=stats['Added INT']
playerStats.INT.Total=playerStats['INT']['Base']+playerStats['INT']['Added']

playerStats.VIT = {}
playerStats.VIT.Base=stats['Base VIT']
playerStats.VIT.Added=stats['Added VIT']
playerStats.VIT.Total=playerStats['VIT']['Base']+playerStats['VIT']['Added']

playerStats.CHR = {}
playerStats.CHR.Base=stats['Base CHR']
playerStats.CHR.Added=stats['Added CHR']
playerStats.CHR.Total=playerStats['CHR']['Base']+playerStats['CHR']['Added']

playerStats.Attack = stats['Attack']
playerStats.Defence = stats['Defense']
playerStats.Defense = stats['Defense'] --For the non-UK folk

