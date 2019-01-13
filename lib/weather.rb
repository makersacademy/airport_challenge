# lib/weather.rb

class Weather
  # attr_reader :weather_randomizer
  def initialize
    @weather_randomizer = rand(1..5)
  end

  def stormy?
    if @weather_randomizer > 4
      true
    else
      false
    end
  end
end
