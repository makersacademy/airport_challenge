require_relative 'plane'

class Airport
  attr_reader :planes, :capcacity

  def initialize(capcacity = 5)
    @capcacity = capcacity
    @planes = []
  end
  def land(plane)
    fail 'WARNING airport is full, no space to land' if @planes.size == @capcacity
    @planes << plane
    'Plane has landed safely!'
  end
  def take_off(plane)
    'Plane has taken off safely!'
  end
  def stormy?
    rand() > 0.9 ? true : false
  end
end
