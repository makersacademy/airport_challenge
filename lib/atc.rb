require_relative "plane.rb"

class Atc

  def instruct_landing(plane, airport)
    plane.location = airport
  end

  def check_location(plane)
    plane.location
  end

end

