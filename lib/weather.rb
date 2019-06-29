class Weather
  attr_reader :weather
  def generate_weather
    rand(5).zero? ? @weather = 'Stormy' : @weather = 'Sunny'
    puts "Weather has been generated! It is #{@weather} today."
  end
end
