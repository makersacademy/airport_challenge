require './docs/plane.rb'

class Airport
  def initialize(name="airport")
    @name = name
    @hangar = []
    @capacity
  end



  def land(plane)
    raise 'Plane has already landed' unless plane.airborne
    plane.ground
    hangar << plane
  end

  def take_off(plane)
    hangar.each {|docked_plane| return (hangar.slice!(hangar.index(plane))).fly if docked_plane == plane && !plane.airborne }
    raise 'Plane not in hangar'
  end

  attr_reader :hangar

  private

  def include?(plane)
    hangar.include?(plane)
  end
end
