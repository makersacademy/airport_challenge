require_relative './airports.rb'

class Plane
  def initialize
    @landed = false
  end

  def check_landing_issues(airport)
    raise 'This plane is already landed' if @landed
    raise 'Airport at capacity' if airport.at_capacity?
    raise 'Too stormy to land' if airport.stormy?
  end

  def land_at(airport)
    check_landing_issues(airport)
    airport.planes << self
    @landed = true
  end

  def check_take_off_issues(airport)
    raise 'The plane is not landed here' unless airport.planes.include?(self)
    raise 'Too stormy to take off' if airport.stormy?
  end

  def take_off_from(airport)
    check_take_off_issues(airport)
    airport.planes.delete(self)
    @landed = false
  end
end
