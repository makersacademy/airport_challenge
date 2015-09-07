require_relative 'plane'

class Airport
	CAPACITY = 100
	attr_accessor :capacity
	attr_reader :planes

	def initialize
		@planes = []
		@capacity = CAPACITY
		@weather
	end

	def touch_down(plane)
		fail 'Airport is full' if full?
		fail 'Weather will not permit' if weather == false
		plane.land
		planes << plane
	end

	def depart(plane)
		fail 'Weather will not permit' if weather == false
		fail 'Airport is empty' if empty?
		plane = planes.pop
		plane.take_off
	end

	def chance
		chance = rand(50)
	end

	def weather
		if chance == 1
			false
		else
			true
		end
	end

		private

		def full?
			planes.count >= capacity
		end

		def empty?
			planes.empty?
		end

end
