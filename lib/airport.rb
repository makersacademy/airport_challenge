class Airport

  DEFAULT_CAPACITY = 5

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = ["sunny", "stormy"].sample
  end

  def allow_to_land(plane)
    if @planes.size >= capacity
      raise "Can't authorize landing, the airport is full"
    end
    plane.land
    @planes << plane
  end

  def allow_to_takeoff(plane)
    plane.takeoff
    @planes -= [plane]
  end

  def weather
    case rand(100)
    when  1..75 then @weather = "sunny"
    when 75..100 then @weather = "stormy"
    end
  end

  attr_reader :planes
  attr_reader :capacity

end
