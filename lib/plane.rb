class Plane
    # initializing the Plane class
    def initialize
      @landed_planes
    end
    # method to land planes
    def land_plane
      @landed_planes = true
      "Instructing the plane to land"
    end
    # method to confirm landed plane
    def plane_landed?
      @landed_planes
    end

end



  # method to take off planes
  #def take_off_plane
  #  "Plane has taken off and is no longer in the airport"
  #end

  # method to confirm if the plane has taken off
