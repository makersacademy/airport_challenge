require_relative './plane'


class Airport

attr_reader :capacity, :planes_at_airport

def initialize(capacity = 20)
	@capacity = capacity
	@planes_at_airport = []
end

def instruct_take_off (plane)
	fail 'It is stormy - you cannot take off!' if self.weather == 'stormy'
	plane.take_off
	@planes_at_airport.delete(plane)
end

def instruct_landing (plane)
	fail if full? 
	fail 'It is stormy - you cannot land!' if self.weather == 'stormy'
	plane.land
	@planes_at_airport << plane
end


def full?
	planes_at_airport.length >= 20
end


def weather
	if rand(10) < 10
  	return "sunny" 
  else
  	return "stormy"
  end
end


end