require_relative 'airport'

class Weather

  def weather_generator
    randomizer == 1 ? "Stormy" : "Sunny"
  end

  def randomizer
    return rand(1..10)
  end

end
