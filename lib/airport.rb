require_relative './weather.rb'

class Airport

  attr_reader :planes_in_hangar, :weather, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_in_hangar = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    excuses("land", plane)
    @planes_in_hangar << plane
    @planes_in_hangar.last
  end

  def takeoff
    excuses("takeoff")
    plane = @planes_in_hangar.shift
    plane
  end

private

  def excuses(action, object = nil)
    case action
    when "land"
      fail "Landing rejected: That doesn't seem to be a plane." unless its_a_plane(object)
      fail "Landing rejected: No planes can land in this stormy weather." if stormy
      fail "Landing rejected: The hangar is full." if hangar_full?
    when "takeoff"
      fail "Takeoff rejected: No planes can fly in this stormy weather." if stormy
      fail "Takeoff rejected: No planes in the hangar." if hangar_empty?
    end
  end

  def hangar_full?
    @planes_in_hangar.length >= @capacity
  end

  def hangar_empty?
    @planes_in_hangar.empty?
  end

  def stormy
    @weather.is_stormy
  end

  def its_a_plane(object)
    object.instance_of? Plane
  end

end
