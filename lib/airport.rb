require "./lib/plane.rb"

class Airport

  attr_accessor :planes, :plane

  def initialize
    @planes = []
  end

  def land(plane)
    plane.status_arrived
    @planes << plane
  end

  def confirm_status(plane)
    plane.status
  end

end
