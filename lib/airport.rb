require_relative './plane'

class Airport

  attr_accessor :plane

  def initialize
    @plane = Plane.new
  end

  def land
    @plane.land
  end

  def take_off
    @plane.take_off
  end

end
