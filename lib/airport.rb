class Airport

  def land(plane)

  end

  def take_off
    if weather == stormy
      "Can't take off during storms."
    else
      Plane.new
      "Plane has left airport."
    end
  end

end
