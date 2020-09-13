ENV["DISCORDRB_NONACL"] = "1" # initialise environnment variable for windows

require 'discordrb' # import discordrb module

client = Discordrb::Commands::CommandBot.new token: "YOUR_TOKEN", prefix: "PREFIX" # instance of CommandBot object token: "token", prefix: ./

puts "Bot started :)"

client.run # connect to discord
