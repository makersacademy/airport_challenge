# require 'pry'
class Weather
  attr_accessor :weather_rating

  def initialize
    generate_weather
  end
  def is_stormy?
    @weather_rating >= 9
  end

  private

  def generate_weather
    @weather_rating = rand(1..10)
  end
end
# binding.pry
