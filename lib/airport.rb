class Airport
  attr_accessor :stormy, :planes, :capacity
  DEFAULT_CAPACITY = 20
  def initialize
    @stormy = Weather.new
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def stormy?
    @stormy
  end

  def land(plane)
    fail "Plane has already landed!" if @planes.include?(plane)

    fail "IT'S TOO STORMY TO LAND!!! ⛈️ ⛈️ ⛈️" if @stormy == true

    fail "Airport is full!" if @planes.count >= DEFAULT_CAPACITY

    p '🛬'
    @planes << plane
  end

  def take_off(plane)
    fail "IT'S TOO STORMY TO TAKE OFF!!! ⛈️ ⛈️ ⛈️" if @stormy == true

    fail "This plane is not at the airport!" unless @planes.include?(plane)

    p '🛫'
    @planes.delete(plane)
  end
end
