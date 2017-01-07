class Airport
    def initialize
      @planes = []
    end

    def recieve_plane(plane)
      if @planes.length == 0
        @planes.push(plane)
        return @planes[0]
      else
        fail 'airport full'
      end
    end

    def takeoff_plane(plane)
      @planes.pop
      return @planes
    end


end
