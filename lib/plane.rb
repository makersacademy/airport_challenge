class Plane

    def landed?
      @landed
    end

    def land_plane
      @landed = true
    end

    def fly
      @landed = false
    end

end
