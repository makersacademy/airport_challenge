require_relative 'airport'

class Aeroplane
  attr_reader :plane

  def land(plane)
    return 'the airport is full' if @airport != []
    'Plane has landed!'
    @airport << plane
  end
  
  def takeoff
    'Plane has taken off and is no longer in the airport!'
  end  
  
end
