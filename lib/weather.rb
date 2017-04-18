require_relative 'airport'

class Weather

	def stormy?
		rand(10) == 1 ? true : false
	end
end
