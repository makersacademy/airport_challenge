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
    @weather == "Stormy" ? (raise "Stormy weather prohibits take off") : "#{@planes.delete(plane)} has taken off from the airport"
  end

  def land(plane)
    @weather == "Stormy" ? (raise "Stormy weather prohibits landing") : "#{@planes << plane} has landed at the airport"
  end

#Irb test method
  def story
    @weather = "Stormy"
  end
end
