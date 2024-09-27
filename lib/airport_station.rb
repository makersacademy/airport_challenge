require_relative 'plane.rb'

class AirportStation
  attr_reader :plane

  def initialize
    @plane = []
  end

  def land_plane(plane) 
    @plane = plane
  end 
  
  def take_off
    raise 'airport empty' if empty?
    @plane.pop
  end 
  
  private

  def empty?
    @plane == 0
  end   
end
