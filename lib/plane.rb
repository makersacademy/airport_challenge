require_relative 'airport'

class Plane
	attr_accessor :has_landed, :is_flying

	def initialize
		@has_landed = false
		@is_flying = true
	end

	def has_landed?
		@has_landed
	end

	def land
		@has_landed = true
	end

	def fly
		@has_landed = false
		@is_flying = true
	end

	def is_flying?
		@is_flying
	end
end