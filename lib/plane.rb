require "./lib/airport.rb"

class Plane
  attr_reader :airport_to_land, :airport_take_off, :on_the_ground

  def instruct_to_land(airport)
    @airport_to_land = airport
    raise "Conditions for landing are not met" unless airport.condition_for_landing(self)
    airport.land(self) 
    @on_the_ground = true
  end

  def instruct_take_off(airport)
    @airport_take_off = airport
    raise "Conditions for take off are not met" unless airport.condition_for_takeoff(self)
    airport.take_off(self)
    @on_the_ground = false
  end

end
