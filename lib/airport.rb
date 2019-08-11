# require 'pry'
require_relative './weather'
require_relative './plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def instruct_plane_to_land(plane, weather = Weather.new)
    # write exception for stormy and full?
    raise "This plane is not in flight!" unless plane.flying?

    raise "Cannot land - severe weather warning!" if weather.stormy?

    raise "Cannot land - airport is full!" if full?

    @planes << plane
    plane.land
  end

  def instruct_plane_to_take_off(plane, weather = Weather.new)
    # raise "This plane is not in your airport!" if !@planes.include?(plane)
    # rubocop says: "Style/NegatedIf:
    # Favor unless over if for negative conditions."
    raise "This plane is not in your airport!" unless @planes.include?(plane)

    raise "Cannot take off - severe weather warning!" if weather.stormy?

    @planes.delete_at(planes.index(plane))
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

  private
  def full?
    @planes.size == @capacity
  end
end
# binding.pry
