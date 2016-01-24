require_relative 'airport'

class Plane

	def land(airport)
		@airport = airport
	end

	def takeoff(airport)
		@airport = false
	end

	def landed?
		true if @airport
	end

	def airport?
		@airport unless !@airport
	end

private

	attr_reader :airport

end

#class Plane

	# attr_reader :land, :landed?, :airport

	# def initialize
	# 	@landed
	# 	@airport
	# end

	# def land(airport)
	# 	raise 'ERROR: plane already landed' if landed
	# 	@landed = true
	# 	@airport = airport
	# end

	# def landed?  #confirm landing
	# 	true
	# end

	# def takeoff
	# 	raise 'ERROR: plane already takenoff' unless landed
	# 	@landed = false
	# 	airport
	# end

#end


	