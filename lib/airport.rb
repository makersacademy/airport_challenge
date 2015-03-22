class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport Full' if planes.length >= 10
    planes << plane
  end

  def take_off
    planes.pop
  end
  # def full?
  #
  # end
end
