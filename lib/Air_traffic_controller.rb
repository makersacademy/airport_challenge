require "./lib/airport.rb"
require "./lib/plane.rb"
require "./lib/weather.rb"

class Air_traffic_controller

  def initialize
    @planes_in_flight = []
  end

  def list_planes_in_flight
    @list_planes_in_flight = @planes_in_flight.clone
  end

  def land_plane(plane, airport, weather)
    if weather.bad?
      raise "Plane cannot land, the weather is stormy"
    elsif airport.full?
      raise "Plane cannot land, the airport is full"
    else
      plane.land
      airport.new_plane_landed(plane)
    end
  end

  def landed_planes(airport)
    airport.list_landed_planes
  end

  def takeoff_plane(plane, airport, weather)
    if airport.list_landed_planes.include?(plane)
      if weather.bad?
        raise "Plane cannot take off, the weather is stormy"
      else
        plane.takeoff
        airport.new_plane_takeoff(plane)
      end
    else
      raise "That plane is not at this airport"
    end
  end

  def add_to_in_flight(plane)
    @planes_in_flight.push(plane)
  end

end
