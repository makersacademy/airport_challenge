require_relative './plane.rb'
class Airport
	attr_reader :planes
	attr_accessor :stormy
	attr_accessor :capacity
	attr_accessor :default_capacity

	def initialize( default_capacity = 20, capacity= default_capacity, stormy = false)
		@planes = []
		@stormy = stormy
		@default_capacity = default_capacity
		@capacity = capacity
		# if capacity != nil 
		# @capacity = capacity  
		# 	else
		# @capacity = default_capacity
		# end 
	end 


	def land(plane)
		# p @planes.count	
		raise 'cannot land' if stormy?
		raise 'Airport full' if full? 
		@planes << plane 

	end 

	def check 
		@planes
	end 

	def takeoff
		# p @planes
		raise 'cannot takeoff' if stormy
		@planes.pop
		puts 'Plane has taken off'
	
	end 

	def stormy?
		@stormy
	 #returns true or false
	end 

	def full?
		# p @planes
		# p @planes.count
		if @planes.count >= @capacity
			return true
		end 

	end 



end 