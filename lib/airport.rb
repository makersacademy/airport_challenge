class Airport

	DEFAULT_CAPACITY = 30

	attr_accessor :capacity, :planes 
	
	def initialize(capacity = DEFAULT_CAPACITY)
		@planes = []
		@capacity = capacity
	end 

	def instruct_to_land(plane)
		fail "Plane has already landed" if @planes.include? plane 
		fail "Plane cannot land. Circle until capacity is released" if full? 
		fail "Plane cannot land. Wait until wind slows down" if stormy? 
		@planes << plane 
		plane.land
	end 

	def instruct_to_take_off(plane)
		@planes.delete(plane)
		plane.take_off 
	end 

	def plane_count
		planes = @planes 
	end 


	def full?
		@planes.count >= capacity 
	end 

	def stormy?
		return true if rand(1..100) >=70
	end

end 

