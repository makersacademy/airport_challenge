require './lib/airport.rb'

class Plane
  def land(airport)
    true if airport.class == Airport
  end
end
