#!/usr/bin/env ruby

# We have to import the minecraft api module to do anything in the minecraft world
require_relative 'mcpi/minecraft'

=begin
First thing you do is create a connection to minecraft
This is like dialling a phone.
It sets up a communication line between your script and the minecraft world
=end

# Create a connection to Minecraft
# Any communication with the world must use this object
mc = Minecraft.create()

#output with no new line
print "Please enter some text to send to the chat: "
STDOUT.flush
# create the output message as a string
message = STDIN.gets.chomp
# puts to the ruby interpreter standard output (terminal probably)
puts(message)
# send message to the minecraft chat
mc.postToChat(message)

