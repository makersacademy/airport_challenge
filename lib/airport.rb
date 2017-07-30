class Airport

  def land_plane(plane)
  end

  def take_off(plane)
    raise 'Weather stormy. Plane can not take-off!' if stormy?
  end


  private

  def stormy?
    rand(1..9) > 5
  end
end
