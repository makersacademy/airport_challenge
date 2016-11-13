require_relative "flying"
require_relative "plane"
require_relative "weather"

class Airport

    attr_reader :planes
    attr_reader :capacity
    attr_reader :planes_in_flight

    DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @planes_in_flight = []
  end

  def plane_landed(plane_name)
    raise "This airport is full to capacity, please go to the next nearest airport to land" if full?
    if plane_name.condition == :sunny
     @planes << plane_name
     @planes.uniq!
     "Plane #{plane_name} has landed"
   elsif plane_name.condition == :stormy
     raise "There is a storm at destination please divert to nearest airport"
    end
  end

  def taken_off
     raise "All planes are grounded until further notice due to bad weather" if @planes.index{|planes| planes.condition == :sunny} == nil
     "Plane #{@planes_in_flight.last} has taken off" if @planes_in_flight << @planes.slice!(@planes.index{|planes| planes.condition == :sunny})
  end

private

  def full?
    @planes.count == @capacity
  end

end
