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
id = 0
# Create a wall using nested for loops
for row in 0...6
        # increase the height of the current row to be built
        blockYposn += 1
        blockXposn = firstColumnX
    for column in 0...10
        #increase the distance along the row that the block is placed at
        blockXposn += 1
        puts("Creating block with id = #{id} at (#{blockXposn}, #{blockYposn}, #{blockZposn})")
        # Create a block
        #mc.setBlock(blockXposn, blockYposn, blockZposn, Block.new(id))#Alternative method
        mc.setBlock(blockXposn, blockYposn, blockZposn, id)
        sleep(0.5)
        id += 1
    end
end
