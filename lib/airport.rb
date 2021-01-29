class Airport
  attr_accessor :capacity, :parked
  DEFAULT_CAPACITY = 10
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @parked = []
  end

  def confirmed_landing(plane)
    raise "Cannot land planes as the airport is already at maximum 
    capacity." if @parked.length >= @capacity

    raise "Weather is still stormy, please wait for weather 
    to improve before landing" if stormy? == true

    @parked << plane
  end

  def stormy?
    false
  end

end
