class Weather

	attr_reader :stormy

	def initialize
		@stormy = false
	end

	def make_it_rain
		@stormy = true
	end

	def stormy?
		@stormy
	end

end