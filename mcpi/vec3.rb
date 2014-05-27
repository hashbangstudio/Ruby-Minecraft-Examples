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

    def ==(rhs)
        dx = @x - rhs.x
        if dx != 0 then return dx end
        dy = @y - rhs.y
        if dy != 0 then return dy end
        dz = @z - rhs.z
        if dz != 0 then return dz end
        return 0
    end
end

=begin
    def __iter__(self):
        return iter((@x, @y, @z))

    def _map(self, func):
        @x = func(@x)
        @y = func(@y)
        @z = func(@z)



    def iround(self): self._map(lambda v:int(v+0.5))
    def ifloor(self): self._map(int)

    def rotateLeft(self):  @x, @z = @z, -@x
    def rotateRight(self): @x, @z = -@z, @x


def testVec3():
    # Note: It's not testing everything

    # 1.1 Test initialization
    it = Vec3(1, -2, 3)
    assert it.x == 1
    assert it.y == -2
    assert it.z == 3

    assert it.x != -1
    assert it.y != +2
    assert it.z != -3

    # 2.1 Test cloning and equality
    clone = it.clone()
    assert it == clone
    it.x += 1
    assert it != clone

    # 3.1 Arithmetic
    a = Vec3(10, -3, 4)
    b = Vec3(-7, 1, 2)
    c = a + b
    assert c - a == b
    assert c - b == a
    assert a + a == a * 2

    assert a - a == Vec3(0,0,0)
    assert a + (-a) == Vec3(0,0,0)

    # Test repr
    e = eval(repr(it))
    assert e == it


    testVec3()
=end
