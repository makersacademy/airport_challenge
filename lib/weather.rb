module Weather

  WEATHER = ["sunny", "stormy"].freeze

  def weather
    random_num = rand(10)
    return_weather_condition(random_num)
  end

  private

  def return_weather_condition(random_num)
    if random_num <= 7
      WEATHER[0]
    else 
      WEATHER[1]
    end
  end
end
