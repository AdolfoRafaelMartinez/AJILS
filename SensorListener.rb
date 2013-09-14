#! /usr/bin/ruby
puts "running"
require 'socket'
portnumber = 5005
socketServer = TCPServer.open(portnumber)
while true
  connection = socketServer.accept
  # puts "Accepting connection from: #{connection.peeraddr[2]}"
  begin
    incomingData = connection.gets("\0")
    if incomingData != nil
      # puts "Incoming: #{incomingData}"
      message = incomingData.chomp
      message = message.split(",")
      sensor = message[0]
      device = message[1]
      strength = message[2]
      f = File.open(sensor+"_data.txt","w")
      f.write(device+","+strength+"\n")
      f.close
    end
  rescue Exception => e
    puts "#{ e } (#{ e.class })"
  ensure
    connection.close
    # puts "Closing"
  end
end
