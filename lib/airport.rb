require_relative 'plane'

class Airport


  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
    planes.delete(plane)
  end

  def planes_in_airport
    @planes.dup
  end

private

  attr_reader :planes

end
