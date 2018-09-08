require_relative "airplane"
require_relative "weather"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Sorry, no landing. There's a storm." if @weather == "Stormy"
    @planes << plane
  end

  def take_off(plane)
    raise "Sorry, no take-off. There's a storm." if @weather == "Stormy"
    @planes.delete(plane)
  end

  def weather(weather = Weather.new.rng)
    @weather = weather
  end
end
