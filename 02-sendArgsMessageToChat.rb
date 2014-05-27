# We have to import the minecraft api module to do anything in the minecraft world
require_relative 'mcpi/minecraft'

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
    # create the output message as a string
    message = ARGV[0]
    # puts to the ruby interpreter standard output (terminal probably)
    puts(message)
    # send message to the minecraft chat
    mc.postToChat(message)
else
    puts("Expected one string as argument for script, but received #{(numOfArguments)}")
end
