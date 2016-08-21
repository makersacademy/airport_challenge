require_relative 'plane.rb'
require_relative 'weather'

class Airport

  #@capacity ivar is readable from outside the class
  attr_reader :capacity
  #number of planes can be grounded at the same time
  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    #ivars are initialized
    @capacity = capacity
    @planes = []
  end

  def start_take_off(plane)
    check_conditions_to_take_off(plane) #ask for approval to take off
    take_off(plane) #instruct the plane to take off
  end

  def check_conditions_to_take_off(plane)
    fail "#{plane.class.name} is not at the airport" unless @planes.include?(plane)
    fail "Due to stormy weather, #{plane.class.name} cannot take off" if stormy?
    "Take off is approved" #returns approval message
  end

  def start_landing(plane)
    check_conditions_to_land(plane) #ask for approval to land
    land(plane) #instruct plane to land
  end

  def check_conditions_to_land(plane)
    fail "#{plane.class.name} is already at the airport" if @planes.include?(plane)
    fail "Airport is full" if full?
    fail "Due to stormy weather, #{plane.class.name} cannot land" if stormy?
    "Landing is approved" #returns approval message
  end

  private
  #check whether the airport is full or not
  def full?
    @planes.size >= @capacity
  end

  def stormy?
    Weather.new.stormy?
  end

  def take_off(plane)
    plane.take_off #calls the take_off method on the plane object
    @planes.delete(plane) #delete the plane in the @planes ivar
    "The plane has left the airport" #confirmation message is returned
  end

  def land(plane)
    plane.land #calls the land method on the plane object
    @planes << plane #add the plane to the @planes ivar
    "The plane has landed" #confirmation message is returned
  end
end
