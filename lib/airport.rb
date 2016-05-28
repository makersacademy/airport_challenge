require_relative 'plane'

class Airport

  attr_accessor :planes

  def initialize
  	@planes = []
  end

 #  def initialize(*cap)
	# @planes = []
 #  end
  
 #  def land(plane)
 #  	@planes << plane
 #  end

  def depart
  	fail "No planes" if @planes.empty?
    @planes.pop.taken_off
  end

  def land(plane)
  	plane.landed
  	@planes << plane
  end

end



