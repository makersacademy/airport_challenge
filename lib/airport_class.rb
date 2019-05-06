require_relative 'plane.rb'

class Airport
  #airport = Airport_class.new
  def initialize
    @plane  = []
  end

  def land(plane)
    @plane << plane
    return "#{plane} has landed"
      #plane
  end

  def takeoff(plane)
     @plane << plane
     plane = @plane.pop
     return "#{plane} has takenoff"
  end










end
