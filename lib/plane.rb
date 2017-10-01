require './lib/airport.rb'
class Plane
  def initialize
    @in_the_air = false
    @airport_exited = []
  end

  def airport?(airport)
    airport.class == Airport
  end

  def land(airport)
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

  def take_off(airport)
    if airport.blocked_airport == true
      raise 'Plane cannot take off because the airport is having technical difficulties'
    end
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
