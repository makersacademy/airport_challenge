require './lib/weather'

class Airport

attr_reader :plane
attr_reader :planes
attr_reader :weather

def initialize
  @plane = Plane.new
  @planes = Array.new
  @weather = Weather.new
end

  def land_plane(plane)
    @plane = plane
    fail "Plane cannot land in stormy weather" if @weather.stormy?
    @planes << @plane
  end

  def take_off(plane)
    fail "Plane cannot takeoff in stormy weather" if @weather.stormy?
    @planes.pop
  end

  def number_of_planes
    @planes.length
  end

end
