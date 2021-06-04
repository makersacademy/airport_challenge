require_relative 'plane.rb'
class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land_plane(plane)
    # if plane.flying == true

      # if full?
      #   fail 'Airport at maximum capacity, cannot land plane'
      # elsif stormy?
      #   fail 'Cannot land due to storm'
      # else
        # raise 'Cannot land due to storm' if stormy?
        raise 'Airport at maximum capacity, cannot land plane' if full?
        # raise 'Cannot land due to storm' if stormy?
      # plane.flying = false
      @hangar << plane
      "Plane landed"
      # end
    # else
    #   fail 'Error - plane is not flying'
  end

  def take_off_plane(plane)
    fail 'Cannot take off due to storm' if stormy?
    fail 'No planes at the airport' if @hangar.empty?
    @hangar.pop
    "Plane has left the airport"
  end

private

  def full?
    @hangar.count >= @capacity
  end

  def stormy?
    rand(1..10) == 10
  end
end

# airport = Airport.new
# puts airport.stormy?
# plane = Plane.new
# airport.land_plane(plane)
