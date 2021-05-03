require_relative 'Plane'

class Airport 
  attr_reader :planes

  def land(plane) 
    raise "ERROR! Airport is full, you cannot land" if @planes

    @planes = plane
    "Aircraft has landed at airport" 
  end

  def take_off(plane)
    "Aircraft has taken off and is no longer in the airport"
  end

end
