class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes
  attr_writer :capacity
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport Full' if planes.length >= DEFAULT_CAPACITY
    planes << plane
  end

  def take_off
    planes.pop unless storm?
  end
  # def full?
  #
  # end
  def storm?
    weather == 'storm'
  end
end
