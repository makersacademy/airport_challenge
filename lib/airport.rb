class Airport
  attr_accessor :hangar

  def initialize
    @hangar = []
  end

  def forecast?
    true
  end

  def land(plane)
    fail "Airport is full" if @hangar.length >= 10
    @hangar << plane
  end

  def take_off(plane)
    @hangar.delete(plane)
  end

end
