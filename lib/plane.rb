class Plane
    attr_reader :airport

    def initialize
        @flying = true
    end

    def land airport
        @airport = airport
        @flying = false
    end

    def depart
        @airport = nil
        @flying = true
    end
end
