class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar.push(plane)
  end

  def take_off(plane)
    @hangar.delete(plane)
  end

  def safe_to_operate?(stormy)
    fail 'conditions not suitable for operations' if stormy == true
    true
  end
end
