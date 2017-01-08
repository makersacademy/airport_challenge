require_relative 'plane'

class Airport


  def initialize(capacity)
    @capacity = capacity
    @planes= []
  end

    def land(plane)
      raise 'Cannot land plane: Airport full' if full?
      @planes << plane
    else
      raise 'Cannot land: weather is stormy' if stormy?
    end

    def take_off(plane)
      raise 'Cannot take off: weather is stormy' if stormy?

    end

private

def full?
  @planes.length >= @capacity
end

def stormy?
  rand(1..6) > 4
end

end
