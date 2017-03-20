class Plane

    attr_reader :landed

    def initialize(landed = false)
      @landed = landed
    end

    def land_plane
      set_land
    end

    def plane_landed?
      landed
    end

    def take_off_plane
      set_fly
    end

    private

    attr_writer :landed

    def set_land
      landed = true
    end

    def set_fly
      landed = false
    end

end
