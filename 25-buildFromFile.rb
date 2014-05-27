# We have to import the minecraft api module to do anything in the minecraft world
require_relative 'mcpi/minecraft'
require_relative 'mcpi/block'

=begin
First thing you do is create a connection to minecraft
This is like dialling a phone.
It sets up a communication line between your script and the minecraft world
=end

# Create a connection to Minecraft
# Any communication with the world must use this object
mc = Minecraft.create()

# Check that have the appropriate number of command line arguments (one in this case)
# ARGV is a list of the command line arguments given
numOfArguments = ARGV.length
if (numOfArguments == 1)
    # get the name of the file to open
    filenameToOpen = ARGV[0]
    # puts to the ruby interpreter standard output (terminal probably)
    puts ("Opening " + filenameToOpen+'\n')

    """
    Open the file
    Read through the file line by line
    This uses a try catch statement when opening the file
    The code will only send to chat if the file is opened and read successfully
    If an error (Exception) occurs it is putsed out to the console
    """
    begin
        textFile = open(filenameToOpen, 'r')
        numOfLines = 0
        # go through the text file line by line
        for line in textFile
            numOfLines +=1
        end

        puts("there are #{numOfLines} lines in the textFile")
        block = AIR
        playerPos = mc.player.getTilePos()
        startX = playerPos.x - 16
        x = startX
        y = playerPos.y + 1 + numOfLines
        z = playerPos.z - 16

        currentLine = 1
        textFile.seek(0)
        for line in textFile
            puts ("building line #{currentLine} of #{numOfLines}")
            x = startX
            line.each_char { |character|
                x += 1
                puts("character is " + character)
                if ['1','2','3','4','5','6','7','8','9','0','a','b','c','d','e','f'].include?(character)
                    colour = character.to_i(16)
                    puts("colour = #{colour}")
                    if (0..15) === colour
                        block = WOOL.withData(colour)
                    else
                        block = WOOL
                    end
                else
                    block = AIR
                end
                puts("setting block #{block} at (#{x},#{y},#{z})")
                mc.setBlock(x, y, z, block)
            }
            y -= 1
            currentLine += 1
        end
    rescue
        puts("Failed to open, read or work with file")
        puts "Unexpected error:"
        raise
    ensure
        textFile.close()
    end
else

    puts("Expected only one filename as argument, but received #{numOfArguments}")
end
