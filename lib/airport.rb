require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full, no landing availability' if full?
    fail 'Error, plane already at the airport' if @planes.include?(plane)
    @planes << plane
  end

  def take_off
    fail 'Cannot take off, airport empty' if empty?
    fail 'Stormy weather, no takes off' if stormy?
    puts print_take_off
    @planes.pop
  end

  def print_take_off
    'A plane has taken off'
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.count <= 0
  end

  def stormy?
    rand(1..8) > 6
  end
end
