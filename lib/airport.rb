

require_relative 'weather'
require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full!" if full?
    fail "Cannot land the same plane" if @planes.include?(plane)
    # plane.landed
    @planes << plane
    plane.landed
  end

  def take_off
    fail "no planes available for take-off!" if empty?
    # fail "Cannot take_off the same plane" if
    @planes.pop.taken_off
  end

  def weather

  end

  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

  # def same_plane?
  #   @planes.include?(@plane)
  # end

end





# airport.capacity - you are calling the capacity method on airport
# aiport.capacity = 100 means you have set the capaicty to eq 100
