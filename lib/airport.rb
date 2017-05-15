require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :capacity, :weather
  DEFAULT_CAPACITY = 20

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
      @landed_planes.push(plane)
    else
      "Plane #{plane} already landed!"
    end
  end

  def take_off(plane)
    fail "Plane #{plane} already taken off!" if plane.taken_off?
    fail "There are no planes to take off!!" if empty?
    fail "Cannot take off due to stormy weather!!" if @weather.stormy?
    plane.update_takenoff
    @landed_planes.delete(plane)
  end

private
  attr_accessor :landed_planes

  def full?
    @landed_planes.count >= @capacity
  end

  def empty?
    p @landed_planes
    @landed_planes.empty?
  end

end
