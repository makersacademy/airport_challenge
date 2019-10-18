require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 5
  attr_accessor :land
  attr_accessor :take_off
  attr_accessor :weather
  attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end
end

def land(plane)
  raise 'Airport is full' if full?
  @plane << plane
end

def take_off

end

def weather
  weather = ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny",
              "sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "sunny",
               "stormy"]
  weather.sample
end
