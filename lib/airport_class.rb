require_relative 'plane_class'

class Airport

  attr_reader :hangars
  attr_accessor :weather

  def initialize
    @hangars = [Plane.new]
    @weather = ['sunny', 'sunny', 'sunny', 'stormy']
  end

  def land(plane)
    @hangars << plane
  end

  def take_off(plane_hangar)
    raise "The weater is stormy, the plane can't depart." if @weather.sample == 'stormy'
    @hangars.delete_at(plane_hangar)
  end

end
