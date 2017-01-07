class Airport
    def initialize
      @planes = []
    end

    def recieve_plane(plane)
      @planes.push(plane)
      return @planes[0]
    end

    def takeoff_plane(plane)
      @planes.pop
      return @planes
    end


end
