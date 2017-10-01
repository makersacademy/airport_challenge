require './lib/airport.rb'
class Plane
  attr_accessor :home_airport
  def initialize(home_airport)
    @in_the_air = nil
    @airport_exited = []
    @home_airport = Airport.new(home_airport)
  end

  def airport?(airport)
    airport.class == Airport
  end

  def land(airport)
    raise 'plane has already landed...so cannot land again' if @in_the_air == false
    raise 'argument is not an airport object' unless airport?(airport)
    if airport.blocked_airport == true
      raise 'Plane cannot land because the airport is having technical difficulties'
    end
    if airport.prevent_landing == true
      raise "no landing because of stormy weather"
    end
    @in_the_air = false
    return
  end

  def flying_from_home_airport?(airport)
    @in_the_air.nil? && (@home_airport.name == airport.name)
  end

  def conditions_before_taking_off(airport)
    if airport.blocked_airport == true
      raise 'Plane cannot take off because the airport is having technical difficulties'
    end
    if airport.prevent_take_off == true
      raise 'no take_off because of stormy weather'
    end
    raise 'plane not flying from home airport' unless flying_from_home_airport?(airport)
  end

  def take_off(airport)
    raise 'plane is already up in the air..so cannot take off' if @in_the_air == true
    conditions_before_taking_off(airport)
    @in_the_air = true if airport?(airport)
    @airport_exited << airport.__id__
    return
  end

  def in_the_air?
    @in_the_air
  end

  def airport_exited
    @airport_exited[-1]
  end

  def confirm_take_off(airport)
    airport_exited == airport.__id__
  end
end
