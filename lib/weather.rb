module Weather
  def get_weather
    if rand(1..3) == 1 || 2
        "Stormy"
    else
        "Sunny"
    end

  end

end
