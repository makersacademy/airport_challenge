require_relative "plane.rb"

class Atc

  def instruct_landing(plane, airport)
    plane.location = airport
  end

  def check_location(plane)
    puts "Plane's current location: #{@location}"
  end

end
