class Airport
  attr_accessor :planes, :capacity
  attr_reader :weather
  DEFAULT_CAPACITY = 10

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def full?
    @planes.count == @capacity ? airport_full_message : false
  end

  def docked?(plane)
    @planes.include?(plane) ? plane_docked_message : false
  end

  def not_docked?(plane)
    @planes.include?(plane) ? false : plane_not_docked_message
  end

  private
  def airport_full_message
    fail "Airport is full"
  end

  def plane_not_docked_message
    fail "Plane not docked!"
  end

  def plane_docked_message
    fail "Plane is already docked!"
  end
end
