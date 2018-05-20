class Weather

	STORMY = false

	attr_accessor :at_the_moment

	def initialize(weather = STORMY)
		@at_the_moment = weather
	end

	def stormy?
		rand < 0.2
	end

end
