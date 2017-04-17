require "./lib/Airport.rb"
require "./lib/Plane.rb"
require "./lib/Weather.rb"

class Air_traffic_controller

  def initialize
    @planes_in_flight = []
  end

  def list_planes_in_flight
    @list_planes_in_flight = @planes_in_flight.clone
  end

  def land_plane(plane, airport, weather)
    raise "Plane cannot land, the weather is stormy" if weather.bad?
    raise "Plane cannot land, the airport is full" if airport.full?
    plane.land
    airport.new_plane_landed(plane)
  end

  def landed_planes(airport)
    airport.list_landed_planes
  end

  def check_list(plane, airport)
    airport.list_landed_planes.include?(plane) ? true : false
  end

  def takeoff_plane(plane, airport, weather)

    raise "That plane is not at this airport" if check_list(plane, airport) != true
    raise "Plane cannot take off, the weather is stormy" if weather.bad?
    plane.takeoff
    airport.new_plane_takeoff(plane)
    add_to_in_flight(plane)
  end

  def add_to_in_flight(plane)
    @planes_in_flight.push(plane)
  end

end
