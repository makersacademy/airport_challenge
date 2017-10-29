require './lib/plane.rb'

class Airport

attr_reader :hangar

  def initialize
    @hangar = [Plane.new]
  end

  def land(plane)
    @hangar << plane
  end

end
