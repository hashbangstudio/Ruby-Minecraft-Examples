#!/usr/bin/env ruby

#import the needed modules fo communication with minecraft world
require_relative 'mcpi/minecraft'
require_relative 'mcpi/block'


# Create a connection to the Minecraft game
mc = Minecraft.create()

# Get the player position
playerPosition = mc.player.getTilePos()

# define the position of the bottom left block of the wall
blockXposn = playerPosition.x + 1
blockYposn = playerPosition.y + 1
blockZposn = playerPosition.z + 1

puts("Creating block at (#{blockXposn}, #{blockYposn}, #{blockZposn})")
# Create a block
mc.setBlock(blockXposn, blockYposn, blockZposn, DIAMOND_BLOCK)
