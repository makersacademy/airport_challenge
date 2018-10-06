# This is a weathe class that keeps track of the weather and generates random conditions
class Weather

  def stormy?
    conditions = 1 + rand(6)
    case conditions
    when 1
      excelent_weather = false
    when 2
      good_weather = false
    when 3
      acceptable_weather = false
    when 4
      rainy = false
    when 5
      overcast = false
    when 6
      stormy = true
    end
  end
end
