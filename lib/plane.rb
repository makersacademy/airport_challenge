require_relative 'airport'

class Plane
  attr_reader :status, :ok_to_fly
  attr_accessor :airport

 def land_at(airport)
    @airport = airport
     if airport.full && weather_ok?
      fail "Unable to land, the airport is full!" 
    elsif !airport.full && !weather_ok?
      fail "The weather is too 'stormy' to land!"
    else
      @airport.garage
      @status = "landed"
    end
  end

  def take_off
    if @status != 'landed'
      fail "Your airplane is still in the air." 
    elsif !weather_ok?
      fail "The weather is too stormy to fly!" 
    else
      @airport.au_revoir
      @status = 'flying'
    end
  end

  def weather_ok?
    @ok_to_fly = rand(10) !=9 ? true : false
  end
end