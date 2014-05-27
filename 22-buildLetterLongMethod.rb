# import required modules
require_relative 'mcpi/minecraft'
require_relative 'mcpi/block'


# A long winded way of creating a letter a, creating an alphabet would take a lot of space and time
def createLowerCaseLetterA(minecraftConnection, lowerLeftX, lowerLeftY, lowerLeftZ, blockType, blockData)
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY, lowerLeftZ+1,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY, lowerLeftZ+2,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY, lowerLeftZ+3,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY, lowerLeftZ+4,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+1, lowerLeftZ+1,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+1, lowerLeftZ+4,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+2, lowerLeftZ+1,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+2, lowerLeftZ+4,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+3, lowerLeftZ+1,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+3, lowerLeftZ+2,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+3, lowerLeftZ+3,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+3, lowerLeftZ+4,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+4, lowerLeftZ+4,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+5, lowerLeftZ+1,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+5, lowerLeftZ+4,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+6, lowerLeftZ+1,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+6, lowerLeftZ+2,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+6, lowerLeftZ+3,blockType.withData(blockData))
    minecraftConnection.setBlock(lowerLeftX+1, lowerLeftY+6, lowerLeftZ+4,blockType.withData(blockData))
end


# connect to minecraft world
mc = Minecraft.create()
#get player position
pos = mc.player.getTilePos()
#print message to standard output and chat
puts(" you are at (#{pos.x},#{pos.y},#{pos.z})")
mc.postToChat(" you are at (#{pos.x},#{pos.y},#{pos.z})")
#Create letter a next to the player
createLowerCaseLetterA(mc, pos.x, pos.y, pos.z, WOOL, 3)

