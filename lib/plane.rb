require './lib/airport.rb'

class Plane
  attr_reader :landed


  def land(airport)
    landing_schedule(airport)
  end

  private
  attr_writer :landed
  def landing_schedule(airport)
    airport.land(self)
    self.landed = true
  end


end
