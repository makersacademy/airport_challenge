class Airport
  DEFAULT_CAPACITY = 10
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
   raise 'Airport is full' if full?
    @planes << plane
  elsif return "plane landed"
    end
  end

  def take_off(plane)
    @planes.pop
    return "plane no longer in the airport"
  end

  def weather_safe
    raise 'stormy'
  end

private

def full?
  @planes.length >= @capacity
end 
end
