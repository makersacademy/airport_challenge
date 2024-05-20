require 'airport'

class Weather
  def weather_type
    type = ["Sunny", "Stormy"]
    type[rand(2)]
  end
end 