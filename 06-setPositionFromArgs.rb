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
    puts("Example usage: ruby script.rb 9 8")
    exit(-1)
end

# Get the current tile/block that the player is located at in the world
playerPosition = mc.player.getTilePos()

# create the output message as a string
message = "You are at (#{playerPosition.x},#{playerPosition.y},#{playerPosition.z})"

# puts to the ruby interpreter standard output (terminal probably)
puts(message)

# send message to the minecraft chat
mc.postToChat(message)
newXposn = ARGV[0].to_i
newZposn = ARGV[1].to_i

newYposn = mc.getHeight(newXposn, newZposn)

mc.player.setTilePos(newXposn, newYposn, newZposn)

# Get the current tile/block that the player is located at in the world
playerPosition = mc.player.getTilePos()

message = "You are now at (#{playerPosition.x},#{playerPosition.y},#{playerPosition.z})"

puts(message)
mc.postToChat(message)





