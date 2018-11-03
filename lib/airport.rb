require "./lib/plane.rb"
require "./lib/weather.rb"

class Airport
  attr_reader :planes

  def initialize
    @planes = [] # stores planes
    @weather = Weather.new
  end

  def landing(plane)
    @planes << plane # landed plane is stored in the array
  end

  def take_off(plane) # plane cannot take off if stormy

    # if @weather.conditions == "Sunny"
    #    "You're cleared to take off"
    # else @weather.conditions == "Stormy"
    #    "You're not cleared for take off due to adverse weather conditions"
    end
  end

end
