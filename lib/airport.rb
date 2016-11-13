require_relative "plane.rb"
require_relative "weather.rb"

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    confirm_landing(plane) if @planes.include?(plane)
  end

  def confirm_landing(plane)
    "The plane #{plane} has landed"
  end

  def take_off(plane)
    @planes.delete(plane)
    confirm_take_off(plane) unless @planes.include?(plane)
  end

  def confirm_take_off(plane)
    "The plane #{plane} has taken off"
  end

end
