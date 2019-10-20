require_relative 'plane'

class Airport
  @plane = Plane.new
  @planes = []
  @capacity = 1

  def plane_landing
    fail 'Landing not possible' if stormy?
    fail 'The airport is full' if full?
    @planes << @plane
  end

  def plane_taking_off
    fail 'Takeoff not possible' if stormy?
    @planes.pop
  end

  def takeoff_confirmation
    return @planes
  end



  private

  def stormy?
    weather = ["stormy", "clear skies", "light rain"]
    if weather.sample == "stormy"
      stormy = true
    end
  end

  def full?
    @planes >= @capacity
  end

    
end
