class Weather

	attr_reader :clear

	def initialize(clear = true)
		@clear = clear
	end
		
	def clear?
		weather_randomiser
	end

	def weather_randomiser
		if Random.rand(1..2) < 2
			@clear = true
		else
			@clear = false
		end
	end

end