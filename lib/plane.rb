class Plane
  DEFAULT_FLYING = true
  attr_reader :flying
  def initialize(state = DEFAULT_FLYING)
    @flying = state
  end
  
  def taken_off?
    @flying = true
  end

  def landed?
    @flying = false
  end

  def flying?
    @flying
  end
end
