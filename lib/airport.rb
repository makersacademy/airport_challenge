require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity, :weather, :planes

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = Weather.new
    @planes = []
    @capacity = capacity
  end

  def land(plane)

    plane.arrive
    fail 'airport full' if full?

    fail 'stormy weather - plane cannot land' if @weather.forecast == 'stormy'
    fail 'plane already grounded' if planes.include?(plane)

    @planes.push(plane)
  end

  def take_off(plane)
    fail 'stormy weather - plane cannot take_off' if @weather.forecast == 'stormy'
    fail 'plane already airbourne' if plane.flying == true
    fail 'plane not in this airport!' unless planes.include?(plane)

    plane.depart
    @planes.pop
    "#{plane} has departed"
  end

  def full?
    @planes.length >= @capacity
  end
end
