class Airport
  DEFAULT_CAPACITY = 150
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = ""
  end


  def weather_generator
    @weather = ["sunny", "stormy", "sunny"].sample
  end


  def takeoff
    fail "Can not takeoff while weather is this bad" if safe?
    @planes.pop
  end

  def land(plane)
    fail "Can not land while weather is this bad" if safe?
    fail "Airport is full!" if full?
    @planes << plane
  end

  def safe?
    if @weather == "sunny"
      true
    elsif @weather == "stormy"
      false
    end
  end

  def full?
    if @planes.count >= @capacity
      true
    end
  end
end
