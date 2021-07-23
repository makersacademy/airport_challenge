require_relative "./plane"

class Airport
  DEFAULT_CAPACITY = 20
  
  attr_reader :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = Array.new
  end

  def land(plane)
    fail "The hanger is full!" if full_hanger?

    @hanger.push(plane)
  end
  
  def takeoff
    fail "The're no planes to take off in the hanger" if empty_hanger?
    
    @hanger.pop()
  end

  def empty_hanger?
    return @hanger.empty?
  end

  def full_hanger?
    return @hanger.length == @capacity
  end
end
