# randomly generates the weather, just like real life
class Weather
  def weather_condition
    rand(10).zero? ? 'stormy' : 'clear'
  end
end
