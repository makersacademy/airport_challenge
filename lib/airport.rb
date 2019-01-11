require_relative 'plane'

class Airport
  attr_reader :weather, :planes

  def initialize
    @weather = "Sunny"
    @planes = []
  end

  def add_plane
    @planes << Plane.new
  end

  def change_weather
    roll == 6 ? @weather = "Stormy" : @weather = "Sunny"
  end

  def roll
    rand(1..6)
  end

  def take_off(plane)
    @weather == "Stormy" ? (raise "Stormy weather prevents take_off") : "#{@planes.delete(plane)} has taken off from the airport"
  end

  def land(plane)
    @weather == "Stormy" ? (raise "Stormy weather prevents landing") : "#{@planes << plane} has landed at the airport"
  end

end
