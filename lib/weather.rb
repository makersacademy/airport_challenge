# This is a weathe class that keeps track of the weather and generates random conditions
class Weather

  def forcast
    conditions = 1 + rand(7)
    case conditions
    when 1
      excelent_weather = true
    when 2
      good_weather = true
    when 3
      acceptable_weather = true
    when 4
      rainy = true
    when 5
      overcast = true
    when 6
      low_ceiling = false
    when 7
      no_fly = false
    end
  end
end
