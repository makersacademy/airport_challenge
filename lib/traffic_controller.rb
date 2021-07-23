require './airplane'

class TrafficController

  def take_off(plane)
    fail "Plane is currently flying.. 🛩" if plane.flying?
    p "#{plane} is taking off.. 🛩"
    plane.flying = true
  end

  def land_plane(plane)
    fail "Plane is already landed.. 🛩" if !plane.flying?
    p "#{plane} will now land.. 🛩"
    plane.flying = false
  end
end

traffic_controller = TrafficController.new
A1 = Airplane.new()
traffic_controller.take_off(A1)
traffic_controller.land_plane(A1)
