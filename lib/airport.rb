require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather # fetches Weather module

  attr_reader :planes, :capacity

  def initialize(capacity = 20)
    # each airport has a default capacity of 20
    # this can be changed on initialization of class
    @planes = []
    @capacity = capacity
  end

  def update_capacity(capacity)
    @capacity = capacity
  end

  def land(plane)
    # creating a new method to land a plane
    raise "Weather is stormy" if stormy?
    raise "Airport full" if full?
    raise "Plane already landed" if plane.landed?

    plane.land # planes are marked as being landed
    @planes << plane # landed planes are added to an array
  end

  def take_off
    # created a method for take_off
    raise "Weather is stormy" if stormy?
    raise "Airport empty" if empty?

    plane = @planes.delete(@planes.sample) # planes are removed fromt the array
    plane.take_off # planes are marked as being in the sky
    plane
  end

  private
  def full?
    @planes.length >= @capacity # checks to see if an airport is full
  end

  def empty?
    @planes.empty? # checks to see if an airport is empty
  end

end
