require_relative 'plane'
# include Weather

class Airport
  DEFAULT_CAPACITY = 2
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full, no landing availability' if @planes.count >= @capacity
    fail 'Error, plane already at the airport' if @planes.include?(plane)
    @planes << plane
  end

  def take_off
    fail 'No planes at the airport' if @planes.count <= 0
    puts print_take_off
    @planes.pop
  end

  def print_take_off
    'A plane has taken off'
  end
end
