require "./lib/plane.rb"

class Airport

  attr_accessor :planes, :plane

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    plane.status_arrived
  end

  def take_off(plane)
    @planes.shift
    plane.status_departed
  end

  def confirm_status(plane)
    plane.status
  end

end
