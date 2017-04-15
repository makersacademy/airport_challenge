
class Plane

	@@planes = 0
	attr_reader :id

	def initialize
		@id = @@planes
		@@planes += 1
	end

end
