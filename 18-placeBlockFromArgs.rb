#!/usr/bin/env ruby

#import the needed modules
require_relative 'mcpi/minecraft'
require_relative 'mcpi/block'

# Create a connection to the Minecraft game
mc = Minecraft.create()

# Get the player position
playerPosition = mc.player.getTilePos()

# Set coordinates (position) for the block that is slightly away from the player
# Note y is the vertical coordinate, x and z the horizontal
blockXposn = playerPosition.x + 1
blockZposn = playerPosition.z + 1
blockYposn = mc.getHeight(blockXposn, blockZposn)

blockToPlace = AIR
numOfArgs = ARGV.length
if numOfArgs  == 1 or numOfArgs == 2
    blockArgs = ARGV[0].split(',')
    blockId = blockArgs[0].to_i
    blockData = blockArgs[1].to_i

    blockToPlace = Block.new(blockId,blockData)
    if numOfArgs == 2

        coords = ARGV[1].split(',')
        puts ("using coords = #{coords}")
        blockXposn = coords[0].to_i
        blockYposn = coords[1].to_i
        blockZposn = coords[2].to_i
    end

else
    puts("To place block next to player :")
    puts("Usage : ruby script.rb blockId,blockData")
    puts("To place block at a specific coordinate")
    puts("Usage : ruby script.rb blockId,blockData x,y,z")
    puts("Expected 1 or 2 aguments but received #{numOfArgs}")
    exit()
end

puts blockToPlace
puts "Creating block at (#{blockXposn},#{ blockYposn}, #{blockZposn})"

mc.setBlock(blockXposn, blockYposn, blockZposn, blockToPlace)

