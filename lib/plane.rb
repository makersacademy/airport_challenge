class Plane

    def landed?
      @landed
    end

    #private

    def land_plane
      @landed = true
    end

    def fly
      @landed = false
    end

end
