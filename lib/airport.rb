class Plane
end

class Airport
	def initialize()
	  @hangar = []
	end

  def land(plane)
  	@hangar.push(plane)
  end

  def takeoff(plane)
  	# using delete instead of plane to get the actual plane called for instead of the last plane landed
  	@hangar.delete(plane)
  end

end
