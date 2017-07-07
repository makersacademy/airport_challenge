require_relative 'plane'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def request_landing(plane)
    planes << plane
  end

  def request_takeoff
    planes.shift
  end
end
# Write up an initialize test
