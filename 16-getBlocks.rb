# We have to import the minecraft api module to do anything in the minecraft world
require_relative 'mcpi/minecraft'
require_relative 'mcpi/block'
require_relative 'blockData'

=begin
             NOTE THAT THE getBlock() FUNCTION IS BUGGED IN THE API
             THIS EXAMPLE WILL NOT WORK

=end



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

# Get the type of block for the highest point in world at horiz player posn
# Need to do height minus one for this
blocksInCuboid = mc.getBlocks(playerPosition.x, height, playerPosition.z,
                          playerPosition.x + 10, height, playerPosition.z + 10)

puts(blocksInCuboid)

# puts to the ruby interpreter standard output (terminal probably)
puts(message)

# send message to the minecraft chat
mc.postToChat(message)
