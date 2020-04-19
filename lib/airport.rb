class Airport
    
    DEFAULT_CAPACITY = 10
    attr_reader :planes, :capacity, :weather
    
    def initialize(capacity = DEFAULT_CAPACITY)
      @planes = []
      @capacity = capacity
      @weather = Weather.new
    end
     
    def land(plane)
      fail "Landing not allowed in stormy weather" if is_stormy?
      fail "Landing not allowed, airport full" if is_full?
      fail "Plane is already at the airport" if @planes.include?(plane)
      @planes << plane
    end
    
    def take_off(plane)
      fail "Taking off not allowed in stormy weather" if is_stormy?
      fail "Plane is already on route" unless @planes.include?(plane)
      @planes.pop
    end
    
    private
    
    def is_stormy? 
      @weather.is_stormy?
    end
    
    def is_full?
      @planes.count >= @capacity
    end
    
end
