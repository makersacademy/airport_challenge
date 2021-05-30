require_relative 'airport'
require_relative 'weather'

class Plane
  attr_reader :status, :sky

 def land_at(airport)
    fail "Unable to land, the airport is full!" if airport.full
    @status = "landed"
  end

  def take_off
    fail "The weather is too stormy to fly!" if @weather.ok? == 'stormy'
    if @status == 'landed'
      @status = "flying"
    else
      fail "Your airplane is still in the air."
    end
  end
end