class Airport

    def initialize(capacity)
        @capacity = capacity 
        @planes = []
    end
    
    
    def land(plane)
      raise 'Cannot land: Airport full' if full
      @planes << plane
    end
    
    def take_off(plane)
            
    end

    def full
       if @planes.length >= @capacity
        true
       else
        false
       end
    end
end