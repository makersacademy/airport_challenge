class Weather 

	def initialize
		@weather = ["stormy", "fine"]
	end

	def stormy?
		@weather[rand(2)] == "stormy" ? true : false
	end

end 