class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    if @planes.length >= capacity
      raise 'Airport is full'
    elsif @planes << plane
      return "plane landed"
    end
  end

  def take_off
    @planes.pop
    return "plane no longer in the airport"
  end

  def weather_safe
    raise 'stormy'
  end
end
