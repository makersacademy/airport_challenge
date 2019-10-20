require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new

  def land(plane)
    raise "It is too stormy to land" if stormy?
    raise "The plane has landed already" if has_landed?(plane)
    raise "Airport if full" if full
end

  def take_off(plane)
    raise "it is too stormy for take off" if stormy?
    raise "This plane is not here" unless in_airport(plane)
  end

  def full?

  end

  def stormy?
  end

  def has_landed?(plane)
    plane.landed?
  end

  def in_airport(plane)
    @planes.include? plane
  end
end
