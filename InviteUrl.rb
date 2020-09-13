ENV["DISCORDRB_NONACL"] = "1" # initialise environnment variable for windows

require 'discordrb' # import discordrb module

client = Discordrb::Commands::CommandBot.new token: "NzU0NDEyNTA4MTY0MzkwOTQy.X10XZg.oo36ImCuoq0axyYTnFpqHcJO-fw", prefix: "./" # instance of CommandBot object token: "token", prefix: ./
puts "Bot started :)"

client.command :generateInvite do |event_command|
  template_link = "https://discord.gg/"
  obj = event_command.channel.make_invite(1, 1, true).url
  event_command.respond "%s Url generate :)" % [obj]
end
client.run # connect to discord
