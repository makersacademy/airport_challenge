require './lib/airport.rb'

class Plane
  attr_reader :landed

  #def initialize
  #  @landed = false
  #end

  def land(airport)
    landing_schedule(airport)
  end

  def take_off
  end

  def confirm_landed
    landed ? "#{self} has landed" : "#{self} is still in the air"
  end

  private

  attr_writer :landed
  def landing_schedule(airport)
    airport.land(self)
    self.landed = true
  end

end
