class Plane

attr_reader :in_air

    def initialize
        @in_air = false
    end

    def land
        @in_air = false
    end

    def take_off
        @in_air = true
    end
end