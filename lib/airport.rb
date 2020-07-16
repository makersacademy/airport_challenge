class Airport
  DEFAULT_CAPACITY = 20
  def initialize#(weather: Weather.new)
    @planes = []
  end
  def land(plane)
    fail "No landing allowed. Airport is full." if full?
    # fail "Landing not allowed due to storm." if weather.stormy?
    @planes << plane
  end

  def take_off
    "Take off allowed, plane no longer in this airport!"
  end

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

# class Weather
#
#   def stormy?
#     true
#   end
#
# end

end

class Plane
end
