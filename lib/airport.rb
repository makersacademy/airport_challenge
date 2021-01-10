require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Airport is full" if full?

    raise "Plane cannot land due to storm" if stormy?

    @hangar << plane
  end

  def take_off(plane)
    raise "Plane cannot take off due to storm" if stormy?

    hangar.delete(plane)
    "The plane: #{plane} has taken off"
  end

  def report_storm
    @storm = true
  end

  private

  def stormy?
    @storm
  end

  def full?
    @hangar.length >= @capacity
  end
end
