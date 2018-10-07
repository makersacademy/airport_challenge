class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = ["stormy", "sunny"].sample
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport full' if full?
    # if stormy?
    raise "landing not allowed" if stormy?
    # else
    plane.update_status("land")
    @planes << plane
      # puts @planes
    # end
  end

  def takeoff(plane)
    # puts stormy?
    raise "takeoff not allowed" if stormy?
      # return "takeoff not allowed"
    # else
    plane.update_status("air")
    # end
  end

  # def weather?
  #   @weather
  # end

  def stormy?
    @weather == "stormy"
  end

  def update_weather(weather)
    @weather = weather
  end

  def capacity?
    @capacity
  end

  def update_capacity
    true
  end

  def full?
    @planes.count >= @capacity
  end

end
