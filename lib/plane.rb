class Plane 
    attr_reader :present 
    def initialize (present = true)
        @present = present
    end
    def land_plane

    end
    def take_off
        @present = false
    end
end