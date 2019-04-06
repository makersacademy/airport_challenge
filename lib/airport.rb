require_relative 'plane'

class AirPort

  attr_reader :landed_plane

  def initialize
    @landed_plane = []
  end

  def land(plane)
    @landed_plane.push(plane)
  end

  def take_off(plane)
    fail 'There are currently no planes' if @landed_plane.empty?
    
    delete_plane(plane)
    confirm?(plane)
  end

  private
  def confirm?(plane)
    true unless @landed_plane.include?(plane)
  end

  def delete_plane(plane)
    plane_id = @landed_plane.index(plane)
    @landed_plane.delete_at(plane_id)
  end
end
