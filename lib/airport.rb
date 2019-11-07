require './lib/plane'
require './lib/weather'

class Airport

  DEFAULT_AIRPORT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_AIRPORT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "Airport is full" if full?
    raise "Plane already in the airport" if present?(plane)
    raise "Plane can't land in storm." if stormy?

    @planes << plane
  end

  def take_off(plane)
    raise "Plane not in airport" unless present?(plane)
    raise "Plane can't take off in storm." if stormy?

    @planes -= [plane]
  end

  private

  def stormy?
    @weather.status == "stormy"
  end

  def full?
    @planes.size >= @capacity
  end

  def present?(plane)
    @planes.include?(plane)
  end

end
