require "./lib/plane.rb"
require "./lib/weather.rb"

class Airport
  attr_reader :capacity, :planes

  def initialize(capacity = 20)
    @planes = [] # stores planes
    @capacity = capacity # capacity of the airport default = 20)
  end

# plane cannot land if stormy
  def landing(plane)
    if weather_check == "Sunny"
      landing_procedure(plane)
    else
      fail "You're not cleared for landing due to adverse weather conditions"
    end
  end

# checks if the plane is at the airport if
# not, allows it to land at the airport
# and alters its location back to ground
  def landing_procedure(plane)
    if @planes.include? plane.name
      fail "You've already landed"
    elsif @planes.length >= @capacity
      fail "Airport is at max capacity"
    else
      plane.location = "Ground"
      @planes << plane.name
      return "You're clear for landing"
    end
  end

# plane cannot take off if stormy

  def take_off(plane)
    if weather_check == "Sunny"
      take_off_procedure(plane)
    else
      fail "You're not cleared for take off due to adverse weather conditions"
    end
  end

# checks if the plane is already Flying
# manages planes at airport by removing it from @planes
# alters its location to the sky
  def take_off_procedure(plane)
    if plane.location == "Flying"
      fail "You're already in the air"
    else
      plane.location = "Flying"
      @planes.delete(plane.name)
      return "You're clear for take off"
    end
  end

  def weather_check
    Weather.new.conditions
  end

end
