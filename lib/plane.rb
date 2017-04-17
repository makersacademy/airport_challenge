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
    take_off_schedule
  end

  def confirm_landed
    landed ? "#{self} has landed" : "#{self} is still in the air"
  end

  def confirm_taken_off
    "#{self} has taken off." if landed == false
  end

  private

  attr_writer :landed

  def landing_schedule(airport)
    airport.land(self)
    self.landed = true
  end

  def take_off_schedule
    self.landed = false
  end

end
