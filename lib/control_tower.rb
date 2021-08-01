require "./lib/airport.rb"
require "./lib/weather.rb"
class ControlTower
  attr_reader :airport, :weather
  def initialize
    @airport = Airport.new
    @weather = Weather.new
  end

  def initiated_plane_comm(plane = Plane.new)
    @plane = plane
    puts "Flight #{@plane.object_id} recorded status"
    if @plane.plane_now["airborne_request_land"] || @plane.plane_now["airborne_red_land"]
      (@airport.check_runway == true && @weather.forecast != :stormy) ? green_landing : red_landing
    end
    if @plane.plane_now["grounded_request_takeoff"] || @plane.plane_now["grounded_red_takeoff"]
      (@airport.check_runway == true && @weather.forecast != :stormy) ? green_takeoff : red_takeoff
    end
  end

  def green_landing(procedure_time = 8) #in minutes
    @airport.commit_runway(@plane, :land, procedure_time)
    @plane.commence_procedure("airborne_green_land", "airborne_landing")
  end

  def red_landing
    @plane.commence_procedure("airborne_red_land", "airborne_green_land")
  end

  def green_takeoff(procedure_time = 15) #in minutes
    @airport.commit_runway(@plane, :takeoff, procedure_time)
    @plane.commence_procedure("airborne_green_fly", "grounded_takingoff")
  end

  def red_takeoff
    @plane.commence_procedure("airborne_red_fly", "airborne_green_fly")
  end
end