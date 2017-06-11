require "./lib/plane.rb"

class Airport

  attr_accessor :planes, :plane
  DEFAULT_CAPACITY = 20

  def initialize(default_capacity = DEFAULT_CAPACITY)
    @planes = []
    @default_capacity = default_capacity
  end

  def land(plane)
    raise "Plane has already landed" if plane.status == "arrived"
    raise "Cannot land, this airport is full" if full?
    @planes << plane
    plane.status_arrived
  end

  def take_off(plane)
    raise "this plane is not available for take off or has already left" unless plane.available?(self)
    @planes.shift
    plane.status_departed
  end

  def confirm_status(plane)
    plane.status
  end

  def full?
    @planes.count == DEFAULT_CAPACITY ? true : false
  end

end
