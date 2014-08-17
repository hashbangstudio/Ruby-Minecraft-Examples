#!/usr/bin/env ruby

#import the needed modules fo communication with minecraft world
require_relative 'mcpi/minecraft'
# import needed block defintiions
require_relative 'mcpi/block'


# Create a connection to the Minecraft game
mc = Minecraft.create()

# Get the player position
playerPosition = mc.player.getTilePos()

# define the position of the bottom left block of the wall
blockXposn = playerPosition.x + 6
firstColumnX = blockXposn
blockYposn = playerPosition.y + 1
blockZposn = playerPosition.z + 6

# Create a wall using nested for loops
for row in 0...6
    # increase the height of the current row to be built
    blockYposn += 1
    blockXposn = firstColumnX
    for column in 0...10
        # Increase the distance along the row that the block is placed at (current column)
        blockXposn += 1
        puts("Creating block at (#{blockXposn}, #{blockYposn}, #{blockZposn})")
        # Create a block
        mc.setBlock(blockXposn, blockYposn, blockZposn, DIAMOND_BLOCK)
        # Use a sleep to make it more obvious is block by block
        sleep(0.5)
    end
end
