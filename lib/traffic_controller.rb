require "plane.rb"

class Controller
  def instruct_takeoff(plane)
    raise "The plane is already flying" if plane.status == true
    plane.status = true
    true
  end
end
