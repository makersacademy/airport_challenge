
# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed
#
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
#
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

require "/Users/ScottGledhill/Desktop/Projects/airport_challenge/AirportChallenge/lib/Airplane"
#register which planes are in the airport
#and when taken off, remove from airport
#stop planes landing twice by putting into array then deleting plane

class Airport
  attr_reader :full, :stormy, :name, :airport_capacity, :cap_used, :planes_at_airport
  def initialize(airport)
    @name = airport
    @full = false
    @stormy = false
    @airport_capacity = 10
    @cap_used = 5
    @planes_at_airport = []
  end

  def stormz
    weather = rand(0..100)
    if weather >= 95
      true
    else
      false
    end
  end

  def tell_to_land(plane)
    @stormy = stormz
    if @stormy == false && @cap_used < @airport_capacity
      @cap_used = @cap_used + 1
      @planes_at_airport << plane
      plane.plane_land
      "#{plane} landed in #{@name} #{@planes_at_airport} is/are in the airport"
    else
      `say 'too stormy!'`
      "#{@name} is full or its too stormy, no land bro"
    end
  end

  def set_used_capacity(cap_used)
    if cap_used < @airport_capacity
      @cap_used = cap_used
    elsif cap_used > @airport_capacity
      "airport cannot hold this much"
    else
      @full = true
      @cap_used = cap_used
      "at capacity"
    end
  end

  def full
    if @airport_capacity == @cap_used
      @full = true
    else
      @full = false
    end
  end

  def tell_to_take_off(plane)
    if @stormy == false
      @airport_capacity = @airport_capacity - 1
      @planes_at_airport.delete(plane)
      plane.plane_take_off
      "#{plane} has taken off"
    else
      "too stormy to fly bro"
    end
  end

  def set_capacity(cap)
    @airport_capacity = cap
    if @cap_used > @airport_capacity
      @airport_capacity = 0
      "too many planes, if setting cap for new airport, please reset airport_capacity and cap_used"
    else
      @airport_capacity = cap
    end
  end
end
