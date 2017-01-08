class Airport

  DEFAULT_CAPACITY = 2

  def initialize(default_capacity: nil)
    @capacity = default_capacity || DEFAULT_CAPACITY
    @planes = []
  end

  def capacity
    @capacity
  end

  def planes
    @planes
  end

  def land(plane)
    if weather == "sunny" && planes.length < capacity
      plane.land!
      planes.push(plane)
    else
      if weather == "stormy"
        fail "Too stormy to land!"
      elsif planes.length >= capacity
        fail "Sorry, airport full!"
      end
    end
  end

  def take_off(plane)
    if weather == "sunny"
      plane.take_off!
      @planes.delete(plane)
    else
      fail "Too stormy to take off!"
    end
  end

  def weather
    possible_weather = ["sunny", "sunny", "sunny", "stormy"]
    possible_weather.sample
  end



end
