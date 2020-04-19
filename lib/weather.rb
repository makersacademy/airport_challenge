class Weather
  def generate
    weather_array = ["stormy","sunny","overcast","rainy","partially overcast", "snowing"]
    weather_array[rand(0..5)]
  end
end
