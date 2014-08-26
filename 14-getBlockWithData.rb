#!/usr/bin/env ruby

# We have to import the minecraft api module to do anything in the minecraft world
require_relative 'mcpi/minecraft'
require_relative 'mcpi/block'
require_relative 'blockData'

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
height = mc.getHeight(playerPosition.x, playerPosition.z)
# create the output message as a string
message = "Height is #{height}"
# puts to the ruby interpreter standard output (terminal probably)
puts(message)
# post message to the chat
mc.postToChat(message)

# Get the type of block for the highest point in world at horiz player posn
blockAndData = mc.getBlockWithData(playerPosition.x, height , playerPosition.z)

if blockAndData.id == AIR.id
    # Need to do height minus one for this
    blockAndData = mc.getBlockWithData(playerPosition.x, height -1 , playerPosition.z)
end

blockName = BlockIdToName[blockAndData.id]

# Add to message, the type of block stood on
message = "Block is of type #{blockAndData.id} which is #{ blockName}"
# puts to the ruby interpreter standard output (terminal probably)
puts(message)
# post message to the chat
mc.postToChat(message)

dataMessage = "Block data is #{blockAndData.data}"
puts(dataMessage)
mc.postToChat(dataMessage)

if blockAndData.id == WOOL.id
   puts "is wool"
   ColourNameToId.each {|colour, colId|
        if colId == blockAndData.data
           colourMsg = "Colour is " + colour
           puts colourMsg
           mc.postToChat(colourMsg)
        end
    }
end



