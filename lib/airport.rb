require_relative 'plane'
class Airport
    #attr_reader :planes, :capacity
    #DEFAULT_CAPACITY = 300

def initialize
  @plane = []

end

def landing(plane)
    @plane << plane
  end

  def takeoff
    @plane.pop
    "allows plane to departed from the airport"
  end
end
