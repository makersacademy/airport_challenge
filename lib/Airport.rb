require './lib/Plane.rb'

class Airport

  def initialize
    @hangar = []
  end

  def land(plane)
    @plane = plane
    @hangar << @plane
  end

  def take_off(plane)
    @hangar.delete(@plane)
  end

  def hangar
    return 'empty' if empty?
    @hangar
  end

  private

  def empty?
    @hangar.count == 0
  end

end
