class Airport
    def initialize
      @gate = []
    end
  
    def land(plane)
      @gate << plane
    end
  
    def gate
      @gate
    end
  
    def take_off(plane)
      @gate.delete(plane)
    end
  end