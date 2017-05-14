require_relative 'plane'

class Airport

  def lands_plane(*)
    return "The plane has landed!"
  end

  def launches_plane(*)
    return "The plane has taken off!"
  end

  def show_weather
    weather = rand(100)
    if weather > 90
      return "There's a storm!"
    else
      return "The weather is sunny!"
    end
  end

end
