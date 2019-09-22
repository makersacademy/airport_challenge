class Airport
  def prevent_take_off

  end

  def prevent_landing

  end

  def full?(number_of_planes)
    number_of_planes > 10 ? true : false
  end

  def plane_in_airport?
    true
  end

end
