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

  def land(plane)
    check_land_edge_cases
    plane.landing(self)
    @planes << plane
  end

  def take_off(plane)
    check_take_off_edge_cases
    plane.taking_off(self)
    @planes.delete(plane)
  end

  def check_land_edge_cases
    fail "Stormy weather - plane can't land!" if @weather.stormy?
    fail "Airport is full - plane can't land!" if airport_full?
  end

  def check_take_off_edge_cases
    fail "Stormy weather - plane can't take off!" if @weather.stormy?
  end

  private

  def airport_full?
    @planes.size >= @capacity
  end

end
