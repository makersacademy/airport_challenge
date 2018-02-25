require './lib/airport.rb'

class Plane

  attr_reader :flight_approval, :land_approval

  def initialize(airport)
    @airport = airport
    @airport.hangar.push(self)
    @flight_approval = false
    @land_approval = true
  end

  def take_off_check
    fail 'no flight approval' if @flight_approval == false
  end

  def take_off
    @airport.hangar.delete(self) 
    @airport = 'in-flight'
    @land_approval = false
  end

  def landing_check
    fail 'no landing approval' if @land_approval == false
  end

  def land(airport) 
    @flight_approval = false
    @airport = airport
    @airport.hangar.push(self)
  end
end
