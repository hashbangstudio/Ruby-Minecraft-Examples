require_relative 'vec3'

class BlockEvent
    """An Event related to blocks (e.g. placed, removed, hit)"""
    @@HIT = 0

    def initialize( type, x, y, z, face, entityId)
        @type = type
        @pos = Vec3.new(x, y, z)
        @face = face
        @entityId = entityId
    end

    def to_s()
        sType = {
            @@HIT => "BlockEvent.HIT"
        }.fetch(@type, "??? Unknown event type ???")

        return "BlockEvent(#{sType}, #{@pos.x}, #{@pos.y}, #{@pos.z}, #{@face}, #{@entityId})"
    end

    #static method
    def self.Hit(x, y, z, face, entityId)
        return BlockEvent.new(@@HIT, x, y, z, face, entityId)
    end
end
