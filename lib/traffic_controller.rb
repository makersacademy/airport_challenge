require './airplane'
class TrafficController

  attr_reader :capacity
  DEFAULT_CAPACITY = 2

  def take_off(plane)
    fail "Plane is currently flying.. 🛩" if plane.flying?
    p "#{plane} is taking off.. 🛩"
    plane.flying = true
  end

  def land_plane(plane)
    fail "Plane is already landed.. 🛩" if not(plane.flying?)
    if Airplane.planes_at_airport.count < DEFAULT_CAPACITY
      p "#{plane} will now land.. 🛩"
      plane.flying = false
      Airplane.planes_at_airport << self
    else
      return "Plane cannot land due to the max capacity being reached"
    end
  end
end

traffic_controller = TrafficController.new
A1 = Airplane.new
traffic_controller.land_plane(A1)
