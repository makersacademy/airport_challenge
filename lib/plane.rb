require './lib/airport.rb'
class Plane
  def initialize
    @in_the_air = false
  end

  def airport?(airport)
    airport.class == Airport
  end

  def land(airport)
    raise 'argument is not an airport object' unless airport?(airport)
    @in_the_air = false
  end

  def take_off(airport)
    @in_the_air = true if airport?(airport)
  end

  def in_the_air?
    @in_the_air
  end
end
