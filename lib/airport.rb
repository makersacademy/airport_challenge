class Airport
  DEFAULT_CAPACITY = 10

  attr_accessor :capacity
  attr_reader :hangar
  attr_writer :land

  def initialize
    @hangar = nil
  end

  def land(plane)
    @hangar = plane
  end

  def take_off
  end
end
