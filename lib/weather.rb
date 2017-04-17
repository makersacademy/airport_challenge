class Weather

	def stormy?
		atmos >= 8 ? true : false
	end

	def atmos
		atmos = rand(10)
	end
	


end
