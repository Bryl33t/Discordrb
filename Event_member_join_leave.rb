ENV["DISCORDRB_NONACL"] = "1" # initialise environnment variable for windows

require 'discordrb' # import discordrb module

client = Discordrb::Commands::CommandBot.new token: "YOUR_TOKEN", prefix: "./" # instance of CommandBot object token: "token", prefix: ./

puts "Bot started :)"

=begin
  the function member_join require a block event
  event is raised when member join
=end
client.member_join do |event_user_join|
  event_user_join.send_message(754453848294424576, "%s vient de rejoindre le serveur" % event_user_join.user.name)
end

=begin
  function member_leave require block event
  event is raised when member leave server

  [send_message]
    id_channel
    content
=end
client.member_leave do |event_user_leave|
  event_user_leave.send_message(754453848294424576, "%s vient de quitter le serveur" % event_user_leave.user.name)
end

client.run # connect to discord
