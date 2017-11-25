class Plane
	def initialize
		@location = "Flying"
	end

	def location
		@location
	end

	def land airport
		raise "Already Landed" if @location != "Flying"
		@location = airport
	end
end