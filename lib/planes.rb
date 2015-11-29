require_relative 'airport'
class Plane

	def initialize
		@landed = false
	end

	def landed
		@landed = true
	
	end

	def landed?
		@landed
	end

	def flying
		@landed = false
	end

	# def status(plane)
	# 	landed << plane if 
	# 	return "landed" if @planes.include?(@plane)
	# 	return "flying" unless @planes.include?(@plane)
	# end

	
end 