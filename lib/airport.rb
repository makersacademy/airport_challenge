require_relative './plane'
require_relative './weather'


class Airport
  DEFAULT_CAPACITY = 5
   attr_reader :capacity, :landing_slots

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @landing_slots = []
  end

  def conditions_good?
    (Weather.new).stormy?
  end

  def land(plane)
    space_to_land? ? (conditions_good? ?  @landing_slots << plane : "Weather to bad to land") : "No more landing space"
  end

  def space_to_land?
    (@capacity - @landing_slots.count) > 0
  end


end
