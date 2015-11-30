require_relative 'airport'
class Plane

	attr_reader :landed

	def initialize
		@landed = false
	end

	def landed
		@landed = true
	
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