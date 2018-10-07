class Controller
  def instruct_plane_to_land(plane, airport)
    "Landed #{plane.name} at #{airport.name}!"
  end

  def instruct_plane_to_take_off
    "Taken off!"
  end
end
