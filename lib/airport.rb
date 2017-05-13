
class Airport

  attr_accessor :plane, :weather_is_stormy, :full

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = nil
    @weather_is_stormy = false
    @full = false
    @capacity = capacity
  end

  def capacity
    DEFAULT_CAPACITY
  end

end
