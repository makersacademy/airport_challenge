class Weather
  def initialize
    @number = 0
  end

  def random_number
    rand(11)
  end

  def weather_outcome
    if random_number <= 9
      "Sunny"
    elsif random_number == 10
      "Storm"
    end
  end

end
