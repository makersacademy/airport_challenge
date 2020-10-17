require_relative "airport"

class Plane

  attr_accessor :location

  def change_location(location)
    @location = location
  end

  def locate_plane
    if location == "in air"
      puts "Plane is in air"
    else
      puts "Plane is in #{location.name}"
    end
  end

end
