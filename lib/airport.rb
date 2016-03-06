require_relative '../lib/weather.rb'

class Airport
  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    raise "nope" if stormy
    raise "ALL FULL TRY THE THAMES" if full?
    plane.land
    add_plane(plane)
  end

  def take_off(plane)
    raise "I cannae do it, she cannae handle the weather" if stormy
    plane.take_off
    remove_plane(plane)
  end
 
  def remove_plane(plane)
    @planes.delete(plane)
  end
  
  def add_plane(plane)
    @planes << plane
  end

  def stormy
    weather.stormy 
  end 
  
  def full?
    planes.length > 0
  end

attr_reader :planes, :weather


end
