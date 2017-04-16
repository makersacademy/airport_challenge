require "plane.rb"
require "airport.rb"

class Atc

  def instruct_landing(plane, airport)
    plane.location = airport
  end

  def check_location(plane)
    plane.location
  end

  def instruct_takeoff(plane)
    plane.location = 'in the sky'
  end

end

