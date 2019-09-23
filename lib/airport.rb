require_relative 'plane'

class Airport

  attr_reader :planes, :status
  attr_accessor :capacity # Should probably be a reader, not an accessor 
  AIRPORT_CAPACITY = 100

  def initialize(capacity = AIRPORT_CAPACITY)
    @capacity = capacity
    @planes = []
    @status = "flying" # COULD BE :flying - every time you use a string, it creates a new object.
    # Using a symbol is good here, especially as we're not going to be changing this flying value.
  end

  def land_plane(plane)
    fail 'Landing prevented due to stormy weather' unless weather_check == "sunny"

    fail 'Airport full' if full?

    fail('Error') unless @status == "flying"
    fail('Error') if @planes.include?(plane)

    @planes << plane
    @status = "grounded"
  end

  def take_off(plane)
    fail 'Take off prevented due to stormy weather' unless weather_check == "sunny"

    fail('Error') unless @status == "grounded"
    fail('Error') unless @planes.include?(plane)

    @planes.pop #CHANGE TO PLANES.DELETE(PLANE)
    @status = "flying"
    "The plane has taken off"
  end

  def weather_check
    rand(1..2) == 1 ? "sunny" : "stormy"
  end

  private

  def full?
    return true if @planes.count >= capacity
  end

end
