require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Cannot land, the airport is full" if airport_full?
    fail 'Weather too stormy to land' if too_stormy?
    plane.land
    planes << plane
  end

  def take_off(plane)
    fail 'Weather too stormy to take off' if too_stormy?
    fail 'Plane is not at this airport' if plane_not_present?(plane)
    plane.take_off
    planes.delete(plane)
  end

  private

  attr_reader :weather

  def plane_not_present?(plane)
    !planes.include?(plane)
  end

  def too_stormy?
    weather.stormy?
  end

  def airport_full?
    !planes.empty?
  end
end
