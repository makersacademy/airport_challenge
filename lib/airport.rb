class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def is_full?
    false
    # true or false depending on number of planes & capacity
  end

  def permission_to_land(plane)
    true
  end
end
