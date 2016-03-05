class Plane

	attr_reader :landed , :taken_off
	attr_accessor :has_landed

	def initialize
		@landed = false
		@taken_off = false
	end

	def landed?
		@landed
	end

	def has_landed
		@landed = true
	end
	
	def taken_off?
		@taken_off
	end
end