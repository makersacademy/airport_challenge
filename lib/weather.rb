class Weather
	def stormy?
		@storm
	end
	def fine
		@storm = false
	end
	def storm
		@storm = true
	end
end