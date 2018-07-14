require_relative 'airport'

class Plane < Airport

  def initialize
    @airport = Airport.new
  end

  def land
    if @airport.weather == "sunny"
    puts "Plane has been instructed to land"
    else
    puts "Stormy weather: No plane must land."
    end
  end


  def take_off
    true
  end


  def confirm_take_off
    "The plane has taken off and is no longer in the airport"
  end
end

c = Plane.new
c.land
