require_relative 'airport'

class Plane

  def initialize
    @state = :on_land
  end

  def take_off airport
    state = :on_air
    airport.notified_take_off
    
    puts "Plane on air!"
  end

  def land airport
    state = :on_land
    airport.notified_landing

    puts "Plane on land!"
  end

  private

  attr_accessor :state

end
