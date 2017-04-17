require_relative 'airport'

class Plane
  def land(plane)
    plane
  end

  def landed?(plane) # doesnt know what plane is
    if plane == nil?
      'plane has not landed'
    else
      'Plane has landed'
    end
  end
end
