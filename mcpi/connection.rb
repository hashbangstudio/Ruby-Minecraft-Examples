require 'socket'
require_relative 'util'

class Connection

    @@RequestFailed = "Fail"

    def initialize(address, port)
        #puts address
        #puts port
        @socket = TCPSocket.new(address , port)
        @lastSent = ""
    end

    def drain()
        #Drains the socket of incoming data
        while true do
            readable, writeable, errors = IO.select([@socket], [], [], 0.0)
            if not readable
                break
            end
            data = @socket.recv(1500).strip()
            e =  "Drained Data: #{data}\n"
            e += "Last Message: #{@lastSent}"
            STDERR.puts e
       end
       return nil
    end

    def send(func, *data)
        #Sends data. Note that a trailing newline '\n' is added here
        #puts "func",func
        #puts "data:", data
        flattenedData =  flatten_parameters_to_string(data)
        s = "#{func}(#{flattenedData})"
        #puts "s",s
        drain()
        @lastSent = s
        @socket.write("#{s}\n")
        return nil
    end

    def receive()
        #Receives data. Note that the trailing newline '\n' is trimmed
        s = @socket.readline.rstrip()
        if s.eql?(@@RequestFailed)
            STDERR.puts("#{@lastSent} failed")
            raise StandardError, "#{@lastSent} failed"
        end
        return s
    end

    def sendReceive(*data)
        #Sends and receive data
        #puts "data To send ", data
        send(*data)
        return receive()
    end

    def close
        @socket.close
        return nil
    end
 end
