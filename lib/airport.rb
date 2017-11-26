require "plane"
class Airport
	DEFAULT_CAPACITY = 50
	def initialize capacity = DEFAULT_CAPACITY
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
		raise "Airport Full, Cannot Land" if full?
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

	private

	def full?
		planes.count == capacity
	end
end