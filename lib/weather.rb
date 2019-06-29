class Weather
  attr_reader :weather
  def initialize
    generate_weather
  end
  
  def generate_weather
    rand(5).zero? ? @weather = 'Stormy' : @weather = 'Sunny'
    puts "Weather has been generated! It is #{@weather} today."
  end
end
