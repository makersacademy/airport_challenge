class Airport
  attr_reader :capacity
  attr_reader :planes_landed

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_landed = []
    @capacity = capacity
  end

  def take_off(plane)
    @planes_landed.delete(plane)
    @plane = plane
  end

  def land(plane)
    raise "Airport Full" if full?
    @plane = plane
    @planes_landed << plane
    # puts "#{Plane} has landed"
    @plane
  end

  private

  def full?
    planes_landed.count >= capacity ? true : false
  end
end
