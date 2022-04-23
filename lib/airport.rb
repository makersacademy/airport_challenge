class Airport

  attr_accessor :planes_in_airport

  #better to pass argument?
  def land_plane
    @planes_in_airport = Plane.new
  end

end 