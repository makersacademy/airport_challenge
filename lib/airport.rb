require_relative  "plane.rb"
require_relative "weather.rb"

class Airport

  attr_reader :planes, :weather

  def initialize(weather=Weather.new)
    @weather = weather.random_weather
    @planes = []
  end

  def take(plane)
    @planes << plane if @weather == "sunny"
    true
  end

  def release(plane)

    @planes.delete(plane) if @weather == "sunny"
    true
  end

end
