require_relative 'plane'

class Airport
  attr_accessor :weather

  def lands_plane(*)
    return "The plane has landed!"
  end

  def launches_plane(*)
    return "The plane has taken off!"
  end

  def generate_weather
    weather = rand(100)
    if weather > 90
      #return "There's a storm!"
      @weather = "stormy"
    else
      #return "The weather is sunny!"
      @weather = "sunny"
    end
  end

end
