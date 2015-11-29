require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff
    @planes.pop
  end

  private

  attr_reader :planes
end
