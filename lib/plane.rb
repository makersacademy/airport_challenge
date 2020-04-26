class Plane
    attr_reader :flying

    def initialize
        @flying = true
    end 

    def take_off
        raise "Cannot take off, plane already flying" if flying
    end

    def land
        raise "Cannot land, plane already landed" if !flying
    end 

end 