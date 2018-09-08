require_relative "airplane"
require_relative "weather"

class Airport
  attr_reader :plane_hanger

  def initialize(capacity=20)
    @plane_hanger = []
    @CAPACITY = capacity
  end

  def land(plane)
    raise "Sorry, no landing. There's a storm." if @weather == "Stormy"
    if @plane_hanger.size >= 20
      raise "Sorry, the hanger is full."
    else
      @plane_hanger << plane
    end
  end

  def take_off(plane)
    raise "Sorry, no take-off. There's a storm." if @weather == "Stormy"
    @plane_hanger.delete(plane)
  end

  def weather(weather = Weather.new.rng)
    @weather = weather
  end
end
