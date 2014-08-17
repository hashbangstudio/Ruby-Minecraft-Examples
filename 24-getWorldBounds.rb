#!/usr/bin/env ruby

# We have to import the minecraft api module to do anything in the minecraft world
require_relative 'mcpi/minecraft'
require_relative 'mcpi/block'

def findWorldXLimits(mc)
    minX = 2560
    maxX = -2560
    x = 0
    z = 0
    while (true)

        height = mc.getHeight(x,z)
        # Get the type of block for the highest point in world at horiz player posn
        blockId = mc.getBlock(x, height , z)
        if(blockId == BEDROCK_INVISIBLE.id)
            #range ends at one after last valid value so just use as is
            maxX = x
            break
        end
        # move to next block
        x += 1
    end

    x = 0
    while (true)
        height = mc.getHeight(x,z)
        # Get the type of block for the highest point in world at horiz player posn
        blockId = mc.getBlock(x, height , z)

        if(blockId == BEDROCK_INVISIBLE.id)
            # range starts at first valid value so add one
            minX =  x + 1
            break
        end
        # move to next block
        x -=1
    end

    return [minX, maxX]
end

def findWorldZLimits(mc)
    minZ = 2560
    maxZ = -2560
    x = 0
    z = 0
    while(true)
        height = mc.getHeight(x,z)
        # Get the type of block for the highest point in world at horiz player posn
        blockId = mc.getBlock(x, height , z)

        if (blockId == BEDROCK_INVISIBLE.id)
            #range ends at one after last valid value so just use as is
            maxZ = z
            break
        end

        z += 1
    end
    z = 0
    while(true)
        height = mc.getHeight(x,z)
        # Get the type of block for the highest point in world at horiz player posn
        blockId = mc.getBlock(x, height , z)

        if (blockId == BEDROCK_INVISIBLE.id)
            # range starts at first valid value so add one
            minZ = z + 1
            break
        end

        z -= 1
    end
    return [minZ,maxZ]
end





=begin
First thing you do is create a connection to minecraft
This is like dialling a phone.
It sets up a communication line between your script and the minecraft world
=end

# Create a connection to Minecraft
# Any communication with the world must use this object
mc = Minecraft.create()

xbounds = findWorldXLimits(mc)
minX = xbounds[0]
maxX = xbounds[1]
puts("xMin,xMax =  #{minX}, #{maxX}")

zbounds = findWorldZLimits(mc)
minZ = zbounds[0]
maxZ = zbounds[1]

puts("zMin,zMax =  #{minZ}, #{maxZ}")

