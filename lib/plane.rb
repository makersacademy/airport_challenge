require_relative 'airport'

class Plane

	attr_reader :status

	def initialize
		@status = false
	end

	def landed
		@status = true
	end

	def takenoff
		@status = false
 	end

	def landed?
		@status
	end

	def takenoff?
		@status
	end

end