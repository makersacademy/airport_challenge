class Airport
	def initialize
		@planes = []
	end

	def planes
		@planes
	end

	def land plane
		@planes << plane
	end

	def release plane
		@planes.delete plane
	end

end