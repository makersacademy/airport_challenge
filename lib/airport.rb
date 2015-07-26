require_relative 'plane'
# As a pilot
# So that I can arrive at my specified destination
# I would like to land my plane at the appropriate airport

# As a pilot
# So that I can set off for my specified destination
# I would like to be able to take off from the appropriate airport

# As an air traffic controller
# So that I can avoid collisions
# I want to be able to prevent airplanes landing when the airport if full

# As an air traffic controller
# So that I can avoid accidents
# I want to be able to prevent airplanes landing or taking off when the weather is stormy

class Airport
  D_CAPACITY = 50

  attr_accessor :planes
  attr_accessor :capacity
  attr_accessor :sunny

  def initialize(capacity = D_CAPACITY, weather = true)
    @capacity = capacity
    @planes = []
    @sunny = weather
  end

  def take_off
    fail 'Weather is bad for take off' unless sun?
    @planes.pop
  end

  def landing(plane)
    fail 'Weather is bad for landing' unless sun?
    fail 'Airport full' if full?
    @planes << plane
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= capacity
  end

  def sun?
    @sunny
  end
end
