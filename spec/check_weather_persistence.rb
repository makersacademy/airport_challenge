class Airport

  attr_reader :weather

  def initialize(weather = Weather.new)
    @weather = weather
  end

  def weather_name
    puts @weather.name
  end
end

class Weather
  attr_accessor :name

  def initialize(name = "bob")
    @name = name
  end
end

british_weather = Weather.new("England")

gatwick = Airport.new(british_weather)
london = Airport.new(british_weather)

puts british_weather.name
puts gatwick.weather_name
puts london.weather_name

british_weather.name = "Scotland"

puts british_weather.name
puts gatwick.weather_name
puts london.weather_name

british_weather = Weather.new
p british_weather
p gatwick.weather
british_weather.name = "Whheeeeyyales"

puts british_weather.name
puts gatwick.weather_name
puts london.weather_name
