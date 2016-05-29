class Weather

	def status
		random = rand(1..10)
		random > 2  ? "sunny" : "stormy"
	end

end