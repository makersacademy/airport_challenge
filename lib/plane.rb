class Plane
	def initialize
		@location = "Flying"
	end

	def location
		@location
	end

	def land airport
		@location = airport
	end
end