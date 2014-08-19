#!/usr/bin/env ruby

# We have to import the minecraft api module to do anything in the minecraft world
require_relative 'mcpi/minecraft'


def printAvailableCameraModes()
    puts("Available camera modes are:")
    puts("normal, follow, fixed")
end

=begin
First thing you do is create a connection to minecraft
This is like dialling a phone.
It sets up a communication line between your script and the minecraft world
=end

# Create a connection to Minecraft
# Any communication with the world must use this object
mc = Minecraft.create()


minNumOfParams = 1
numOfParamsGiven = ARGV.length

if numOfParamsGiven >= minNumOfParams
    cameraMode = ARGV[0]

    case cameraMode
        when "follow" 
            if numOfParamsGiven == 1
               mc.camera.setFollow()
            elsif numOfParamsGiven == 2
               mc.camera.setFollow(ARGV[1])
            else
               puts("Expected 1 or 2 parameters but got #{numOfParamsGiven}")
            end
        when "normal"
            if numOfParamsGiven == 1
               mc.camera.setNormal()
            elsif numOfParamsGiven == 2
               mc.camera.setNormal(ARGV[1])
            else
               puts("Expected 1 or 2 parameters but got #{numOfParamsGiven}")
            end
        when "fixed"
            if numOfParamsGiven == 4
            #should verify arguments are integer coordinates
                mc.camera.setFixed()
                mc.camera.setPos(ARGV[1], 
                                 ARGV[2], 
                                 ARGV[3])
            else
                puts("insufficient parameters given")
                puts("Require 4 but got #{numOfParamsGiven}")
            end
        else
            puts("unknown camera mode parameter given #{ ARGV[0]}")
            printAvailableCameraModes()
    end
else
    puts("insufficient parameters given")
    puts("Require minimum of #{minNumOfParams}, got #{numOfParamsGiven}")
end
