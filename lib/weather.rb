class Weather
  attr_reader :weather

  def check_weather
    selection = rand(1..6)

    @weather_dice = { 1 => :sunny, 2 => :rainy, 3 => :stormy, 4 => :mild, 5 => :chilly, 6 => :frosty }

    weather = @weather_dice[selection]
  end
end
