class Airport

  attr_reader :landing_strip, :capacity, :DEFAULT_CAPACITY
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @landing_strip = []
    @capacity = capacity
  end

  def land(flight)
    fail 'Sorry we are full' if full?
    fail 'Weather warning. Cannot land.' if stormy?

    @landing_strip << flight
  end

  def take_off(flight)
    fail 'Weather warning. Cannot take-off.' if stormy?

    @landing_strip.delete(flight)
    @landing_strip
  end

  def stormy?
    rand(9) > 7
  end

  private

  def full?
    @landing_strip.count >= @capacity
  end

end
