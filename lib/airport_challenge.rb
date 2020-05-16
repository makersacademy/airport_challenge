require_relative './plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    fail 'Warning: Hangar full' if full?
    @hangar.push(plane)
  end

  def instruct_take_off(plane)
    @hangar.delete(plane)
  end

  def confirm_plane_left(plane)
    @hangar.include?(plane)
  end

  def full?
    @hangar.length == 20
  end

end
