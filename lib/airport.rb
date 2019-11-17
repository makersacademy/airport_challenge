class Airport
    def initialize(capacity)
      @capacity = capacity 
      @planes = []
    end
    
    def land(plane)
      raise 'Cannot land: Airport full' if full?
      raise 'Cannot land plane: weather is stormy' if stormy?
      @planes << plane
    end
    
    def take_off(plane)       
    end
    
    private
    
    def full?
      if @planes.length >= @capacity
        true
      else
        false
      end
    end
    
    def stormy?
      rand(1..6) > 4
    end
  end