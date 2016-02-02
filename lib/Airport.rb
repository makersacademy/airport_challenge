require_relative 'aircraft'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def take_off(plane)
    plane.report_take_off
    @planes.delete(plane)
    plane
  end

  def land(plane)
    plane.report_landed
    @planes << plane
  end

end
