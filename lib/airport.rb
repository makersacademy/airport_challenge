require './lib/plane'

class Airport

  def land(plane)
    if plane.landed?
      raise "Not this time buddy, you only land once!"
    elsif plane.taken_off?
      raise "Not this time buddy, you can't land a taken off plane!"
    else
      plane.flight_status = :landed
    end
  end

  def takeoff(plane)
    if plane.flying?
      raise "Not this time buddy, you can't takeoff a flying plane!"
    elsif plane.taken_off?
      raise "Not this time buddy, you can't takeoff a taken off plane!"
    else
      plane.flight_status = :taken_off
    end
  end

  def status(plane)
    if plane.landed?
      "The plane is in the airport"
    elsif plane.taken_off? || plane.flying?
      "The plane is no longer in the airport"
    end

  end

end
