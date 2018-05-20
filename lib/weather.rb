class Weather

	DEFAULT_WEATHER = 'sunny'

	attr_accessor :at_the_moment

	def initialize(weather = DEFAULT_WEATHER)
  		@at_the_moment = weather
  	end
  	
  	def stormy?
  		@at_the_moment == 'sunny'? false : true
  	end


end
