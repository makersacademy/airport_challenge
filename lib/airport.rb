require_relative 'weather'

class Airport
  attr_reader :planes, :weather
  attr_accessor :capacity

  def initialize(capacity = 75)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def add_plane(plane)
    raise "Airport full" if full?
    @planes << plane
  end

  def remove_plane(plane)
    @planes.delete(plane)
  end

  def plane_at_airport?(plane)
    planes.include?(plane)
  end

  def confirm_landing(plane) 
    raise "Plane has not landed" if !plane_at_airport?(plane)
    "#{plane} has landed"
  end

  def confirm_takeoff(plane)
    raise "Plane has not taken off" if plane_at_airport?(plane)
    "#{plane} has taken off"
  end
  
  private 

  def full?
    @planes.count >= @capacity
  end
end
