require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity, :weather

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = Weather.new
    @planes = []
    @capacity = capacity
  end

  def land(plane)


    fail 'airport full' if full?

    fail 'stormy weather - plane cannot land' if @weather.forecast == 'stormy'

    @planes.push(plane)
  end

  def take_off(plane)
    fail 'stormy weather - plane cannot take_off' if @weather.forecast == 'stormy'
    fail 'plane already airbourne' if plane.flying == true
    # @planes.pop(plane)
    "#{plane} has departed"
  end

  def full?
    @planes.length >= @capacity
  end
end
