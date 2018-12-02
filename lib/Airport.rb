require_relative "Aeroplane.rb"

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def takeoff(plane)
    @planes.delete(plane)
  end

  def land(plane)
    @planes << plane
  end

end
