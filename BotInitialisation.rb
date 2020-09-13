ENV["DISCORDRB_NONACL"] = "1" # initialise environnment variable for windows

require 'discordrb' # import discordrb module

client = Discordrb::Commands::CommandBot.new token: "NzU0NDEyNTA4MTY0MzkwOTQy.X10XZg.HpP9faB3nxcvregUDeXo_HqxBPg", prefix: "./" # instance of CommandBot object token: "token", prefix: ./

puts "Bot started :)"

client.run # connect to discord
