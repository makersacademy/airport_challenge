class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def capacity=(value=DEFAULT_CAPACITY)
    @capacity = value
  end

  def land
  end

  def take_off
  end
end
