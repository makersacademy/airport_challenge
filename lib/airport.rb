require_relative 'plane'

class Airport
  attr_reader :plane

  def land(plane)
    raise "Airport is full" if @plane # assumes airport has one plane capacity
    
    @plane = plane
    # hangar = []
    # hangar << @plane
  end

  def take_off(plane)
    @plane = plane 
  end

end
