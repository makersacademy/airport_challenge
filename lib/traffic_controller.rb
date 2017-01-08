require_relative   "plane.rb"

class Controller
  def instruct_takeoff(plane, stormy = false)
    raise "The plane is already flying" if plane.status == true
    if stormy == false
      plane.status = true
      return true
    else
      return false
    end
  end
  def instruct_landing(plane, stormy = false)
    raise "The plane has already landed" if plane.status == false
    if stormy == false
      plane.status = false
      return true
    else
      return false
    end
  end
  def block_takeoff_if_stormy(stormy)
    stormy
  end
  def block_landing_if_stormy(stormy)
    stormy
  end
  def stormy?
    rand < 0.15
  end
end
