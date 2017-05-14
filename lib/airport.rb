require_relative 'plane'

class Airport
  attr_accessor :weather

  def initialize
    @weather = "sunny"
  end

  def lands_plane(*)
    return "The plane has landed!"
  end

  def launches_plane(*)
    return "The plane has taken off!"
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

end
