require_relative "../lib/plane"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    print "Landing ..." + plane.to_s
    @planes.push(plane)
  end
end
