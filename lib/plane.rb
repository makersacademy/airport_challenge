class Plane
  attr_reader :location

  def initialize
    @location = :default_location
  end

  def arrive_at(airport)
    raise "Plane needs to take off from the ground before it arrive somewhere" if @location != :air
    raise "Plane already in the airport passed" if @location == airport.identifier
    @location = airport.identifier
  end

  def departure
    raise "Plane already in the air" if @location == :air
    @location = :air
    self
  end
end
