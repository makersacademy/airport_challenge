require_relative 'weather'
require_relative 'plane'

class Airport

attr_reader :hanger, :weather

  def initialize
    @hanger = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Weather is stormy, do not land!" if @weather.condition == "stormy"
    @hanger << plane
  end

  def take_off
    fail "Weather is stormy, do not take off!" if @weather.condition == "stormy"
    @hanger.pop
    "The plane has taken off"
  end

end
