class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @weather = ["stormy","sunny"].sample
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if full?
    if @weather == "stormy"
    return  "landing not allowed"
    else
      plane.set_status("land")
      @planes << plane
      #puts @planes
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

  def full?
    @planes.count >= @capacity
  end

  def set_capacity
    true
  end
end
