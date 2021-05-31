require_relative 'airport'

class Plane
  attr_reader :status, :ok_to_fly

 def land_at(airport)
    @ok_to_fly = airport.weather_ok?
    fail "Unable to land, the airport is full!" if airport.full
  
    @status = "landed"
  end

  def take_off
    if @status != 'landed' && @ok_to_fly == true
      fail "Your airplane is still in the air." 
    elsif @status == 'landed' && @ok_to_fly == false
      fail "The weather is too stormy to fly!" 
    else
      @status = 'flying'
    end
  end
end