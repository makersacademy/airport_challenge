class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :capacity

  def landing_clear?
    true
  end

  def takeoff_clear?
    true
  end
end
