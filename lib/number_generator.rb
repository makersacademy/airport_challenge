class NumberGenerator 
	attr_reader :weather
	def initialize
		@weather = [ "sunny", "rainy", "stormy", "windy"]
	end
	def biubiubiu
		random_num = rand(4)
		return @weather[random_num]
	end
end