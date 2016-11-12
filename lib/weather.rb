module Weather

	def random_number
		rand(5)
	end

	def Weather.check_weather
		if random_number == 0
			"stormy"
		else
			"sunny"
		end
	end

end