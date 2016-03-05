require_relative 'plane'

class Airport
  attr_reader :planes,

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'No space for landing' if full?
    plane.land
    planes << plane
  end



  private

  def full?
    planes.size == 1
  end

end