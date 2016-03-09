class Plane
  
  def initialize
   @landed = false
  end

  def land
    raise "That plane is already landed" if landed
    change_plane_status
  end


  def take_off
    raise "That plane is not landed" if !landed
    change_plane_status
  end

  private
  attr_reader :landed 

  def change_plane_status
    @landed = !@landed
  end
end
