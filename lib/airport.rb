class Airport

  def initialize
    @weather = ["stormy","sunny"].sample
    @capacity = 10
  end

  def land(plane)
    if @weather == "stormy"
    return  "landing not allowed"
    else
      plane.set_status("land")
    end
  end

  def takeoff(plane)
    if @weather == "stormy"
    return  "takeoff not allowed"
    else
      plane.set_status("air")
    end
  end

  def weather?
    @weather
  end

  def set_weather(weather)
     @weather = weather
  end

  def prevent_landing(plane)
    true
  end

  def capacity?
    @capacity
  end

  def set_capacity
    true
  end
end
