require_relative 'plane'
require_relative 'stormy'

class Airport
  attr_accessor :capacity
  attr_reader :list_landed_planes, :list_taken_off_planes

  DEFAULT_CAPACITY = 50
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @list_landed_planes = []
    @list_taken_off_planes = []
  end

  def landed_planes(plane)
    stormy == true ? "The plane can't land due to stormy weather" :
    (@list_landed_planes.count < @capacity and @list_landed_planes.include?(plane)==false) ? (@list_landed_planes << plane and confirms_landed(plane)) : "The airport is full, the plane can't land"
  end

  def confirms_landed(plane)
  "The plane has landed"
  end

  def taken_off_planes(plane)
    stormy == true ? "The plane can't take off due to stormy weather" : ((@list_landed_planes.delete(plane));  (@list_taken_off_planes << plane); confirms_taken_off(plane))
  end

  def confirms_taken_off(plane)
  "The plane has taken off"
  end

end
