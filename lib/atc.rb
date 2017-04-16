require_relative "plane.rb"

class Atc

  def instruct_landing(plane, airport)
    plane.land(airport)
    puts "#{plane} is landing at #{airport}"
  end

  def check_location(plane)
    puts "Plane's current location: #{@location}"
  end

end
