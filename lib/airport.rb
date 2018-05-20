require_relative 'plane'
# require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 2
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full, no landing availability' if @planes.count >= @capacity
    @planes << plane
  end

  def take_off
    # fail 'Stormy weather, no takes off' if @weather_conditions
    puts print_take_off
    @planes.pop
  end

  def print_take_off
    'A plane has taken off'
  end
end
