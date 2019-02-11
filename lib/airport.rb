class Airport
  attr_reader :planes_in_airport
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
  end

  DEFAULT_CAPACITY = 20

  def land(plane = Plane.new)
    raise "Turn your plane around." if stormy? || full?

    @planes_in_airport << plane
  end

  def take_off(plane)
    raise "Plane cannot take off." if stormy? || empty?

    @planes_in_airport.delete(plane)
  end

  def stormy?
    [true, false, false, false, false].sample
  end

  def full?
    @planes_in_airport.count >= @capacity
  end

  def empty?
    @planes_in_airport.count.zero?
  end

end
