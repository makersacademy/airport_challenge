class Airport
  DEFAULT_AIRPORT_CAPACITY = 92

  attr_reader :hangar
  attr_reader :capacity

  def initialize(capacity=DEFAULT_AIRPORT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane, weather)
    fail 'Airport full' if full?
    fail 'Cannot land: Stormzy' if weather.stormy? == true
   @hangar << plane
  end

  def takeoff
    @hangar.pop
  end

  private

  def full?
    @hangar.count >= capacity
  end
end
