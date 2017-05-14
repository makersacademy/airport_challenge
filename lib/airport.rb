require_relative 'plane'

class Airport

  attr_accessor :planes, :weather

  def initialize
    @planes = []
    @weather = 'good'
  end

  def land_plane(plane)
    raise "Weather stormy: Unsafe for landing" if stormy?
    @planes << plane
  end

  def confirm_landing(plane)
    @planes.include?(plane)
  end

  def take_off(plane)
    raise "Weather stormy: Unsafe for take off" if stormy?
    @planes.delete(plane)
    @planes
  end

  def confirm_take_off(plane)
    !@planes.include?(plane)
  end

  def stormy?
    @weather == 'stormy' ? true : false
  end

end
