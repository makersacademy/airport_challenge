module Weather

	def random_number
		rand(5)
	end

	def self.check_weather
		return "stormy" if random_number == 0
		return "sunny"
	end

end