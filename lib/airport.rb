require 'plane'

class Airport 
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = current_weather
    @capacity = capacity
    @planes = []
  end

  def land_plane(plane)
    fail "We can't land in stormy weather!" if weather == "stormy"
    fail "Airport is full!" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "We can't take off in stormy weather!" if weather == "stormy"
    fail "That plane has left the airport!" if empty?
    @planes.pop
  end

  def current_weather
    @weather = Random.rand(20)
    @weather > 18 ? @weather = 'stormy' : @weather = 'sunny'
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= capacity
  end
end
