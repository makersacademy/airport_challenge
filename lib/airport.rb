class Airport

  attr_reader :planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "Cannot land due to stormy weather" if stormy?
    raise "Cannot land as airport full" if full?
    raise "Plane already landed" if in_airport?(plane)

    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off due to stormy weather" if stormy?
    raise "Plane not in airport" unless @planes.include?(plane)

    @planes.delete(plane)
    puts "#{plane} no longer in airport"
  end

  private

  def stormy?
    Weather.new.stormy?
  end

  def full?
    @planes.length >= @capacity
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end
end
