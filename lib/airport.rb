require_relative 'plane'

class Airport

  def initialize
    @runway = []
  end

  def runway
    @runway
  end

  def land(plane)
    @runway << plane
  end

end
