require_relative './plane'
require_relative './weather'

class Airport

  attr_accessor :plane
  attr_reader :num_of_planes

  def initialize
    @plane = Plane.new
    @weather = Weather.new
    @num_of_planes = []
  end

  def land(plane)
    raise Exception.new("Too stormy to land") if stormy

    @num_of_planes << plane
  end

  def take_off(plane)
    raise Exception.new("Too stormy to take off") if stormy

    @num_of_planes.delete(plane)
  end

  def stormy
    @weather.stormy?
  end

end
