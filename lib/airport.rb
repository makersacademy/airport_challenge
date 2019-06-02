require_relative './plane'
require_relative './weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :plane, :weather, :stormy

  def initialize
    @planes = []
    @weather = weather
    @capacity = DEFAULT_CAPACITY
  end

  def land_plane(plane)
    fail "Stormy weather prevents landing" if stormy

    raise "Airport is full" if full?

    @planes << plane
  end

  def take_off(plane)
    fail "Stormy weather prevents takeoff" if stormy

    @planes.pop
  end

private
  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

end
