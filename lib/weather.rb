class Weather

	attr_reader :stormy

	def initialize
		@stormy = rand(0..10) > 7
	end

	def make_it_rain
		@stormy = true
	end

	def stormy?
		@stormy
	end

end