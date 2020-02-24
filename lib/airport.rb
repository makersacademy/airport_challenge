class Airport

    def initialize(capacity)
       @capacity = capacity
       @planes = []
    end



    def land_plane(plane)
      raise "no planes allowed to land when airport full" if full?
      @planes << plane
    end

    def plane_take_off(plane)
        
    end

    def full?
        @planes.length >= @capacity
    end


end


