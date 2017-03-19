require_relative "plane"

class Airport

	attr_reader :planes, :landed_planes

	def initialize
      @planes = []
      @landed_planes = []

	end

	def instruct(plane)
	  planes << plane
	end

	def land(plane)
    planes
	end

  def confirm_landing(plane)
	  planes.each do |plane|
	    landed_planes << plane	
	  end
	  landed_planes	
	end	
    
	def takeoff(landed_plane)
		raise "the plane has already departed" if landed_planes.empty?
	  landed_planes.pop
	end

end