ENV["DISCORDRB_NONACL"] = "1" # initialise environnment variable for windows

require 'discordrb' # import discordrb module

client = Discordrb::Commands::CommandBot.new token: "YOUR_TOKEN", prefix: "./" # instance of CommandBot object token: "token", prefix: ./

client.command :test do |event_command| #command without arguments test
  event_command.respond("Hello world") #when you type ./test the bot send "Hello world"
end

=begin
  Type: "./argumentCommand argument1 argument2"
  output: argument1, argument2 number of argument: 2
=end
client.command :argumentCommand do |event_command, *args|
  event_command.respond("%s number of arguments: %d" % [args.join(', '), args.length])
end

=begin
  type: ./ping
  output: pong !
=end

client.command :ping do |event_command|
  event_command.respond("pong !")
end

client.run # connect to discord
