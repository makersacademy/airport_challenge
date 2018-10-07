class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :weather
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = Weather.new
    @hanger = Array.new
    @capacity = capacity
  end

  def flight_clearance?
    weather.check == 'sunny'
  end

  def land(plane)
    raise('Cannot land in stormy weather') unless flight_clearance?
    raise('Cannot land. Airport is full.') if full?
    raise('Cannot land. Plane not in the air.') unless plane.location == "air"
    plane.location = object_id
    @hanger << plane
  end

  def take_off(plane)
    raise('Cannot take off. Plane not in hanger.') unless in_hanger?(plane)
    raise('Cannot take off in stormy weather') unless flight_clearance?
    plane.location = "air"
    @hanger.delete(plane)
  end

  def in_hanger?(plane)
    @hanger.include? plane
  end

  def full?
    @hanger.length >= capacity
  end
end
