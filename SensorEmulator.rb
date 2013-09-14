#! /usr/local/bin/ruby
require 'socket'
IP = "50.19.61.91"
PORT = 5005
while true do
  message = "ANT1,00:24:36:EB:E3:75,-64"
  s = UDPSocket.new
  s.connect("IP", PORT.to_s)
  puts s.send(message,0)
  s.close
  puts "sent " +  message + " to " + IP + ":" + PORT.to_s
  sleep 5

  message = "ANT2,00:24:36:EB:E3:75,-64"
  s = UDPSocket.new
  s.connect("IP", PORT.to_s)
  puts s.send(message,0)
  s.close
  puts "sent " +  message + " to " + IP + ":" + PORT.to_s
  sleep 5

  message = "ANT3,00:24:36:EB:E3:75,-64"
  s = UDPSocket.new
  s.connect("IP", PORT.to_s)
  puts s.send(message,0)
  s.close
  puts "sent " +  message + " to " + IP + ":" + PORT.to_s
  sleep 5

  message = "ANT4,00:24:36:EB:E3:75,-64"
  s = UDPSocket.new
  s.connect("IP", PORT.to_s)
  puts s.send(message,0)
  s.close
  puts "sent " +  message + " to " + IP + ":" + PORT.to_s
  sleep 5

end
