require_relative 'plane'

class Airport
  attr_reader :planes, :stormy
  attr_writer :stormy

  def initialize
    @stormy = Weather.new.stormy?
    @planes = []
  end

  def status(plane)
    return "Landed" if plane.landed == true
    return "In the air" if plane.landed == false
  end

  def land(plane)
    fail "Plane cannot land during a storm." if @stormy
    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail "Plane cannot take off during a storm." if @stormy
    plane.take_off
    remove_from_airport(plane)
  end

  private

  def remove_from_airport(plane)
    @planes.delete(plane)
  end

end
