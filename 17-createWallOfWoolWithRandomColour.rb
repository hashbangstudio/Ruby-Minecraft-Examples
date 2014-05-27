#import the needed modules for communication with minecraft world
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
        # increase the height of th current row to be built
        blockYposn += 1
        blockXposn = firstColumnX
    for column in 0...10
        #increase the distance along the row that the block is placed at
        blockXposn += 1
        #Generate a random number within the allowed range of colours (0 to 15 inclusive)
        randomNumber = rand(16)
        puts("random number to be used = #{randomNumber}")
        puts("Creating block at (#{blockXposn}, #{blockYposn}, #{blockZposn})")
        # Create a block
        mc.setBlock(blockXposn, blockYposn, blockZposn, WOOL.withData(randomNumber))
        sleep(0.5)
    end
end
