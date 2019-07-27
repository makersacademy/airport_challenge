require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  DEFAULT_CAPACITY = 40

  attr_reader :weather
  attr_accessor :capacity

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @planes = []
    @capacity = capacity
  end

  def takeoff
    fail "No planes available" if empty?
    raise "Too stormy to takeoff" if weather.stormy?

    @planes.pop
    "Takeoff"
  end

  def land(plane)
    fail "No room to land" if full?
    fail "Too stormy to land" if weather.stormy?

    @planes << plane
  end

  # def capacity
  #   @capacity
  # end

  private

  attr_reader :planes

  def empty?
    planes.count.zero?
  end

  def full?
    planes.count >= capacity
  end
end
