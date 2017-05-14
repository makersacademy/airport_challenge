# Custom error for Plane Class
class PlaneError < StandardError; end

class Plane
  attr_reader :location

  AIR_LOCATION = :air

  def initialize
    @location = :default_location
  end

  def land_at(airport_identifier)
    raise PlaneError, "Plane needs to take_off before it arrives somewhere" if @location != AIR_LOCATION
    @location = airport_identifier
  end

  def take_off
    raise PlaneError, "Plane already in the air" if @location == AIR_LOCATION
    @location = AIR_LOCATION
  end
end
