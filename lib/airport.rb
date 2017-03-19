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

	def allow_landing(plane)
    planes
	end

  def confirm_landing(plane)
	  planes.each do |plane|
	    landed_planes << plane	
	  end
	  landed_planes	
	end	

	# def dock(landed_plane)
	#   raise "there are no docked planes" if landed_planes.empty?
	#   landed_planes
	# end
    
	def allow_takeoff(landed_plane)
	  landed_planes.pop
	end

end