require_relative 'connection'
require_relative 'vec3'
require_relative 'event'
require_relative 'block'
require_relative 'util'


def getNumFromStatusBool(state)
    if (state == 1 || state.to_s.downcase == 'true' || state == true)
        return 1;    
    else
        return 0;
    end

end

class CmdPositioner
    #Methods for setting and getting positions
    def initialize(connection, packagePrefix)
        @conn = connection
        @pkg = packagePrefix
    end

    def getPos(id)
        #Get entity position (entityIdint) => Vec3
        s = @conn.sendReceive(@pkg + ".getPos", id)
        return Vec3.new(*s.split(',').map{|element| element.to_f})
    end

    def setPos(id, *args)
        #Set entity position (entityIdint, x,y,z)
        @conn.send(@pkg + ".setPos", id, args)
        return nil
    end

    def getTilePos(id)
        #id is an array
        #Get entity tile position (entityIdint) => Vec3
        #puts id.to_s
        s = @conn.sendReceive(@pkg + ".getTile", id)
        return Vec3.new(*s.split(',').map{|element| element.to_i})
    end

    def setTilePos(id, *args)
        #Set entity tile position (entityIdint) => Vec3
        @conn.send(@pkg + ".setTile", id, args.map{|section| section.map{|num| num.to_i}})
        return nil
    end

    def setting( setting, status)
        #Set a player setting (setting, status). keys autojump
        status = getNumFromStatusBool(status)
        @conn.send(@pkg + ".setting", setting,  status)
        return nil
    end
end

class CmdEntity < CmdPositioner
    #Methods for entities
    def initialize(connection)
        super(connection, "entity")
    end
end

class CmdPlayer < CmdPositioner
    #Methods for the host (Raspberry Pi) player
    def initialize(connection)
        super(connection, "player")
        @conn = connection
    end

    def getPos()
        return super([])
    end

    def setPos(*args)
        return super([], args)
    end

    def getTilePos()
        return super([])
    end

    def setTilePos(*args)
        return super([], args)
    end
end

class CmdCamera
    def initialize(connection)
        @conn = connection
    end

    def setNormal( *args)
        #Set camera mode to normal Minecraft view ([entityId])
        @conn.send("camera.mode.setNormal", args)
        return nil
    end

    def setFixed()
        #Set camera mode to fixed view
        @conn.send("camera.mode.setFixed")
        return nil
    end

    def setFollow( *args)
        #Set camera mode to follow an entity ([entityId])
        @conn.send("camera.mode.setFollow", args)
        return nil
    end

    def setPos( *args)
        #Set camera entity position (x,y,z)
        @conn.send("camera.setPos", args)
        return nil
    end
end

class CmdEvents
    #Events
    def initialize( connection)
        @conn = connection
    end

    def clearAll()
        #Clear all old events
        @conn.send("events.clear")
        return nil
    end

    def pollBlockHits()
        #Only triggered by sword => [BlockEvent]
        s = @conn.sendReceive("events.block.hits")
        events = s.split("|")
        return events.map{|element| BlockEvent.Hit(*element.split(",").map{|num| num.to_i})}
    end
end

class Minecraft

    attr_reader :player, :events, :camera, :entity
    #The main class to interact with a running instance of Minecraft Pi.
    def initialize(connection)
        @conn = connection

        @camera = CmdCamera.new(connection)
        @entity = CmdEntity.new(connection)
        @player = CmdPlayer.new(connection)
        @events = CmdEvents.new(connection)
    end

    def getBlock( *args)
        #Get block (x,y,z) => idint
        return @conn.sendReceive("world.getBlock", args.map{|num| num.to_i}).to_i
    end

    def getBlockWithData( *args)
        #Get block with data (x,y,z) => Block
        ans = @conn.sendReceive("world.getBlockWithData", args.map{|num| num.to_i})
        return Block.new(*ans.split(",").map{|num| num.to_i})
    end

    #doesn't work
    def getBlocks( *args)
        #Get a cuboid of blocks (x0,y0,z0,x1,y1,z1) => [idint]
        return @conn.sendReceive("world.getBlocks", args.map{|num| num.to_i})
    end

    def setBlock( *args)
        #Set block (x,y,z,id,[data])
        @conn.send("world.setBlock", args)
        return nil
    end

    def setBlocks( *args)
        #Set a cuboid of blocks (x0,y0,z0,x1,y1,z1,id,[data])
        @conn.send("world.setBlocks", args)
        return nil
    end

    def getHeight( *args)
        #Get the height of the world (x,z) => int
        val = @conn.sendReceive("world.getHeight", args.map{|num| num.to_i}).to_i
        return val
    end

    def getPlayerEntityIds()
        #Get the entity ids of the connected players => [idint]
        ids = @conn.sendReceive("world.getPlayerIds")
        return ids.split("|").map{|num| num.to_i}
    end

    def saveCheckpoint()
        #Save a checkpoint that can be used for restoring the world
        @conn.send("world.checkpoint.save")
        return nil
    end

    def restoreCheckpoint()
        #Restore the world state to the checkpoint
        @conn.send("world.checkpoint.restore")
        return nil
    end

    def postToChat( msg)
        #Post a message to the game chat
        @conn.send("chat.post", msg)
        return nil
    end

    def setting(setting, status)
        #Set a world setting (setting, status). keys world_immutable, nametags_visible
        status = getNumFromStatusBool(status)
        @conn.send("world.setting", setting, status)
        return nil
    end

    #static class method
    def self.create(address="127.0.0.1", port=4711)
        #puts address
        #puts port
        conn = Connection.new(address, port)
        #puts conn
        return Minecraft.new(conn)
    end
end
