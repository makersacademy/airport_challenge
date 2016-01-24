require_relative 'plane'

class Airport

attr_reader :holding_bay, :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @holding_bay = []
    @capacity = capacity
  end

  def land(plane)
    if sunny? && plane.flying? && full? == false
      plane.change_status
      @holding_bay << plane
    else
      sunny? == false ? "Unsafe to land plane whilst stormy" : "Plane has already landed"
    end
  end

  def take_off
    plane = @holding_bay.pop
    if sunny? && plane.landed?
      plane.change_status
      plane
    else
      @holding_bay << plane
      sunny? == false ? "Unsafe to take off plane whilst stormy" : "This plane is already flying"
    end
  end

#private - check scope
  def sunny?
    rand*100 > 10 ? true : false
  end

private

  def full?
    @holding_bay.size >= @capacity
  end
end
