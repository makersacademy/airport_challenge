require 'planes'

class Airport
  attr_reader :planes # planes in airport

  def land_plane
    @planes
  end

  def apron(planes) # planes on the airport 
    fail 'Airport is full' if @planes
    @planes = planes
  end
end
