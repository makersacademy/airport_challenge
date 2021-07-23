class Airport
  attr_accessor :capacity

  def initialize
    @capacity = []
  end

  def plane_landing(plane)
    fail 'No space to land' if full?

    fail 'Weather is stormy' if weather == "stormy"

    @capacity << plane
  end

  def plane_takeoff
    # remove plane from array
    true
  end

  def weather
    weather = ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "stormy"]
    return weather.sample
  end

  def full?
    true if @capacity.length >= 5
  end
end
