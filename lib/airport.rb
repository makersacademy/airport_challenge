require_relative "plane.rb"
require_relative "weather.rb"

class Airport
  attr_reader :planes, :weather

  def initialize(weather = Weather.new)
    @weather = weather
    @planes = []
  end

  def land(plane)
    # raise "The plane can't land when the weather is stormy" if weather.stormy?
    add(plane)
    confirm_landing(plane)
  end

  def add(plane)
    planes << plane
  end

  def confirm_landing(plane)
    "The plane #{plane} has landed" if planes.include?(plane)
  end

  def take_off(plane)
    delete(plane)
    confirm_take_off(plane)
  end

  def delete(plane)
    planes.delete(plane)
  end

  def confirm_take_off(plane)
    "The plane #{plane} has taken off"  unless planes.include?(plane)
  end

end
