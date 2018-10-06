require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hangar, :weather

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    raise("Plane has already landed") if @hangar.include?(plane)
    raise("Cannot land in stormy weather") if @weather.current == "Stormy"
    @hangar << plane
    "Plane has landed"
  end

  def takeoff(plane)
    raise("Plane is not at airport") unless @hangar.include?(plane)
    raise("Cannot takeoff in stormy weather") if @weather.current == "Stormy"
    @hangar.delete(plane)
    "Plane has landed"

  end
end
