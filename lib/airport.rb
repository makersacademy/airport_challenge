require_relative 'plane'

class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = 'good'
  end

  def land_plane(plane)
    @planes << plane
  end

  def confirm_landing(plane)
    @planes.include?(plane)
  end

  def take_off(plane)
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
