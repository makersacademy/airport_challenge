require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 100
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  def plane_take_off
    fail 'Cannot currently take off' if empty? || stormy?
    planes.pop
  end
  def plane_land(plane)
    fail 'Plane cannot currently land at airport' if full? || stormy?
    planes << plane
  end
  private

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

  def stormy?
    weather = rand(10)
    weather < 2 ? true : false
  end
end
