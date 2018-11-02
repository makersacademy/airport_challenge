require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :hangar
  attr_accessor :weather

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def takeoff(plane)
    fail 'Plane not at this airport' unless @hangar.include?(plane)
    plane.landed = false
    @hangar.delete(plane)
  end

end
