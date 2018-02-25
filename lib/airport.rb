require_relative 'plane'
require_relative 'weather'
# Airport class definition
class Airport
  DEFAULT_CAPACITY = 30
  attr_accessor :capacity, :hanger

# initialize method to set default values if need to
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
  end

# land method to allow planes to land
  def land(plane, stormy)
    raise 'BAD WEATHER CONDITION! Cannot allow to land' if stormy
    raise 'Error! Airport Full' if full?
    @hanger.push(plane)
  end

# take_off method to allow planes to take off
  def take_off(plane, stormy)
    raise 'BAD WEATHER CONDITION! Cannot allow to take off' if stormy
    raise 'Error! Airport Full' if full?
    @hanger.delete(plane)
  end

  def full?
    @hanger.length >= capacity
  end

# prevent_landing method to prevent landing
  def prevent_landing; end

# prevent_take_off method to prevent planes from taking off
  def prevent_take_off; end
end
