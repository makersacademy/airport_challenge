require_relative "plane"

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :plane, :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def weather_stormy?
    #The weather generator: it will return true 10% of the time
    rand(101) <= 10
  end

  def deny_plane
    #takeoff and landing permission denial merged to DRY the code
    'Airport closed due to stormy weather' if weather_stormy?
  end

  def accept_plane(plane)
    fail 'Airport full' if airport_full
    @planes << plane
  end

  private

  def airport_full
    @planes.length >= @capacity
  end
end
