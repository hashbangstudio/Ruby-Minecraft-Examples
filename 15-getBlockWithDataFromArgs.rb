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
numOfArgs = ARGV.length
if numOfArgs == 3
    x = ARGV[0].to_i
    y = ARGV[1].to_i
    z = ARGV[2].to_i
elsif numOfArgs == 2
    x = ARGV[0].to_i
    z = ARGV[1].to_i
    #Get the block that would be stood on at this Horiz posn
    y = mc.getHeight(x,z) - 1
else
    puts("Number of arguments incorrect, Expected 2 or 3 but got #{numOfArgs}")
    puts("Usage with 3 args: ruby script.rb xcoord ycoord zcoord")
    puts("Usage with 2 args: ruby script.rb xcoord zcoord")
    exit()
end

# Get the type of block
blockAndData = mc.getBlockWithData(x, y ,z)

blockName = BlockIdToName[blockAndData.id]

# Create message for the type of block stood on
message = "Block id #{blockAndData.id} which is #{ blockName}"
# puts to the ruby interpreter standard output (terminal probably)
puts(message)
# post message to the chat
mc.postToChat(message)

message = "Block Data is #{blockAndData.data}"
# puts to the ruby interpreter standard output (terminal probably)
puts(message)
# post message to the chat
mc.postToChat(message)

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



