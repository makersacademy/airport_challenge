class Airport

  attr_accessor :planes_in_airport

  #better to pass argument?
  def land_plane
    @planes_in_airport = Plane.new
  end

  def take_off(plane)
    @planes_in_airport = nil
    plane
  end
end 