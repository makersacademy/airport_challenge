class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :plane
  attr_accessor :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = 0
    @capacity = capacity
  end
  def land(plane)
    if full?
      raise "This airport is full, you can't land here!"
    end
    @plane += 1
  end
  def take_off(plane)
    if empty?
      raise "There are no planes to take off!"
    end
    @plane -=1
  end

private
  def full?
    if @plane == capacity
      return true
    end
      return false
  end
  def empty?
    if @plane == 0
      return true
    end
    return false
  end
end

class Plane
  def initialize
  end
end
