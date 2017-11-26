require "plane"
class Airport
	def initialize capacity = 50
		@planes = []
		@capacity = capacity
	end

	def planes
		@planes
	end

	def capacity
		@capacity
	end

	def land plane
		raise "Airport Full, Cannot Land" if planes.count == capacity
		@expecting = plane
		plane.land self
		@planes << plane
		@expecting = nil
	end

	def release_for_takeoff plane
		raise "Plane Not Here" if !@planes.include? plane
		@released_for_takeoff = plane
		plane.take_off
		@released_for_takeoff = nil
		@planes.delete plane
	end

	def expecting? plane
		@expecting == plane
	end
	def released_for_takeoff? plane
		@released_for_takeoff == plane
	end
end