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

allIds = mc.getPlayerEntityIds()
message = ""
    # create the output message as a string
for id in allIds
    message += "id is #{id}"
    # puts to the ruby interpreter standard output (terminal probably)
    puts(message)
    # send message to the minecraft chat
    mc.postToChat(message)
end

