class Airport
  attr_accessor :hangar, :capacity

  def initialize(capacity = 10)
    @hangar = []
    @capacity = capacity 
  end

  def forecast?
    true
  end

  def land(plane)
    fail "Airport is full" if @hangar.length >= @capacity
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
  end

end
