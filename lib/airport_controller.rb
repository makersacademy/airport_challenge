class AirportController
  NOT_AIRBORN = 'Plane is not airborn'

  def instruct_plane_to_land(plane, airport)
    fail NOT_AIRBORN unless plane.location == Plane::AIRBORN
    airport.add_plane(plane)
    plane.location = airport
    true
  end
end
