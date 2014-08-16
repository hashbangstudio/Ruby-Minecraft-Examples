#import the needed modules for communication with minecraft world
require_relative 'mcpi/minecraft'
# import needed block defintiions
require_relative 'mcpi/block'

def sendToChatAndConsole(minecraft, message)

    # print to the ruby interpreter standard output (terminal probably)
    puts(message)
    # send message to the minecraft chat
    minecraft.postToChat(message)
    return null
end

#    First thing you do is create a connection to minecraft
#    This is like dialling a phone.
#    It sets up a communication line between your script and the minecraft world

# Create a connection to Minecraft
# Any communication with the world must use this object
mc = Minecraft.create()

sendToChatAndConsole(mc, "Saving Checkpoint")
#Save a checkpoint for the world state
mc.saveCheckpoint()

#wait for 2 seconds 
sleep(2)

# Get the player position
playerPosition = mc.player.getTilePos()

wallStartXposn = playerPosition.x + 6
wallStartYposn = playerPosition.y + 1
wallZposn      = playerPosition.z + 6

wallEndXposn = wallStartXposn + 10
wallEndYposn = wallStartYposn + 6

# Create a wall
mc.setBlocks(wallStartXposn , wallStartYposn, wallZposn,
               wallEndXposn,    wallEndYposn,   wallZposn,
               DIAMOND_BLOCK)

#wait for 4 seconds 
sleep(4)

sendToChatAndConsole(mc, "Restoring Checkpoint")
# Set the world back to the state it was in at the last saved checkpoint
mc.restoreCheckpoint()

sendToChatAndConsole(mc, "Making World unbreakable")
mc.setting('world_immutable', 1)
#wait for 8 seconds 
sleep(8)
sendToChatAndConsole(mc, "Making World breakable")
mc.setting('world_immutable', 0)
#wait for 4 seconds 
sleep(4)
#Follow the player
sendToChatAndConsole(mc, "Set Camera to follow the player")
mc.camera.setFollow(1)
#wait for 4 seconds 
sleep(4)
sendToChatAndConsole(mc, "Making nametags visible")
mc.setting('nametags_visible', 1)
#wait for 6 seconds 
sleep(6)
sendToChatAndConsole(mc, "Making nametags invisible")
mc.setting('nametags_visible', 0)
#wait for 4 seconds 
sleep(4)
sendToChatAndConsole(mc, "Set Camera to normal player first person")
mc.camera.setNormal(1)


