
class Weather

  attr_reader :todays_weather

  def initialize
    @todays_weather = []
  end 

  def todays_weather
    weather = ["stormy", "light drizzle", "sunshine", 
              "sunshine", "cloud",]
    @todays_weather.push(weather.shuffle.first)
  end 
end

# test = Weather.new
# puts test.todays_weather