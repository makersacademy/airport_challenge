class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def safe_to_land?
    true
  end

  def safe_to_takeoff?
    true
  end

  def local_weather
    ""
  end
end
