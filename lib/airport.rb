require_relative 'plane'
class Airport
  def initialize
    @planes = []
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
  plane.took_off
  @planes.delete(plane)
end
end
