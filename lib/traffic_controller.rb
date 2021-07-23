require 'airplane'
class TrafficController
  attr_reader :capacity, :weather, :current_weather

  @@weather = ['Stormy','Sunny','Raining']
  DEFAULT_CAPACITY = 2

  def take_off(plane)
    @current_weather = @@weather.sample
    fail "Plane is currently flying.. 🛩" if plane.flying?
    fail "Plane cannot fly due to stormy weather!.. 🛩" if current_weather == "Stormy"
    p "#{plane} is taking off.. 🛩"
    plane.flying = true
    Airplane.planes_at_airport.delete(plane)
  end

  def land_plane(plane)
    current_weather = @@weather.sample
    fail "Plane is already landed.. 🛩" if not(plane.flying?)
    fail "Plane cannot land due to stormy weather!.. 🛩" if current_weather == "Stormy"
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
traffic_controller.land_plane(A1)
