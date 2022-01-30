require 'plane'

class Airport 
  attr_reader :planes
  DEFAULT_CAPACITY = 20

  def initialize
    @planes = []
  end

  def land_plane(plane)
    fail "Airport is full!" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "That plane has left the airport!" if empty?
    @planes.pop
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def weather
  end
end
