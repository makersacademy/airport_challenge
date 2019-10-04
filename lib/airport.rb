require 'plane'

class Airport
  def initialize
    @capcity = 10
    @planes = []
  end

  def takeoff(plane)
    p "Clear for takeoff :)"
    @planes.delete(plane) #delete plane from array
    plane.take_off && plane.flying
  end

  def land(plane)
      @planes << plane #add plane to array
      plane.landed
  end

  def plane_count
    @planes.count
  end

  def airport_full
    
  end

end
