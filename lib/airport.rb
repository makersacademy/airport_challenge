require_relative './plane'
require_relative './weather'

class Airport

  DEFAULT_CAPACITY = 1

  attr_accessor :plane
  attr_reader :num_of_planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = Plane.new
    @weather = Weather.new
    @num_of_planes = []
    @capacity = capacity
  end

  def land(plane)
    raise Exception.new("No landing allowed") if stormy || full?

    @num_of_planes << plane
  end

  def take_off(plane)
    raise Exception.new("Too stormy to take off") if stormy

    @num_of_planes.delete(plane)
  end

  def stormy
    @weather.stormy?
  end

  def full?
    @num_of_planes.count >= @capacity
  end

  def empty?
    @num_of_planes.count.zero?
  end

end
