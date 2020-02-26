
class Plane

	attr_reader :taken_off


	def confirm_take_off
		@taken_off = true
	end

	def taken_off?
		taken_off
	end

end
