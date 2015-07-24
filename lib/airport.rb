require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def accept(plane)
    plane.land
    planes.push(plane)
  end

  def allow_take_off
    plane = planes.pop
    #plane.fly
  end

  private
  attr_reader :planes

end
