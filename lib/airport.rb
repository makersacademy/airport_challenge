class Airport
  def initialize(capacity = 50)
    @planes = []
    @weather
    @capacity = capacity
    @number_of_planes = 0
  end

  def land(forecast, plane)
    @weather = forecast

    fail "Weather is too stormy" if stormy?
    fail "Airport is full" if airport_full?
     @number_of_planes += 1
     @planes.push(plane)
     "You have permission to land!"

  end

  def take_off(forecast, plane)
    @weather = forecast
    fail "Weather is too stormy" if stormy?

    fail "This plane is not in this airport" if !@planes.include? plane

    @number_of_planes -= 1
    @planes.delete(plane)
    "You can now take off!"
  end

private
  def stormy?
    @weather
  end

  def airport_full?
    @number_of_planes == @capacity
  end

end
