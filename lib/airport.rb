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
    if planes.include?(plane)
      plane.report_take_off
      planes.delete(plane)
    else
      raise 'Plane is not in Airport'
    end
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
