require_relative 'airport'
require_relative 'weather'

class Plane

  attr_accessor :landed_at

  def land_at(airport)
    airport.land_plane(self)
    @landed_at = airport
    puts "Landed at #{airport.name}"
  end

  def takeoff
    fail "Already in flight" if landed_at.nil?
    @landed_at.takeoff_plane(self)
    puts "Taken off from #{@landed_at.name}"
    @landed_at = nil
  end

  def takeoff_to(airport)
    fail "Already in flight" if landed_at.nil?
    takeoff
    land_at(airport)
  end

end
