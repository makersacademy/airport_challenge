require_relative './plane'

class Airport
  attr_reader :hangar
  
  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar.push(plane)
  end

  def instruct_take_off(plane)
    @hangar.delete(plane)
  end

  def confirm_plane_left(plane)
    @hangar.include?(plane)
  end
end
