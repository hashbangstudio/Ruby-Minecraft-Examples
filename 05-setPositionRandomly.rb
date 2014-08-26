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

# Get the current tile/block that the player is located at in the world
playerPosition = mc.player.getTilePos()

# create the output message as a string
message = "Your are at (#{playerPosition.x}, #{playerPosition.y}, #{playerPosition.z})"

# puts to the ruby interpreter standard output (terminal probably)
puts(message)

# Send message to the minecraft chat
mc.postToChat(message)

# Randomly generates the amount to shift position by
xShift = rand(21)-10
zShift = rand(21)-10
# Set variables for the new position
newXposn = playerPosition.x + xShift
newZposn = playerPosition.z + zShift
# Set y position to be the height of the world so not in middle of a block
newYposn = mc.getHeight(newXposn, newZposn)
# Set the position of the player
mc.player.setTilePos(newXposn, newYposn, newZposn)
# Get the current tile/block that the player is located at in the world
playerPosition = mc.player.getTilePos()

message = "You have been moved to (#{playerPosition.x}, #{playerPosition.y}, #{playerPosition.z})"

puts(message)
mc.postToChat(message)
