# require 'plane'

class Airport
  
  attr_reader :planes
  attr_accessor :capacity #:sunny

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    # condition = Weather.new
    # @weather = condition.sunny
  end

  # def plane_count
  #   capacityq
  # end

  def land_plane(plane)
    raise 'Landing is not possible as the airport capacity is full' if capacity == @planes.length
    @planes << plane
  end

  def plane_landed?(plane)
    return true if @planes.include?(plane)
    false
  end

  def take_off(plane)
    plane
    # fail "Weather Stormy cannot take off" unless sunny
  end
end
