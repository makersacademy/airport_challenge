class Plane

    attr_reader :landed_planes

    def initialize(landed_planes = false)
      @landed_planes = landed_planes
    end

    def land_plane
      @landed_planes = true
    end

    def plane_landed?
      @landed_planes
    end

    def take_off_plane
      @landed_planes = false
    end

end
