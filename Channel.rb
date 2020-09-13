ENV["DISCORDRB_NONACL"] = "1" # initialise environnment variable for windows

require 'discordrb' # import discordrb module

client = Discordrb::Commands::CommandBot.new token: "YOUR_TOKEN", prefix: "./" # instance of CommandBot object token: "token", prefix: ./

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
client.run # connect to discord
