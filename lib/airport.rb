require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :capacity, :planes, :weather

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
    @plane = Plane.new
  end

  def land(plane)
    raise 'Airport full' if full?
    raise 'Plane cannot land in stormy weather' if weather.status == 'stormy'
    raise 'Plane already landed, cannot land again' if @planes.include? plane
    @planes << plane
  end

  def takeoff(plane)
    raise 'Plane cannot takeoff in stormy weather' if weather.status == 'stormy'
    @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end
end
