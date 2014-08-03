class Vec3

    # create getter and setter for data
    attr_accessor :x,:y,:z

    # initialize class with vector
    def initialize(x=0, y=0, z=0)
        @x = x
        @y = y
        @z = z
    end

    def to_s()
        return "(#{@x},#{@y},#{@z})"
    end

    def clone()
        return Vec3.new(@x, @y, @z)
    end

    def coerce(lhs)
        [self, lhs]
    end

    def +(rhs)
        c = self.clone()
        c.x = c.x + rhs.x
        c.y = c.y + rhs.y
        c.z = c.z + rhs.z
        return c
    end

    def length()
        return self.lengthSqr ** 0.5
    end

    def lengthSqr()
        return (@x * @x) + (@y * @y)  + (@z * @z)
    end

    def *(rhs)
        c = self.clone()
        c.x = c.x * rhs
        c.y = c.y * rhs
        c.z = c.z * rhs
        return c
    end

    def -@
        return Vec3.new(-@x, -@y, -@z)
    end

    def -(rhs)
        return self.+(-rhs)
    end

    def <=>(rhs)
        dx = @x - rhs.x
        if dx != 0 then return dx end
        dy = @y - rhs.y
        if dy != 0 then return dy end
        dz = @z - rhs.z
        if dz != 0 then return dz end
        return 0
    end
end

