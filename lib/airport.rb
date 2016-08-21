require_relative 'plane'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    plane.landed
    confirm_landing
    hangar << plane
  end

  def take_off(plane)
    plane.flying
    confirm_take_off
    hangar.delete(plane)
  end

  def confirm_take_off
    puts "Take-off successful"
  end

  def confirm_landing
    puts "Landing successful"
  end

end
