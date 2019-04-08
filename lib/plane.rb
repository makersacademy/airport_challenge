class Plane
  attr_reader :location

  AIR = :air

  def initialize
    @location = :default_location
  end

  def land_at(airport_identifier)
    fail "Plane needs to take_off before it arrives somewhere" if @location != AIR
    @location = airport_identifier
  end

  def take_off
    fail "Plane already in the air" if @location == AIR
    @location = AIR
  end
end