#!/usr/bin/env ruby

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
    # get the name of the file to open
    filenameToOpen = ARGV[0]
    # puts to the ruby interpreter standard output (terminal probably)
    puts ("Opening " + filenameToOpen)

    """
    Open the file
    Read through the file line by line and post it to the chat
    This uses a try catch statement when opening the file
    The code will only send to chat if the file is opened and read successfully
    If an error (Exception) occurs it is putsed out to the console
    """
    begin
        # this opens up the text file in read only ('r') mode
        textFile = open(filenameToOpen, 'r') if File::exists?(filenameToOpen)
        # Each line in the text file must be sent as a separate message

        # go through the text file line by line
        textFile.each{ |line|
            # send message to the minecraft chat
            puts(line)
            mc.postToChat(line)
        }
    rescue
        puts("Failed to open file")
        puts "Unexpected error:"
    ensure
        if not textFile.closed?
            textFile.close
        end
    end

else

    puts("Expected only one filename as argument, but received #{numOfArguments}")
end
