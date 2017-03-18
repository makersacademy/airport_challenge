require_relative "plane"

class Airport

	attr_reader :planes

	def initialize
      @planes = []
	end

	def instruct(plane)
	  planes << plane
	end

	def allow_landing(plane)
	  planes
	end

    def confirm_landing(plane)
	  planes	
	end	

	def dock(plane)
	  raise "there are no docked planes" if planes.empty?
	  planes
	end

	def allow_takeoff(plane)
	  planes.pop	
	end

end