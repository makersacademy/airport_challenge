class Airport
    attr_accessor :planes
    def initialize
        @planes = []
    end

    def land_plane(plane)
        @planes << plane
    end

end