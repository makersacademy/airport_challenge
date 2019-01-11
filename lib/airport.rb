require_relative './plane'
require_relative './weather'


class Airport
  attr_accessor :plane
  def initialize
    @plane = Plane.new
    @weather = Weather.new
  end

  def land  
    @plane.land
  end

  def take_off
    @plane.take_off unless stormy?
    if stormy?
      false
    else
      @plane.take_off
    end

  end

  def plane_left?
    true
  end

  def stormy?
    @weather.stormy?
  end
end