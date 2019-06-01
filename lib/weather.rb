module Weather

  def generate_weather
    weather = rand(1..10)
    if weather == 1
      return "Stormy"
    else
      return "Clear skies"
    end
  end

end
