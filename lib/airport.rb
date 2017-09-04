class Airport
  attr_reader :conditions

  def initialize(conditions)
    @conditions = conditions
  end

  def land(plane)
    if @conditions.stormy
      fail "Cannot land due to stormy weather"
    else
      plane
    end
  end

  def take_off(plane)
    if @conditions.stormy
      fail "Cannot take off due to stormy weather"
    else
      plane
    end
  end
end
