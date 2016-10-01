require_relative 'plane'
require_relative 'stormy'

class Airport
  attr_accessor :capacity
  attr_accessor :list_landed_planes, :list_taken_off_planes

  DEFAULT_CAPACITY = 50
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @list_landed_planes = []
    @list_taken_off_planes = []
  end


  def landed_planes(plane)
    if stormy == true
      "The plane #{@plane_number} can't land due to stormy weather"
    else
      if @list_landed_planes.count < @capacity and @list_landed_planes.include?(plane)==false
        @list_landed_planes << plane and confirms_landed(plane)
      else
        "The airport is full, the plane #{@plane_number} can't land"
      end
    end
  end

  def confirms_landed(plane)
  "The plane #{@plane_number} has landed"
  end

  def taken_off_planes(plane)
    if stormy == true
      "The plane #{@plane_number} can't take off due to stormy weather"
    else
      @list_landed_planes.delete(plane)
      @list_taken_off_planes << plane
      confirms_taken_off(plane)
    end
  end

  def confirms_taken_off(plane)
  "The plane #{@plane_number} has taken off"
  end

end
