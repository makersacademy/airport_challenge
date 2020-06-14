class Plane
  attr_reader :state

  def initialize
    @state = :flying #should only be flying or landed, init as flying
  end

  def land(airport)

  end

  def change_state(new_state)
    @state = new_state
  end

end
