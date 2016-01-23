

require "airplane"
require "weather"
#register which planes are in the airport
#and when taken off, remove from airport
#stop planes landing twice by putting into array then deleting plane

# change stormz into its own class

class Airport
  include Weather
  attr_reader :stormy, :name, :airport_capacity, :cap_used, :planes_at_airport
  def initialize(airport)
    @name = airport
    @stormy = false
    @airport_capacity = 10
    @cap_used = 5
    @planes_at_airport = []
  end


  def tell_to_land(plane)
    @stormy = stormy
    if @stormy == false && @cap_used < @airport_capacity
      @cap_used = @cap_used + 1
      @planes_at_airport << plane
      plane.plane_land
      "#{plane} landed in #{@name} #{@planes_at_airport} is/are in the airport"
    else
      "#{@name} is full or its too stormy, no land bro"
    end
  end

  def set_used_capacity(cap_used)
    if cap_used < @airport_capacity
      @cap_used = cap_used
    elsif cap_used > @airport_capacity
      "airport cannot hold this much"
    else
      full
      @cap_used = cap_used
      "at capacity"
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
      "too many planes, if setting cap for new airport,
       please reset airport_capacity and cap_used"
    else
      @airport_capacity = cap
    end
  end

  private

  attr_reader :full

  def full
    @full = true
  end
end
