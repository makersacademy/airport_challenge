require_relative 'plane'
require_relative 'weather'

class Airport
    attr_reader :hangar
    attr_accessor :capacity

  CAPACITY = 10 
  DEFAULT_CAPACITY = 20 
  
  def initialize(capacity = CAPACITY)
    @hangar = []
    @capacity = capacity 
  end 

  def land(plane)
    fail "Unable to land as the airport is at full capacity" if airport_full?
    fail "Unable to land due to stormy weather conditions" if stormy?
    @hangar.push(plane)
  end 

  def take_off(plane)
    fail "Plane is unable to take off due to stormy weather conditions" if stormy?
    @hangar.delete(plane)
    "Plane is airborne"
  end 

  private

  def airport_full?
    return true if @hangar.length >= CAPACITY 
  end 

  def stormy?
    return true if @stormy == true # from weather class
  end 


end 