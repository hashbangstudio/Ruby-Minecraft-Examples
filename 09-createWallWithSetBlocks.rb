#!/usr/bin/env ruby

#import the needed modules
require_relative 'mcpi/minecraft'
require_relative 'mcpi/block'

# Create a connection to the Minecraft game
mc = Minecraft.create()

# Get the player position
playerPosition = mc.player.getTilePos()

wallStartXposn = playerPosition.x + 6
wallStartYposn = playerPosition.y + 1
wallZposn = playerPosition.z + 6

wallEndXposn = wallStartXposn + 10
wallEndYposn = wallStartYposn + 6

# Create a wall

mc.setBlocks(wallStartXposn , wallStartYposn, wallZposn,
             wallEndXposn,    wallEndYposn,   wallZposn,
             DIAMOND_BLOCK)
