# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Telelab02::Application.initialize!

unless Rails.env.gateway? # Initialize the gateway

  # Warden hooks
  Warden::Manager.after_authentication do |user,auth,opts|
    puts "Someone logged in> #{user.username}"
    user.options[:faye] = {}
    user.save
  end

  Warden::Manager.before_logout do |user,auth,opts|
    puts "Someone logged out> #{user.username}"
    user.options[:faye] = {}
    user.save
  end
  
end

#MetaWhere operator overload
MetaWhere.operator_overload!

# Checks if faye responds
begin
  puts "  Checking for Faye Server..."
  message = {:channel => "#{APP_CONFIG[:faye][:server][:channel_prefix]}#{FAYE_DEFAULT_CHANNEL}", :data => {}, :ext => {:auth_token => FAYE_TOKEN}}
  uri = URI.parse(FAYE_SERVER_URL)
  response = Net::HTTP.post_form(uri, :message => message.to_json)
  if response.class.eql? Net::HTTPOK
    puts "  Faye server (#{FAYE_SERVER_URL}) communication ok".light_green
  else
    puts "  Faye server (#{FAYE_SERVER_URL}) communication ok, but responded with: #{response}".light_yellow
  end
rescue Errno::ECONNREFUSED
  puts "  Faye server (#{FAYE_SERVER_URL}) did not respond!, please check if faye server is active".light_red
end

if Rails.env.gateway? # Initialize the gateway
  puts "  Initializing IRC_GATEWAY ..."
  irc_gateway = IRCGateway.instance # Calling it will initialize it
  puts "  Sleeping for 30 seconds before resetting devices...".light_green
  sleep 30
  puts "  ok, continuing...".light_yellow

  puts "  Setting Vlan switch in initial state...".light_yellow
  #remote_irc_gate_way.initialize_vlan_switch
  irc_gateway.initialize_vlan_switch_vlans
  puts "  Conections resetted".light_green
  puts "  Vlan Switch initialized...".light_green
  puts "  [OK]".light_green

else
  
  puts "  Checking for remote IRC Gateway..."
  begin
    remote_irc_gate_way = RemoteIRCGateway.instance
    if remote_irc_gate_way.status.eql? Net::HTTPOK
      puts "  Remote Irc Gateway initialized successfully!".light_green
      puts "  Sleeping for 10 seconds in case of device initializations taking place...".light_green
      sleep 10
      puts "  [OK]".light_green

    else
      puts "  Remote Irc Gateway (#{GATEWAY_SERVER_URL}) responded but its not in a ready state, please check if gateway service is ready".light_yellow
    end
  rescue Errno::ECONNREFUSED
    puts "  Remote Irc Gateway (#{GATEWAY_SERVER_URL}) did not respond, please check if gateway service is active".light_red
  end
  
end
