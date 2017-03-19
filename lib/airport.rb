require_relative 'plane'

class Airport

	DEFAULT_CAPACITY = 2

	def initialize(capacity=DEFAULT_CAPACITY )
      @planes = []
      @landed_planes = []
      @weather = weather
      @capacity = capacity

	end

  def weather_report
  	weather = rand(1..10)
		if weather <= 3
		  "stormy"
		else
		  "sunny"
		end
	end

	def land(plane)
		fail "Landing denied, Airport is full" if full?

		planes << plane
	end

  def confirm_landing(plane)
	  planes.each do |plane|
	    landed_planes << plane	
	  end
	  landed_planes	
  end	
    
	def takeoff(landed_plane)
		fail "the plane has already departed" if empty? 
	  landed_planes.pop
	end

  private 

    attr_reader :planes, :landed_planes, :weather, :capacity

    def empty?
      landed_planes.empty?
    end

    def full?
      planes.length >= capacity
    end


end