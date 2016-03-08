class Plane
  
  def initialize
   @landed = false
  end

  def land
    raise "hmmm, it looks like we have that plane down as already landed, can you check the reference" if landed
    change_plane_status
  end


  def take_off
    raise "hmmm, it looks like we have that plane down as not landed, can you check the reference" if @landed == false
    change_plane_status
  end

  private
  attr_reader :landed 

  def change_plane_status
    @landed = !@landed
  end
end
