require_relative   "plane.rb"

class Controller
  # returns false if the plane can't takeoff or raises a mistake if it is already flying
  def instruct_takeoff(plane)
    raise "The plane is already flying" if plane.status == true
    block_takeoff_if_stormy(plane)
  end
  # returns false if the plane can't land or raises a mistake if it is already on the ground
  def instruct_landing(plane)
    raise "The plane has already landed" if plane.status == false
    block_landing_if_stormy(plane)
  end
  def stormy?
    rand < 0.15
  end

  private
  # if it is stormy the takeoff is blocked
  def block_takeoff_if_stormy(plane)
    if !stormy?
      plane.status = true
      return true
    else
      return false
    end
  end
  # if it is stormy the landing is blocked
  def block_landing_if_stormy(plane)
    if !stormy?
      plane.status = false
      return true
    else
      return false
    end
  end
end
