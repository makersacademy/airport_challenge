require './lib/plane.rb'

class Airport

attr_reader :plane

  def land
  Plane.new
  end

  def stand_by(plane)
  @plane = plane
  end

  def take_off

  end

end
