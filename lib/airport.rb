# require 'plane'

class Airport
  
  attr_reader :planes
  attr_accessor :capacity #:sunny

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    # @condition = Weather.new
    # @weather = condition.sunny
  end

  # def plane_count
  #   capacity
  # end

  def land_plane(plane)
    error_message = 'Landing is not possible as the airport capacity is full'
    raise error_message if capacity == @planes.length
    @planes << plane
  end

  def plane_landed?(plane)
    return true if @planes.include?(plane)
    false
  end

  def take_off(plane)
    plane
    # fail 'can not take off as weather is stormy'
  end
end
