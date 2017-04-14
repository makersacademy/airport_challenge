require_relative 'airport'
class Plane

  attr_accessor :landed_at, :weather

  def takeoff
    fail "Already in flight" if @landed_at.nil?
    airport = @landed_at
    fail "Cannot takeoff, weather stormy" if airport.weather == "Stormy"
    puts "Taken off"
    @landed_at = nil
  end

  def land_at(airport)
    fail "Cannot land, weather stormy" if airport.weather == "Stormy"
    fail "Already landed at #{airport.name}" unless @landed_at.nil?
    @landed_at = airport
    puts "Landed"
  end

end
