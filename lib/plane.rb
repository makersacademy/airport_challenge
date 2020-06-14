class Plane
  attr_reader :state

  def initialize
    @state = :flying #should only be flying or landed, init as flying
  end

  def change_state(new_state) #used in the land_plane airport method
    @state = new_state
  end




end
