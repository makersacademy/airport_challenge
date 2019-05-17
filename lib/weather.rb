class Weather
  attr_reader :weather_number

  def weather_number
    rand(1..6)
  end
end