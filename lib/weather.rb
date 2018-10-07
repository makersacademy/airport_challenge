require 'pry'

class Weather
  attr_reader :weather

  def random_weather
    selection = rand(1..4)

    @weather_die = { 1 => :sunny, 2 => :sunny, 3 => :sunny, 4 => :stormy }

    weather = @weather_die[selection]
  end
end


# class Weather
#
# #when I first set this up I had it as #weather_selector and I and undefined method error
#   WEATHER_SELECTOR = [:sunny, :sunny, :sunny, :stormy]
#
#   def stormy?
#     random_weather == :stormy
#   end
#
#   def random_weather
#     WEATHER_SELECTOR.sample
#   end
#
# end
