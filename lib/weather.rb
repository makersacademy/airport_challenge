class Weather

	STORMY = false

	attr_accessor :at_the_moment

	def initialize(weather = STORMY)
  		@at_the_moment = weather
  	end

  	def stormy?
  		# @at_the_moment == 'sunny'? false : true
  		rand < 0.2
  	end


end
