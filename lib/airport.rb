require 'plane'
class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def takeoff(plane)
    p "Clear for takeoff :)"
    @planes.delete(plane) # delete plane from array
    plane.take_off && plane.flying
  end

  def land(plane)
    @planes << plane # add plane to array
    plane.landed
  end

  def plane_count
    @planes.count
  end

  def airport_full?
    if @planes.length >= capcity
      p "Airport is full try again later"
    end
  end

end
