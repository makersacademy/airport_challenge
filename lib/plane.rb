class Plane
  attr_reader :state

  def initialize
    # should only be flying or landed, init as flying
    @state = :flying
  end

  def change_state(new_state)
    # used in the land_plane airport method
    @state = new_state
  end
end
