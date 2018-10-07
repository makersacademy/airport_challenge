class AirportController
  def instruct_plane_to_land(plane, airport)
    fail 'Plane is already at an airport!' unless plane.location == 'airborn'
    airport.add_plane(plane)
    plane.location = airport
    true
  end
end
