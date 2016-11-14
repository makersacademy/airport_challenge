require './lib/weather'
require './lib/plane'

class Airport

attr_reader :plane
attr_reader :planes
attr_reader :weather

def initialize
  @planes = Array.new
  @weather = Weather.new
end

  def land_plane(plane)
    @plane = plane
    fail "Plane cannot land in stormy weather" if @weather.stormy?
    fail "Plane cannot land if airport is full" if airport_full
    @planes << @plane
  end

  def take_off(plane)
    fail "Plane cannot takeoff in stormy weather" if @weather.stormy?
    @planes.pop
  end

  def number_of_planes
    @planes.length
  end

  def capacity
    5
  end

  def airport_full
    number_of_planes >= capacity
  end

end
