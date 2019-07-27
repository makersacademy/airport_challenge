require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  DEFAULT_CAPACITY = 40

  attr_reader :weather
  attr_accessor :capacity
  attr_reader :plane

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    $planes = []
    @capacity = capacity
  end

  def takeoff(plane)
    fail "No planes available" if empty?
    raise "Too stormy to takeoff" if weather.stormy?
    fail "Plane already in the air" unless plane.landed?

    $planes.pop
    "Takeoff"
  end

  def land(plane)
    fail "No room to land" if full?
    fail "Too stormy to land" if weather.stormy?
    fail "Plane already landed" if plane.landed?

    $planes << plane
  end

private

  attr_reader :planes

  def empty?
    $planes.count.zero?
  end

  def full?
    $planes.count >= capacity
  end
end
