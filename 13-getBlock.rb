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
message = " height is #{height}"

# Get the type of block for the highest point in world
# This is done at the horizonal player posn
blockIdNum = mc.getBlock(playerPosition.x, height , playerPosition.z)
blockName = BlockIdToName[blockIdNum]

if (blockIdNum == AIR.id)
     # Need to do height minus one for this as not flower etc
     blockIdNum = mc.getBlock(playerPosition.x, height -1 , playerPosition.z)
     blockName = BlockIdToName[blockIdNum]
end

# Add to message, the type of block stood on
message += " Block type #{blockIdNum} which is #{blockName}"

# puts to the ruby interpreter standard output (terminal probably)
puts(message)

# send message to the minecraft chat
mc.postToChat(message)
