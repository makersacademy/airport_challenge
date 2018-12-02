class Plane

  def takeoff?
    if instruct_take_off == "Please take off now"
      true
    else
      false
    end
  end

  def land?
    if instruct_land == "You are given the all-clear to land."
      true
    else
      false
    end
  end

end
