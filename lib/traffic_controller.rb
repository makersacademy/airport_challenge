require 'airplane'
class TrafficController
  attr_reader :capacity, :weather, :current_weather

  DEFAULT_CAPACITY = 2

  def weather
    rand(1..10) > 7
  end

  def take_off(plane)
    fail "Plane is currently flying.. 🛩" unless plane.flying?
    fail "Plane cannot fly due to stormy weather!.. 🛩" if weather
    p "#{plane} is taking off.. 🛩"
    plane.flying = true
    Airplane.planes_at_airport.delete(plane)
  end

  def land_plane(plane)
    fail "Plane is already landed.. 🛩" if !plane.flying?
    fail "Plane cannot land due to stormy weather!.. 🛩" if weather?
    if Airplane.planes_at_airport.count < DEFAULT_CAPACITY
      p "#{plane} will now land.. 🛩"
      plane.flying = false
      Airplane.planes_at_airport << plane
    else
      return "Plane cannot land due to the max capacity being reached"
    end
  end

end

traffic_controller = TrafficController.new()
A1 = Airplane.new
traffic_controller.take_off(A1)
