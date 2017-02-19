require './lib/plane.rb'
class Airport
	DEFAULT_CAPACITY = 20
	attr_reader :weather
	attr_accessor :capacity, :planes
	def initialize(capacity=DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = [] 
		@weather = rand 1..2
	end

	def land(plane)
		fail "Airport is full" if airport_full
		#if @weather == 1			
			plane.grounded = true
			plane.takeoff = false		
			@planes.push(plane)
		#else
		#	fail "Weather is stormy for landing"
		#end
	end
	def takeoff		
		fail "Airport is empty" if airport_empty
		#if @weather == 1
			@planes.each do |plane|
			plane.takeoff = true
			plane.grounded = false
			@planes.delete(plane)
			return plane
			end		
		#else
		#	fail "weather is too stormy to takeoff" 
		#end	
	end
	def airport_empty
		@planes.count == 0
	end
	def airport_full
	@planes.count == @capacity
	end



end		#Airport class

# class Plane
# 	attr_reader :grounded, :takeoff
# 	def initialize(status = true, takeoff = false) 
# 		@grounded = status
# 		@takeoff = takeoff
# 	end

# end		