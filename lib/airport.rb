class Airport

  DEFAULT_CAPACITY = 5

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def allow_to_land(plane)
    self.randomize_weather
    if self.randomize_weather == "stormy"
      raise "Can't authorize landing, adverse weather conditions"
    end
    if @planes.size >= capacity
      raise "Can't authorize landing, the airport is full"
    end
    plane.land
    @planes << plane
  end

  def allow_to_takeoff(plane)
    self.randomize_weather
    if self.randomize_weather == "stormy"
      raise "Can't authorize take off, adverse weather conditions"
    end
    plane.takeoff
    @planes -= [plane]
  end

  def randomize_weather
    case rand(100)
    when  1..75 then @weather = "sunny"
    when 75..100 then @weather = "stormy"
    end
  end

  attr_reader :planes
  attr_reader :capacity
  attr_reader :weather

end
