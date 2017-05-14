require_relative 'plane'

class Airport
  attr_reader :plane

  def land plane
  	fail 'Airport full!' if @plane
  	@plane = plane
  end

  def take_off plane
  	fail 'No planes at the airport' unless @plane
  	
  	@plane
  end
end



# p plane = Plane.new
# p airport = Airport.new
# p airport.land(plane)
# p airport.land(plane)
# p plane.landed?
# # p airport.plane
# p airport.take_off(plane)
# p airport.plane
