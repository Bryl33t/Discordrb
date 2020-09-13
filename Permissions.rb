ENV["DISCORDRB_NONACL"] = "1" # initialise environnment variable for windows

require 'discordrb' # import discordrb module

client = Discordrb::Commands::CommandBot.new token: "YOUR_TOKEN", prefix: "./" # instance of CommandBot object token: "token", prefix: ./
=begin
{
  # Bit => Permission # Value
  0 => :create_instant_invite, # 1
  1 => :kick_members,          # 2
  2 => :ban_members,           # 4
  3 => :administrator,         # 8
  4 => :manage_channels,       # 16
  5 => :manage_server,         # 32
  6 => :add_reactions,         # 64
  7 => :view_audit_log,        # 128
  8 => :priority_speaker,      # 256
  9 => :stream,                # 512
  10 => :read_messages,        # 1024
  11 => :send_messages,        # 2048
  12 => :send_tts_messages,    # 4096
  13 => :manage_messages,      # 8192
  14 => :embed_links,          # 16384
  15 => :attach_files,         # 32768
  16 => :read_message_history, # 65536
  17 => :mention_everyone,     # 131072
  18 => :use_external_emoji,   # 262144
  19 => :view_server_insights, # 524288
  20 => :connect,              # 1048576
  21 => :speak,                # 2097152
  22 => :mute_members,         # 4194304
  23 => :deafen_members,       # 8388608
  24 => :move_members,         # 16777216
  25 => :use_voice_activity,   # 33554432
  26 => :change_nickname,      # 67108864
  27 => :manage_nicknames,     # 134217728
  28 => :manage_roles,         # 268435456, also Manage Permissions
  29 => :manage_webhooks,      # 536870912
  30 => :manage_emojis         # 1073741824
}.freeze
=end
puts "Bot started :)"

client.command :checkPerm do |event|
  begin
    if event.user.defined_permission?(:ban_members)
      event.respond("You have a ban permission :ok:")
    else
      event.respond("You don't have a ban permission :x:")
    end
  rescue Discordrb::Errors::NoPermission
    event.respond("You don't have a permission :x:")
  end
end

client.run # connect to discord
