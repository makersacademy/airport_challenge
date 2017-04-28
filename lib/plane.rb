require './lib/airport.rb'

class Plane
  attr_reader :landed

  def initialize
    @landed = true
  end

  def land(airport)
    landing_schedule(airport)
    confirm_landed
  end

  def take_off(airport)
    take_off_schedule(airport)
    confirm_taken_off
  end

  def confirm_landed
    landed ? "#{self} has landed" : "#{self} is still in the air"
  end

  def confirm_taken_off
    !landed ? "#{self} has taken off." : "#{self} is on the ground."
  end

  private

  attr_writer :landed

  def landing_schedule(airport)
    airport.accept_aircraft(self)
    self.landed = true
  end

  def take_off_schedule(airport)
    airport.release_aircraft(self)
    self.landed = false
  end

end
