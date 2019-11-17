require_relative 'plane'

class Airport
  attr_reader :planes, :capcacity
  attr_accessor :stormy

  def initialize(capcacity = 5)
    # 90% sunny and 10% of the time stormy
    rand() > 0.9 ? @stormy = true : @stormy = false
    @capcacity = capcacity
    @planes = []
  end
  def land(plane)
    fail 'WARNING stormy weather at airport abort landing' if @stormy == true
    fail 'WARNING airport is full, no space to land' if @planes.size == @capcacity
    @planes << plane
    'Plane has landed safely!'
  end
  def take_off(plane)
    fail 'WARNING too stormy to take off, abort take off' if @stormy == true
    'Plane has taken off safely!'
  end
end
