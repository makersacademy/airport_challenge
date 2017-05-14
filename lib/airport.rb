require_relative 'plane'

class Airport
  attr_accessor :weather
  attr_accessor :capacity
  attr_accessor :planes

  def initialize
    @weather = "sunny"
    @capacity = 20
    @planes = []
  end

  def lands_plane(plane)
    if @weather == "stormy"
      return "Plane could not land due to stormy weather."
    else
      @planes << plane
      "The plane has landed!"
    end
  end

  def launches_plane(*)
    return "Plane could not take off due to stormy weather." if @weather == "stormy"
    return "The plane has taken off!" if @weather == "sunny"
  end

  def generate_weather
    weather_number = rand(100)
    if weather_number > 90
      # There's a storm!
      @weather = "stormy"
    else
      # The weather is sunny!
      @weather = "sunny"
    end
  end

  def full?
    if @planes.count == 20
      return true
    else
      return false
    end
  end

end
