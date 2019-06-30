require_relative './weather.rb'
require_relative './plane.rb'


class Airport

  def initialize
    @planes = []
  end

  def plane_land(plane, weather)
    fail 'Landing prevented due to storm' if weather.stormy?
    @planes << plane
  end

  def plane_depart(plane)
    fail 'Plane no longer here' if plane_status?(plane) == false
    @planes.delete(plane)
  end


  def plane_status?(plane)
    @planes.include?(plane)
  end

end
