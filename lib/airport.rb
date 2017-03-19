require_relative 'plane'

class Airport

	DEFAULT_CAPACITY = 2

	attr_reader :planes, :landed_planes, :weather, :capacity

	def initialize(weather=3, capacity=DEFAULT_CAPACITY )
      @planes = []
      @landed_planes = []
      @weather = weather
      @capacity = capacity

	end

	# def instruct(plane)
	#   planes << plane
	# end

	def land(plane)
		raise "Landing denied, Airport is full" if planes.length >= capacity
    planes << plane
	end

  def confirm_landing(plane)
	  planes.each do |plane|
	    landed_planes << plane	
	  end
	  landed_planes	
	end	
    
	def takeoff(landed_plane)
		raise "the plane has already departed" if empty? 
		# raise "cannot take off due to stormy weather" if false
		
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

  def empty?
    landed_planes.empty?
  end

  # def stormy?
  #   weather_report
  # end


end