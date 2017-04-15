require_relative 'plane'
require_relative 'weather'

class Airport
  def initialize
    @planes = []
    @weather = Weather.new
  end

attr_reader :planes


def show_landed_planes
  puts @planes
end

def land(plane)
  plane.landed
  @planes << plane
end

def take_off(plane)
  fail 'This plane is currently not at the airport' if plane_not_here?(plane)
  fail 'It is too stormy to take off' if too_stormy?
  plane.took_off
  @planes.delete(plane)
end


attr_reader :weather

def too_stormy?
  @weather.stormy?
end

def plane_not_here?(plane)
  !@planes.include?(plane)
end
end
