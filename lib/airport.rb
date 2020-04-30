class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

    def initialize(capacity=DEFAULT_CAPACITY)
      @capacity = capacity
      @planes = []
    end

    def land(plane)
      return "plane landed"
      fail 'Airport is full' if full?
      @planes << plane
    end

    def take_off
      return "plane no longer in the airport"
    end

private

def full?
  @planes.count >= capacity
end

end
