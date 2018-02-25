require './lib/airport.rb'

class Plane

  attr_reader :flight_approval, :land_approval, :status

  def initialize(airport)
    @airport = airport
    @airport.dock_plane(self)
    @status = :docked
    @flight_approval = false
    @land_approval = true
  end

  def take_off_check
    fail 'no flight approval' if @flight_approval == false
  end

  def take_off
    @airport.release_plane(self) 
    @status = :inflight
    @land_approval = false
  end

  def landing_check
    fail 'no landing approval' if @land_approval == false
  end

  def land(airport) 
    @flight_approval = false
    @status = :docked
    @airport.dock_plane(self)
  end
end
