require_relative "airplane"
require_relative "weather"

class Airport
  attr_reader :plane_hanger, :default_capacity

  def initialize(capacity = 20)
    @plane_hanger = []
    @default_capacity = capacity
  end

  def land(plane)
    stormy?
    already_landed?(plane)
    hanger_full?
    plane.landed
    @plane_hanger << plane
  end

  def take_off(plane)
    stormy?
    plane.ready_to_take_off
    @plane_hanger.delete(plane)
  end

  def weather(weather = Weather.new.rng)
    @weather = weather
  end

  private
  def stormy?
    raise "Sorry, there's a storm." if @weather == "Stormy"
  end

  def hanger_full?
    raise "Sorry, the hanger is full." if 
    @plane_hanger.size >= @default_capacity
  end

  def already_landed?(plane)
    raise "Sorry, this plane already landed at an airport." if 
    plane.flying_status == false
  end

end
