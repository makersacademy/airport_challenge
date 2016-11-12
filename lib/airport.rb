require_relative 'plane'

class Airport

  attr_reader :landing_bay

  def initialize
    @landing_bay = []
  end

  def store_plane(plane)
    @landing_bay << plane
  end

  def force_plane_to_take_off(plane)
    puts "The plane has taken off\n"
    plane.switch_flying
    return @landing_bay.delete(plane)
  end






end
