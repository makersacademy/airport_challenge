class DestAirport
    def initialize
      @planes = []
    end

    def recieve_plane(plane)
      @planes.push(plane)
      return @planes[0]
    end




end
