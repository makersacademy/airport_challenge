class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    fail 'Airport is full' if @plane
    @plane = plane
  end

  def take_off(plane)
    @hangar.delete(plane)
  end
end
