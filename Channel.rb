ENV["DISCORDRB_NONACL"] = "1" # initialise environnment variable for windows

require 'discordrb' # import discordrb module

client = Discordrb::Commands::CommandBot.new token: "", prefix: "./" # instance of CommandBot object token: "token", prefix: ./

puts "Bot started :)"

client.command :clear do |event_clear, *args|
  puts event_clear.user.defined_permission?(:manage_server)
  if event_clear.user.defined_permission?(:manage_server)  == true
    if args.length == 1
      event_clear.respond "%s deleted :ok:" % [event_clear.channel.prune(args[0].to_i)]
    else
      event_clear.respond("Argument number expected : 1 :x:")
    end
  else
    event_clear.respond("No permission :x:")
  end
end

client.command :testChannel do |event_channel|
  event_channel.respond "Channel name: %s" % event_channel.channel.name
  event_channel.respond "NSFW: %s" % event_channel.channel.nsfw?
  event_channel.respond((event_channel.channel.owner_id != nil) ? "OwnerID: %s" % event_channel.channel.owner_id : "OwnerID: nil")
  event_channel.respond "Parent ID: %d " % event_channel.channel.parent_id
  event_channel.respond "Channel position: %d" % event_channel.channel.position
  event_channel.respond "Rate_limit per user %d" % event_channel.channel.rate_limit_per_user
end
client.run # connect to discord
