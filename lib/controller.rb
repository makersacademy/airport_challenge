class Controller
  def instruct_plane_to_land(plane, airport)
    airport.request_landing(plane)
    if plane.landed?
      "Landed #{plane.name} at #{airport.name}!"
    else
      "ERROR: Plane didn't land!"
    end
  end

  def instruct_plane_to_take_off(plane, airport)
    airport.request_take_off(plane)
    if !plane.landed?
      "#{plane.name} taken off from #{airport.name}!"
    else
      "ERROR: Plane didn't take off!"
    end
  end
end
