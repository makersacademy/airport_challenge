# require './lib/plane.rb'

# Airport class will store and instruct
# instances of the Plane class
class Airport
  attr_reader :planes
  def initialize
    @planes = []
    @weather = check_weather
  end

def check_weather
  # Checks if weather is Stormy or Sunny, and gives a
  # random result. There is a 1 in 40 chance that it is
  # Stormy, all other times will be Sunny
    the_weather = Kernel.rand(1..40)
    if the_weather == 1
      return "Stormy"
    else
      return "Sunny"
    end
  end

  def land_plane(plane)
  # Adds a Plane to the @planes array
    @planes << plane
  end

  def take_off
  # Removes Planes from the Airport's @planes array,
  # and confirms that the number of Planes in the
  # @planes array has decreased by 1
    landed_planes = @planes.length
    current_weather = check_weather
    if
      current_weather == "Stormy"
      raise "Sorry, planes cannot take off in stormy weather."
    else
      @planes.pop
      if landed_planes.-(1) == @planes.length
        return "Flight has departed."
      end
    end
  end
end