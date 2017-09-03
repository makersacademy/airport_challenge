class Airport
  attr_reader :conditions

  def initialize(weatherConditions)
    @conditions = weatherConditions
  end

  # def conditions
  #   @conditions
  # end

  def land(plane)
      plane
  end

  def take_off(plane)
    if @conditions.stormy
      fail "Cannot take off due to stormy weather"
    else
      plane
    end
  end
end
