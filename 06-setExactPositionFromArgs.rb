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

numOfArgs = ARGV.length
if numOfArgs != 2
    puts("incorrect number of arguments, Expected 2 but got #{numOfArgs}")
    puts("Usage: ruby script.rb xCoord zCoord")
    puts("Example usage: ruby script.rb 9.2 8.5")
    exit(-1)
end

# Get the current tile/block that the player is located at in the world
playerPosition = mc.player.getPos()

# create the output message as a string
message = "You are at (#{'%.1f' % playerPosition.x}, #{'%.1f' % playerPosition.y}, #{'%.1f' % playerPosition.z})"

# puts to the ruby interpreter standard output (terminal probably)
puts(message)

# send message to the minecraft chat
mc.postToChat(message)
newXposn = ARGV[0].to_f
newZposn = ARGV[1].to_f

newYposn = mc.getHeight(newXposn, newZposn).to_f

mc.player.setPos(newXposn, newYposn, newZposn)

# Get the current tile/block that the player is located at in the world
playerPosition = mc.player.getPos()

message = "You have been moved to (#{'%.1f' % playerPosition.x}, #{'%.1f' % playerPosition.y}, #{'%.1f' % playerPosition.z})"

puts(message)
mc.postToChat(message)





