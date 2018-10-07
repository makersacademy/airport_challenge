require_relative 'weather'
require_relative 'plane'

class Airport

attr_reader :hanger, :weather, :capacity
DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    fail "Weather is stormy, do not land!" if @weather.condition == "stormy"
    fail "Hanger is full" if full?
    @hanger << plane
  end

  def take_off
    fail "Weather is stormy, do not take off!" if @weather.condition == "stormy"
    @hanger.pop
    "The plane has taken off"
  end

  private
  def full?
    @hanger.length >= @capacity
  end

end
