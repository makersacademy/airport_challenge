class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :capacity

    def initialize(capacity=DEFAULT_CAPACITY)
      @capacity = capacity
      @planes = []
    end

    def land(plane)
      return "plane landed"
      raise 'Airport is full' if @planes.length >= capacity
      @planes << plane
    end

    def error
      raise 'Airport is full'
    end 

    def take_off
      return "plane no longer in the airport"
    end

end
