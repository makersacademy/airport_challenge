require_relative 'plane'

class Airport

  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes= []
    @capacity = capacity

end

    def land(plane)
      raise 'Cannot land plane: Airport full' if full?
      @planes << plane
      raise 'Cannot land: weather is stormy' if stormy?
    end

    def take_off(plane)
      raise 'Cannot take off: weather is stormy' if stormy?

    end


private

def full?
  @planes.count >= @capacity
end

def stormy?
  rand(1..6) > 4
end
end
