require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane, weather)
    raise 'Airport is full, plane cannot land' if full?
    raise 'Stormy weather! Cannot land!' if weather.stormy?
    plane.report_landed
    planes << plane
  end

  def take_off(plane, weather)
    raise 'Stormy weather! Cannot take off!' if weather.stormy?
    raise 'Plane is not in Airport' unless planes.include?(plane)
    plane.report_take_off
    planes.delete(plane)
  end

  def empty?
    planes.empty?
  end

  def full?
    planes.size >= @capacity
  end

    private

    attr_reader :planes, :weather

end
