require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :planes
  attr_accessor :weather, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def landing(plane)
    raise "Can't land. Airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "No take off: Stormy weather" if weather_bad == true
    plane.confirm_take_off
    @planes.delete(plane)
    @planes
  end

  def weather_bad
    @weather.stormy == true
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
