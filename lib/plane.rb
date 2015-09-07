

class Plane

	def initialize
		@plane 
	end

	def flying?
		if Airport.new.take_off_plane 
			@flying = true
	 		return 'yes'
		elsif Airport.new.land_plane
			@flying = false 
			return 'no'
	 	end
	 end

	 def landed?
	 	if Airport.new.land_plane
	 		@landed = true
	 		return 'yes'
	 	elsif Airport.new.take_off_plane
	 		@landed = false
	 		return 'no'
	 	end
	 		
	 end

end
