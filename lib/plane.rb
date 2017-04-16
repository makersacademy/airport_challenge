require_relative 'airport'

class Plane

  attr_accessor :landed_at, :weather

  def takeoff
    takeoff_check
    @landed_at.takeoff_plane(self)
    puts "Taken off from #{@landed_at.name}"
    @landed_at = nil
  end

  def land_at(airport)
    landing_check(airport)
    airport.land_plane(self)
    @landed_at = airport
    puts "Landed at #{airport.name}"
  end

  private

  def takeoff_check
    fail "Already in flight" if @landed_at.nil?
    fail "Cannot takeoff, weather at #{@landed_at.name} stormy" if @landed_at.weather == "Stormy"
  end

  def landing_check(airport)
    fail "Cannot land, weather at #{airport.name} stormy" if airport.weather == "Stormy"
    fail "Already landed at #{airport.name}" unless @landed_at.nil?
    fail "Cannot land, airport full" if airport.full?
  end

end
