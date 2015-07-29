require_relative './plane'

class Airport

DEFAULT_CAPACITY = 3
attr_reader :capacity, :planes_at_airport, :weather_status

def initialize(capacity = DEFAULT_CAPACITY)
	@capacity = capacity
	@planes_at_airport = []
	@weather_status = "sunny"
end

def how_many_planes
	planes_at_airport.count
end

def instruct_take_off (plane)
	fail 'It is stormy - you cannot take off!' if self.weather == 'stormy'
	plane.take_off
	@planes_at_airport.delete(plane)
end

def instruct_landing (plane)
	fail 'Airport is full' if full? 
	fail 'It is stormy - you cannot land!' if self.weather == 'stormy'
	plane.land
	@planes_at_airport << plane
end


def full?
	planes_at_airport.length >= DEFAULT_CAPACITY
end


def weather
	if rand(10) < 10
  	weather_status = "sunny" 
  else
  	weather_status = "stormy"
  end
end


end