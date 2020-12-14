class Airport
    def initialize
      @gate = []
    end
  
    def land(plane)
      fail 'cannot land, airport is full' if airport_full?
      @gate << plane
    end
  
    def gate
      @gate
    end
  
    def take_off(plane)
      @gate.delete(plane)
    end

    def airport_full?
      @gate.length == 1
    end
  end