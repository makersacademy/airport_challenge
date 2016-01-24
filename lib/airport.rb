require_relative 'plane'
require_relative 'modules/weather'

class Airport
  include Weather
  attr_reader :planes

  CAPACITY = 10

  def initialize(capacity = CAPACITY)
    @capacity= capacity
    @planes = []
  end

  #encapsulated planes array
  def planes
    @planes.dup
  end

  def land(plane)
    pre_landing_checks(plane)
    plane.landed
    @planes << plane
  end

  def takeoff(plane)
    pre_takeoff_checks(plane)
    plane.fly
    @planes.reject! {|p| p == plane}
    plane
  end

  private

  def pre_takeoff_checks(plane)
    fail "Can't takeoff, it's stormy!" if weather_status == "stormy"
    fail "This plane is already flying" if plane.status == "flying"
    fail "This plane doesn't exist here" unless @planes.include?(plane)
  end

  def pre_landing_checks(plane)
    fail "The airport is full" if @planes.size > @capacity
    fail "Can't land, it's stormy!" if weather_status == "stormy"
    fail "This plane has already been landed" if plane.status == "landed"
  end


end
