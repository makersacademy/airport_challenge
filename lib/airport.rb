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
  attr_accessor :weather

  def initialize(capacity = D_CAPACITY, weather = 'sunny')
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def take_off
    fail 'Weather is bad for take off' if weather == 'stormy'
    planes.last.off
    @planes.pop
  end

  def landing(plane)
    fail 'Weather is bad for landing' if weather == 'stormy'
    fail 'Airport full' if full?
    plane.land
    @planes << plane
  end

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= capacity
  end

  def change_weather(num = rand(100))
    num <= 30 ? @weather = 'stormy' : @weather = 'sunny'
  end
end
