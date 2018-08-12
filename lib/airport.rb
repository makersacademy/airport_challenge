require_relative 'plane'
require_relative 'weather'
DEFAULT_CAPACITY = 10

class Airport

  attr_reader :planes, :capacity, :weather
  # Maybe making weather publicly accessible isn't the best idea
  # However it doesn't have any properties that can be changed
  # It only returns whether it is stormy or not

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
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

  def airport_full?
    @planes.size >= @capacity
  end

end
