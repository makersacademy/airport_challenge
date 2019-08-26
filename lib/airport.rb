class Airport

  def land(plane)
    raise 'cannot let plane land due to stormy weather' if stormy?
  end

  def stormy?
    rand(1..6) > 4
  end

  def takeoff(plane)
    raise 'cannot let plane takeoff due to stormy weather' if stormy?
  end

end
