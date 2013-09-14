#! /usr/bin/ruby 
require 'socket'
IP = "localhost"
PORT = 5005
s = TCPSocket.open(IP, PORT)
message = "ANT1,00:24:36:EB:E3:75,-64"
s = TCPSocket.open(IP, PORT)
s.send(message+"\n",0)
s.flush
puts "sent " +  message + " to " + IP + ":" + PORT.to_s
sleep 1
s.close
puts "closed"
