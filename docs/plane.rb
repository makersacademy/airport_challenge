class Plane

    def initialize
      @landed_planes
    end

    def land_plane
      @landed_planes = true
      "Instructing the plane to land"
    end

    def plane_landed?
      @landed_planes
    end

    def take_off
      @planes_flown
      "Instructing the plane to take off"
    end


end
