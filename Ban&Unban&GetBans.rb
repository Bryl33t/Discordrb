ENV["DISCORDRB_NONACL"] = "1" # initialise environnment variable for windows

require 'discordrb' # import discordrb module
require 'json'


def getId(str_id)
  del_chevron_unless = str_id.gsub("<", "")
  del_at = del_chevron_unless.gsub("@", "")
  del_exclamation = del_at.gsub("!", "")
  del_chevron_less = del_exclamation.gsub(">", "")
  return del_chevron_less.to_i
end

client = Discordrb::Commands::CommandBot.new token: "YOUR_TOKEN", prefix: "./" # instance of CommandBot object token: "token", prefix: ./

puts "Bot started :)"


client.command :ban do |event_command, *args|
  if args.length == 1

    Discordrb::API::Server::ban_user(client.token, event_command.server.id, getId(args[0]), "5")
  else
    event_command.respond("1 argument expected")
  end
end

client.command :unban do |event_command, *args|
  if args.length == 1

    Discordrb::API::Server::unban_user(client.token, event_command.server.id, args[0].to_i)
  else
    event_command.respond("1 argument expected")
  end
end

client.command :getBanUser do |event_command|
  @user_ban = JSON.parse(Discordrb::API::Server.bans(client.token, event_command.server.id))
  @user_ban.length.times do |i|
    event_command.respond("%s => %d" % [@user_ban[i]["user"]["username"], @user_ban[i]["user"]["id"]])
  end

end
client.run # connect to discord
