require_relative 'plane'

class Airport
  attr_reader :random_weather, :capacity, :planes

  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY )
    @planes = []
    @capacity = capacity
  end
  def plane_landed(plane)
    fail "No landings, severe weather conditions" if @random_weather == true
    fail "Airport At Full Capacity" if full?
    @planes << plane
  end

  def plane_take_off(plane)
    fail "No taking off, severe weather conditions" if @random_weather == true
    # fail "No planes currently in the airport" if empty?
    @planes.delete(plane)
    @planes
  end
end

def weather?
  @random_weather = rand(5)
  if @random_weather == 1
    true
    else
    false
  end
end

def full?
  @planes.count >= @capacity
end

# def empty?
#   @planes.empty?
# end
