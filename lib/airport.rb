# Defines the class Airport
require_relative 'plane'

class Airport
  attr_accessor :planes_list
  attr_accessor :plane
  attr_accessor :capacity

  def initialize(planes_list, plane, capacity = 111)
    @planes_list = planes_list
    @plane = plane
    @capacity = capacity
  end   

  def capacity?
  end

  def release_plane
    @plane
  end 

  def dock_plane(plane)
    # At this point, the plane has landed successfully.
    # now set the plane's status to "grounded"
    # and dock it into the airport
    @plane.status = "grounded"
    return @planes_list.push(plane)
    # @plane
  end
  
  def stormy_weather?
    # currently set up to be a 1 in 3 chance of stormy weather
    # TODO for now, keeping the longer version of the uncommented line below
    # return rand(2) == 1 ? true : false
    # shorten to below as suggested by rubocop
    return rand(2) == 1
  end  
end
