class Airport
    
    attr_reader :plane
     
    def is_full?
    end

    def land(plane)
      @plane = plane
    end
    
    def take_off(plane)
      @plane = plane
    end
    
end
