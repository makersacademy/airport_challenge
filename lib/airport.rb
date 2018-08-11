require_relative 'plane'
require_relative 'weather'
DEFAULT_CAPACITY = 10

class Airport

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def put_in_airport(plane)
    fail "Stormy weather - plane can't land!" if @weather.stormy?
    fail "Airport is full - plane can't land!" if airport_full?
    @planes << plane
  end

  def take_from_airport(plane)
    fail "Stormy weather - plane can't take off!" if @weather.stormy?
    @planes.delete(plane)
  end

  private

  attr_reader :weather

  def airport_full?
    @planes.size >= @capacity
  end

end
