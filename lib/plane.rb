require './lib/airport.rb'
class Plane
  attr_accessor :home_airport
  def initialize(home_airport)
    @in_the_air = nil
    @airport_exited = []
    @airport_just_landed = ""
    @home_airport = Airport.new(home_airport)
  end

  def airport?(airport)
    airport.class == Airport
  end

  def check_airport_status_land(airport)
    if airport.blocked_airport == true
      raise 'Plane cannot land because the airport is having technical difficulties'
    end
    raise "no landing because of stormy weather" if airport.prevent_landing == true
  end

  def check_plane_still_home(airport)
    airport.name == @home_airport.name && @airport_just_landed.empty?
  end

  def land(airport)
    raise 'plane has already landed...so cannot land again' if @in_the_air == false
    raise 'argument is not an airport object' unless airport?(airport)
    check_airport_status_land(airport)
    raise 'plane has never taken_off, so cannot land' if check_plane_still_home(airport)
    @in_the_air = false
    @airport_just_landed = airport.name
    return
  end

  def never_landed_anywhere?
    @airport_just_landed.empty?
  end

  def check_airport_status_take_off(airport)
    if airport.blocked_airport == true
      raise 'Plane cannot take off because the airport is having technical difficulties'
    end
    raise 'no take_off because of stormy weather' if airport.prevent_take_off == true
  end

  def conditions_before_taking_off(airport)
    check_airport_status_take_off(airport)
    if (@airport_just_landed != airport.name && !@airport_just_landed.empty?)
      raise 'plane not flying from correct airport'
    end
    raise 'plane not flying from home airport' unless @home_airport.name == airport.name
  end

  def take_off(airport)
    raise 'plane is already up in the air..so cannot take off' if @in_the_air == true
    conditions_before_taking_off(airport)
    @in_the_air = true if airport?(airport)
    @airport_exited << airport.name
    return
  end

  def in_the_air?
    @in_the_air
  end

  def airport_exited
    @airport_exited[-1]
  end

  def confirm_take_off
    return "confirming take_off from #{@airport_exited[-1]}" unless @airport_exited.empty?
    return "no take_off to confirm yet"
  end

end
