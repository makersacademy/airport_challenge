class Airport
    def initialize(capacity)
      @capacity = capacity
      @airplanes = []
    end    
  
    def land(airplane)
      raise 'Airport full: Cannot land' if full? 
      raise 'Stormy: Cannot land' if stormy? 
      @airplanes << airplane 
    end
  
    def take_off(airplane)
      raise 'Cannot take off: weather is stormy' if stormy? 
    end
  end
  
  private 
  
  def full?
    @airplanes.length >= @capacity 
  end  
  
  def stormy?
    rand(1..10) > 8
  end   