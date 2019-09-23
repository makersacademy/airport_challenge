class Weather
  def dangerous_weather?
  random_number = rand(10)
    if random_number < 2
      true
    else
      false
    end
  end
end

# weather = Weather.new
# weather.dangerous_weather?
