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

	def taken_off?
		@taken_off
	end

	def has_landed
		@landed = true
	end

	def has_taken_off
		@taken_off = true
	end

	def status
		if @taken_off
			"This plane has landed and taken off again!"
		elsif @landed
			"This plane has landed!"
		else
			"This plane is still in the air!"
		end
	end

end
