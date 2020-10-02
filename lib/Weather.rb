class Weather
  def initialize
    @number = 0
  end

  def random_number
    rand(2000000)
  end

  def weather_outcome
    if random_number == 100
      "Sunny"
    else
      "Rain"
    end
  end

end
