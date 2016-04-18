require_relative 'airport'


class Plane

	def initialize 
		@in_air = false
	end

	def take_off(from)
		from.releases_plane(self)
	end

	def land(at)
		at.accepts_plane(self)
	end
	
	def plane_status
		@in_air 
	end

	def flying
		@in_air = true
	end

	def landed
		@in_air = false
	end

end




