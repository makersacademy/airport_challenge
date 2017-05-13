require_relative 'plane'
require_relative 'weather'

class Airport
  attr_accessor :capacity, :weather
  DEFAULT_CAPACITY = 20
  srand 1234

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @landed_planes = []
    @weather = weather
  end

  def land(plane)
    fail "Cannot land as airport is full!!" if full?
    fail "Cannot land due to stormy weather!!" if @weather.stormy?
    plane.status_landed
    @landed_planes << plane
    self
  end

  def take_off(plane)
    fail "There are no planes to take off!!" if empty?
    fail "Cannot take off due to stormy weather!!" if @weather.stormy?
    plane.status_takenoff
    @landed_planes.delete(plane)
  end

private
  attr_reader :landed_planes

  def full?
    @landed_planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @landed_planes.empty?
  end

end
