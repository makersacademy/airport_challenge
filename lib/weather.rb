class Weather
  attr_reader :weather

  def initialize
    @weather = ['Sunny','Sunny','Sunny','Sunny','Stormy']
  end

  def weather_generator
    @weather[rand(5)]
  end
end

# test = Weather.new
# puts test.weather_generator
