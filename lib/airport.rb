require "./lib/plane.rb"

class Airport

  attr_accessor :planes, :plane

  def initialize
    @planes = []
  end

  def land(plane)
    raise "Plane has already landed" if plane.status == "arrived"
    @planes << plane
    plane.status_arrived
  end

  def take_off(plane)
    if plane.available?(self)
      @planes.shift
      plane.status_departed
    else
      raise "this plane is not available for take off or has already left"
    end
  end

  def confirm_status(plane)
    plane.status
  end

end
