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
  Weather = ['sunny', 'stormy']

  attr_accessor :planes
  attr_accessor :capacity
  attr_accessor :weather

  def initialize(capacity = D_CAPACITY, weather = Weather[0])
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def take_off
    planes.pop
  end

  def landing(plane)
    fail "#{self.class.name} full" if full?
    planes << plane
  end

  def empty?
    @planes.empty?
  end

  def full?
    planes.count >= 50
  end
end
