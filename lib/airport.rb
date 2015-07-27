require_relative "plane"
class Airport
  DEFAULT_MAX_PLANES = 10
  # Just a starting value for the capacity (it seemed like a good number to use)

  def initialize
  	@capacity = DEFAULT_MAX_PLANES
    @planes = []
    @weather = set_weather
  end
  # Setting all the initial values needed for the airport

  attr_accessor :capacity
  # Allows the capacity to be read with .capacity and changed with .capacity=
  attr_reader :planes, :weather
  # Allows the planes stored and current weather to be viewed (weather not all that useful but now don't need to write @ on weather)

  def ariving(plane)
  	weather = set_weather
  	# posible change of weather (it's random who knows)
  	fail "Cannot land, weather conditions too bad" if (weather == "Stormy")
  	fail "Cannot land, airport full" if full?
  	# error messages for why planes cannot land
  	plane.land
  	# changing the planes landed? value to true
  	planes << plane
    # adding the landing plane to the 
  end

  def leaving(plane)
  	weather = set_weather
  	# posible change of weather (it's random who knows)
  	fail "The plane is not at this airport" if !planes.include?(plane)
  	fail "Cannot take off, weather conditions too bad" if (weather == "Stormy")
  	# error messages for why planes cannot take off
  	planes.delete(plane)
  	# removing the plane that is about ot take off from the log
  	plane.take_off
  	# set the plane to flying
  	plane
  	# Return the full value of plane incase someone puts the output equal to something
  end

  def set_weather
  	(rand(5) <= 3) ? "Sunny" : "Stormy"
    # a random test for if the weather is "Sunny" or "Stormy", this was used in 2 places so created a method for it 
  end

  def full?
  	planes.length >= capacity
  	# a test if the airport if full
  end

end
