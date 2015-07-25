class Airport

DEFAULT = 20

	def initialize
		@capacity = DEFAULT
		@planes = []
	end

	def may_fly?
		@may_fly
	end

	def may_land?
		@may_land
	end

	def capacity
		@capacity
	end

end

