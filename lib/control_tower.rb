require "./lib/airport.rb"
require "./lib/weather.rb"
class ControlTower
  attr_reader :airport, :weather, :plane
  def initialize
    @airport = Airport.new
    @weather = Weather.new
  end

  def initiated_plane_comm(plane = Planes.new)
    @plane = plane
    puts "Flight #{@plane.object_id} recorded status"
    if @plane.plane_now[:airborne_request_land] == :now || @plane.plane_now[:airborne_red_land] == :now
      return (@airport.grounded.count < @airport.capacity && !@airport.check_runway.nil? && @weather.forecast != :stormy) ? green_landing : red_landing
    end
    if @plane.plane_now[:grounded_request_takeoff] == :now || @plane.plane_now[:grounded_red_takeoff] == :now
      return (!@airport.check_runway.nil? && @weather.forecast != :stormy) ? green_takeoff : red_takeoff
    end
    if @plane.plane_now[:grounded_landing] == :now
      return @airport.plane_landed(@plane)
    end
    if @plane.plane_now[:airborne_takingoff] == :now
      return @airport.plane_tookoff(@plane) 
    end
  end

  def green_landing(procedure_time = 8) #in minutes
    @airport.commit_runway(@plane, :landing, procedure_time)
    @plane.commence_procedure(:airborne_green_land, :airborne_landing)
  end

  def red_landing
    @plane.commence_procedure(:airborne_red_land, :airborne_green_land)
  end

  def green_takeoff(procedure_time = 15) #in minutes
    @airport.commit_runway(@plane, :takeoff, procedure_time)
    @plane.commence_procedure(:grounded_green_takeoff, :grounded_takingoff)
  end

  def red_takeoff
    @plane.commence_procedure(:grounded_red_takeoff, :grounded_green_takeoff)
  end
end