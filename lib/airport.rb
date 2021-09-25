class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end
  
  def take_off(plane, weather=Weather.new)
    raise "Dangerous weather" if weather.stormy
    @hangar.delete(plane)
  end

  def land(plane, weather=Weather.new)
    raise "Dangerous weather" if weather.stormy
    raise "Airport full" if @hangar.length == @capacity
    @hangar << plane
  end
end