class Airport
  attr_accessor :gate
  DEFAULT_CAPACITY = 1
    def initialize(capacity=DEFAULT_CAPACITY)
      @gate = []
      @capacity = capacity
    end
  
    def land(plane)
      fail 'cannot land, airport is full' if airport_full?
      @gate << plane
    end

    def take_off(plane)
      @gate.delete(plane)
    end

    def airport_full?
      @gate.length == @capacity
    end
  end