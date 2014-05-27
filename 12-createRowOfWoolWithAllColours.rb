#import the needed modules
require_relative 'mcpi/minecraft'
require_relative 'mcpi/block'

# Create a connection to the Minecraft game
mc = Minecraft.create()

# Get the player position
playerPosition = mc.player.getTilePos()

# Set coordinates (position) for the block that is slightly away from the player
# Note y is the vertical coordinate, x and z the horizontal
blockYposn = playerPosition.y+1
blockZposn = playerPosition.z+1

for column in 0...16
    #increase the distance along and up that the block is placed at
    blockXposn = playerPosition.x + 1 + column
    puts("Creating block at (#{blockXposn}, #{blockYposn}, #{blockZposn})")
    # Create a block
    mc.setBlock(blockXposn, blockYposn, blockZposn, WOOL.withData(column))
end

