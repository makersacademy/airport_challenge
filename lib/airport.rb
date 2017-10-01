require_relative 'plane'

class Airport
 attr_reader :plane

 def initialize
    @plane = []
  end

  def land(plane)
    @plane << plane
  end

  def take_off
    raise 'All planes have gone' if @plane.empty?
    @plane.pop
  end



end
