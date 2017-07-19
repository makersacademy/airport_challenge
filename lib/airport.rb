require './lib/plane.rb'
require './lib/weather.rb'
class Airport
	DEFAULT_CAPACITY = 20
	attr_reader :planes, :capacity
	  
	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
		@planes = [] 
		@weather = Weather.new
	end

	def land(plane)
		if stormy?
			fail "Bad weather can't land"
		 elsif airport_full?
		 	fail "Airport is full"		
		else					
			plane.grounded = true
			plane.takeoff = false		
			@planes.push(plane)
		end
	end
	def takeoff		
		if stormy?
			raise "Bad weather can't takeoff"
		elsif airport_empty?
			fail "Airport is empty" 
		#if @weather == 1
		else			
			allow_takeoff	
		end
	end
	def airport_empty?
		@planes.count == 0
	end
	def airport_full?
	@planes.count == @capacity
	end
	def stormy?
		@weather.weather == :stormy ? true : false
	end
	private
	attr_reader :weather
	def allow_takeoff
			@planes.each do |plane|
			plane.takeoff = true
			plane.grounded = false
			@planes.delete(plane)
			return plane
			end	
	end


end		#Airport class



		