require_relative 'plane'
require_relative 'weather'
# Airport class definition
class Airport
  DEFAULT_CAPACITY = 30
  attr_accessor :id, :capacity, :hanger

# initialize method to set default values if need to
  def initialize(id, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
    @id = id
  end

# land method to allow planes to land
  def land(plane, stormy)
    raise 'Plane already landed at an airport' unless plane.airport.nil?
    raise 'Error! Airport Full' if full?
    raise 'BAD WEATHER CONDITION! Cannot allow to land' if stormy

    plane.airport = @id
    @hanger.push(plane)
  end

# take_off method to allow planes to take off
  def take_off(plane, stormy)
    raise 'Error! Plane not at this airport' unless plane.airport.eql?(@id)
    raise 'BAD WEATHER CONDITION! Cannot allow to take off' if stormy
    plane.airport = nil
    @hanger.delete(plane)
  end

# method to check if full capacity has been reached
  def full?
    @hanger.length >= capacity
  end

end
