require_relative 'plane'

class Airport

	def initialize(weather=3)
      @planes = []
      @landed_planes = []
      @weather = weather

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
		raise "the plane has already departed" if empty?
	  landed_planes.pop
	end

	def weather_report
		if weather <= 3
		  "stormy"
		else
		  "sunny"
		end
	end

	private  
  attr_reader :planes, :landed_planes, :weather

  def empty?
    landed_planes.empty?
  end	


end