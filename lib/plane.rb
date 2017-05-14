# Custom error for Plane Class
class PlaneError < StandardError; end

class Plane
  attr_reader :location

  def initialize
    @location = :default_location
  end

  def arrive_at(airport)
    raise PlaneError, "Plane needs to departure before it arrives somewhere" if @location != :air
    @location = airport.identifier
  end

  def departure
    raise PlaneError, "Plane already in the air" if @location == :air
    @location = :air
    self
  end
end
