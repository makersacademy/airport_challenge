require_relative 'airport'

class Plane
  attr_reader :status, :ok_to_fly
  attr_accessor :airport

  def land_at(airport)
    @airport = airport
    fail "Unable to land, the airport is full!" if airport.full

    fail "The weather is too 'stormy' to land!" unless weather_ok?

    @airport.garage
    @status = "landed"
  end

  def take_off
    fail "Your airplane is still in the air." unless @status == 'landed'

    fail "The weather is too stormy to fly!"  unless weather_ok?

    @airport.au_revoir
    @status = 'flying'
  end

  def weather_ok?
    @ok_to_fly = rand(10) != 9
  end
end
