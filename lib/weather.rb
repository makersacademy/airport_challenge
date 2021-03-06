
class Weather
  def initialize
  end

  def weather_report
    #where every number is sunny except for 6 which is a rare occasion of stormy
    rand(1..9) == 6 ? "stormy" : "sunny"
  end

end
