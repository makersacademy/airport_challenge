require "./lib/plane.rb"
require "./lib/weather.rb"

class Airport
  attr_reader :planes

  def initialize
    @planes = [1, 2, 3, 4, 5] # stores planes
  end

# plane cannot land if stormy
  def landing(plane)
    if weather_check == "Sunny" # add .conditions to fix this
      "You're clear for landing"
    else
      "You're not cleared for landing due to adverse weather conditions"
    end
    # @planes << plane # landed plane is stored in the array
  end

# plane cannot take off if stormy
  def take_off(plane)
    if weather_check == "Sunny" # add .conditions to fix this
      "You're clear for take off"
    else
      "You're not cleared for take off due to adverse weather conditions"
    end
  end

  def weather_check
    Weather.new.conditions
  end

end
