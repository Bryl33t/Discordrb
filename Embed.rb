ENV["DISCORDRB_NONACL"] = "1" # initialise environnment variable for windows

require 'discordrb' # import discordrb module

client = Discordrb::Commands::CommandBot.new token: "YOUR_ToKEN", prefix: "./" # instance of CommandBot object token: "token", prefix: ./

puts "Bot started :)"

client.command :embed do |event_command|
  event_command.channel.send_embed do |embed|
    embed.title = "Hello world"
    embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: "Muhammad", url: "https://google.fr", icon_url: nil)
    embed.colour = 0xA82727
  end
end
client.run # connect to discord
