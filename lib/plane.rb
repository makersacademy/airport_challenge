class Plane

	attr_reader :landed , :taken_off

	def initialize
		@landed = false
		@taken_off = false
	end

	def has_landed?
		@landed
	end

	def has_taken_off?
		@taken_off
	end

	def landed
		@landed = true
	end

	def taken_off
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
