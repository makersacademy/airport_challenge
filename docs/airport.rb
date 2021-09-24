require_relative 'plane'

class Airport

  def land(plane)
    raise "Airport is full" if @plane
    @plane = plane
  end

  def takeoff(plane)
  end

  def status
    []
  end

end
