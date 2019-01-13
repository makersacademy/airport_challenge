class Plane

  def initialize
    @landed_state = nil
  end

  def landed?
    @landed_state
  end

  def set_landed(landed_state)
    @landed_state = landed_state
  end

end
