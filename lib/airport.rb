require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  DEFAULT_WEATHER = "fine"
  
  attr_reader :hangar
  attr_reader :capacity
  attr_accessor :weather
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = DEFAULT_WEATHER
  end
  def land(plane)
    fail "The hanger is full, planes cannot land." if full?
    fail "The weather is stormy, planes cannot land." if stormy_weather?
    fail "That plane has already landed." if check_hangar_for(plane)
    hangar << plane
  end
  def takeoff(plane)
    fail "The weather is stormy, planes cannot take off." if stormy_weather?
    fail "That plane is not in this airport's hangar." unless check_hangar_for(plane)
    hangar.delete(plane)
    "The plane has taken off."
  end
  def change_capacity(number)
    fail "More than #{number} already in hangar" if in_hanger_vs(number)
    @capacity = number
  end
  
  private
  
  def full?
    hangar.length >= capacity
  end
  def stormy_weather?
    weather == "stormy"
  end
  def check_hangar_for(plane)
    hangar.include?(plane)
  end
  def in_hanger_vs(number)
    hangar.length >= number
  end
end

# Need to add random weather
# Need to prevent push'ing and <<'ing to the hangar
# Need to create a class valiable on Plane of all planes in existance and their locations
# Need to prevent land'ing and takeoff'ing an Airport from another Airport