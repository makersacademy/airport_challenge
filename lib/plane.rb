require_relative 'airport'
require_relative 'weather'

class Plane
  attr_reader :status

 def land_at(airport)
    fail "Unable to land, the airport is full!" if airport.full
    @status = "landed"
  end

  def take_off
    fail "Your airplane is still in the air." if @status == 'flying'
    
    fail "The weather is too stormy to fly!" unless airport.weather_ok?

    @status = 'flying'
  end
end