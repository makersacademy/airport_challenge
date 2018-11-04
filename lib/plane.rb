class Plane

  def sucessful_land(plane)
    "#{plane} has landed"
  end

  def sucessful_take_off(plane)
    "#{plane} has left airport"
  end

  def unsucessful_take_off_bad_weather(plane)
    "Weather is not good, #{plane} cannot take off"
  end

  def unsucessful_land_bad_weather(plane)
    "Weather is not good, #{plane} cannot land"
  end

  def unsucessful_land_hangar_full(plane)
    "Hangar is full, #{plane} not able to land"
  end


end
