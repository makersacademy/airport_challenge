class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def takeoff(plane)
    @planes.delete(plane) # delete plane from array
    plane.flying
  end

  def land(plane)
    airport_full?

    @planes << plane # add plane to array
    plane.landed
  end

  def plane_count
    @planes.count
  end

  def airport_full?
    raise "The airport is currently full" if @planes.count == capacity
   end
end
