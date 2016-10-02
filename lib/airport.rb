require 'plane_file'

class Airport

  def initialize
    @planes_at_airport = Array.new
  end

  def accept_plane(plane_name)
    @planes_at_airport << plane_name
  end

  def landed?(plane_name)
    @planes_at_airport.include?(plane_name)
  end
end
