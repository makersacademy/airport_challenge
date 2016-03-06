require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 50

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport is full, plane cannot land' if full?
    plane.report_landed
    planes << plane
  end

  def take_off(plane)
    plane.report_take_off
    planes.delete(plane)
  end

  def empty?
    planes.empty?
  end

  def full?
    planes.count >= @capacity
  end

    private

  attr_reader :planes

end
