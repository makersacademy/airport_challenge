require_relative   "plane.rb"

class Controller
  def instruct_takeoff(plane)
    raise "The plane is already flying" if plane.status == true
    plane.status = true
    true
  end
  def instruct_landing(plane)
    raise "The plane has already landed" if plane.status == false
    plane.status = false
    true
  end
end
