require_relative './plane'

class Airport

attr_reader :capacity

	def initialize
		@capacity = 20
		@planes = []
		@weather = weather
	end

	def take_off_clearance
		plane.take_off
	end

	def landing_clearance
		plane.land
	end


	def land (plane)
		fail 'Max capacity reached - airport is full' if full?
    	fail 'It is stormy - you cannot land!' if self.weather == 'stormy'
    	plane.land
		@planes << plane
	end

	def take_off (plane)
    	fail 'It is stormy - you cannot take off!' if self.weather == 'stormy'
    	plane.take_off
		@planes.delete(plane)
	end


  	def empty?
    	@planes.empty?
  	end

  	def full?
    	@planes.count >= 20
  	end


  	def weather
  		if rand(10) < 9
  			return "sunny" 
  		else
  			return "stormy"
  		end
  	end

end
