# Defines the class Airport
require_relative 'plane'

class Airport
  attr_accessor :plane
  attr_writer :capacity
  attr_accessor :planes_list

  def initialize(capacity, planes_list, plane)
    @capacity = capacity
    @planes_list = planes_list
    @plane = plane
  end   

  def capacity?
  end

  def release_plane
    @plane
  end 

  def dock_plane(_plane)
    @plane
  end
  
  def stormy_weather?
    # currently set up to be a 1 in 3 chance of stormy weather
    # TODO for now, keeping the longer version of the uncommented line below
    # return rand(2) == 1 ? true : false
    # shorten to below as suggested by rubocop
    return rand(2) == 1
  end  
end
