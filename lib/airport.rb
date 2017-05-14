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
    unless plane.landed?
      plane.update_landed
      @landed_planes << plane
    else
      "Plane #{plane} already landed!"
    end
  end

  def take_off(plane)
    fail "There are no planes to take off!!" if empty?
    fail "Cannot take off due to stormy weather!!" if @weather.stormy?
    unless plane.taken_off?
      plane.update_takenoff
      @landed_planes.delete(plane)
    else
      "Plane #{plane} already taken off!"
    end
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
