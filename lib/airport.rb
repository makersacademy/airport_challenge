require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 35

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    # array to store landed planes  
    @planes = [] 
  end

  def land(flight_number)
    fail "Cannot land due to weather." if weather == "stormy"
    fail "Airport is full." if full? 

    @planes << Plane.new(flight_number)
  end

  def takeoff(flight_number)

    fail "Cannot takeoff due to weather." if weather == "stormy"

    found = false

    @planes.each_with_index do |plane, index|
      if plane.flight_number == flight_number
        @planes.delete_at(index)
        found = true
        puts confirm
      end
    end
    
    fail "Flight '#{flight_number}' not found" if found == false
  end
  
  def confirm
    "Plane is no longer in the airport."
  end

  def random_number
    rand(11)
  end

  def weather
    case random_number
    when 0, 1, 2, 3, 4, 5, 6, 7, 8
      "sunny"
    when 9, 10
      "stormy"
    end
  end

  private

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

end
