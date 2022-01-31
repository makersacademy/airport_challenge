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

  # def capacity?
  # ßend

  def dock_plane(plane)
    # At this point, the plane has landed successfully.
    # now set the plane's status to "grounded"
    # and dock it into the airport
    plane.status = "grounded"
    @planes_list.push(plane)
    return @planes_list
  end
  
  def stormy_weather?
    # currently set up to be a 1 in 10 chance of stormy weather
    # TODO for now, keeping the longer version of the uncommented line below
    # return rand(10) == 1 ? true : false
    # shorten to below as suggested by rubocop
    return rand(10) == 1
  end  
end
