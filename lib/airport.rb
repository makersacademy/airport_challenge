require_relative 'plane'

class Airport
 attr_reader :plane

#  def initailize(plane)
    #  @plane = []
  #  end

  def land(plane)
    @plane = plane
  end

  def take_off
    fail 'All planes have gone' unless @plane
    @plane
  #  raise 'All planes have gone'
  end



end
