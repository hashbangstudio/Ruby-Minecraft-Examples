#!/usr/bin/env ruby

# We have to import the minecraft api module to do anything in the minecraft world
require_relative 'mcpi/minecraft'


=begin
First thing you do is create a connection to minecraft
This is like dialling a phone.
It sets up a communication line between your script and the minecraft world
=end

def printUsageAndExit(numOfArgs)
    puts("Expected 2 or 0 arguments but recieved #{numOfArgs}")
    puts("To get the height of the world at the player")
    puts("Usage: ruby script.rb")
    puts("To get the height of the world at a specific coordinate")
    puts("Usage: ruby script.rb x z")
    puts("Example: ruby script.rb 10 15")
    exit()
end

# Create a connection to Minecraft
# Any communication with the world must use this object
mc = Minecraft.create()


numOfArgs = ARGV.length

if numOfArgs == 2 or numOfArgs == 0
    #set a value for x and z in case of assignment failure later
    x = 0
    z = 0
    if numOfArgs == 2
        x = ARGV[0].to_i
        z = ARGV[1].to_i
    else
        # Get the current tile/block that the player is located at in the world
        playerPosition = mc.player.getTilePos()

        x = playerPosition.x
        z = playerPosition.z
    end
    #get the height of the world at the coordinates (x,z)
    height = mc.getHeight(x,z)

    # create the output message as a string
    message = "Height of world is #{height} at (#{x}, #{z})"

    # puts to the ruby interpreter standard output (terminal probably)
    puts(message)

    # send message to the minecraft chat
    mc.postToChat(message)
else
    printUsageAndExit(numOfArgs)
end



