require './lib/airport.rb'
class Plane
  def initialize
    @in_the_air = false
  end

  def land(airport)
    true if airport.class == Airport
  end

  def take_off(airport)
    @in_the_air = true if airport.class == Airport
  end
  
  def in_the_air?
    @in_the_air
  end
end
