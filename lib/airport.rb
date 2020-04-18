class Airport
    
    attr_reader :planes
    
    def initialize
      @planes = []
    end
     
    def is_full?
      true
    end

    def land(plane)
      fail "Landing not allowed" if @planes.count >= 10
      @planes << plane
    end
    
    def take_off(plane)
      @planes.pop
    end
    
end
