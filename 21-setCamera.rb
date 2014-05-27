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


minNumOfParams = 2
numOfParamsGiven = ARGV.length

if numOfParamsGiven >= minNumOfParams
    cameraMode = ARGV[0]

    if cameraMode.eql?("follow")
        mc.camera.setFollow(ARGV[1])
    elsif cameraMode.eql?("normal")
        mc.camera.setNormal(ARGV[1])
    elsif cameraMode.eql?("fixed")
        if numOfParamsGiven == 4
        #should verify arguments are integer coordinates
            mc.camera.setFixed()
            mc.camera.setPos(ARGV[1], \
                             ARGV[2], \
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
    puts("Require #{minNumOfParams}, got #{numOfParamsGiven}")
end
