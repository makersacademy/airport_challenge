class Plane

    attr_reader :landed

    def initialize(landed = false)
      @landed = landed
    end

    def land_plane
      @landed = true
    end

    def plane_landed?
      @landed
    end

    def take_off_plane
      @landed = false
    end

end
