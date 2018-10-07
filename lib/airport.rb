require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity

  include Weather

  $airports = Array.new

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    $airports << self
  end

  def land(plane)
    raise 'Airport full' if full?
    raise "plane already landed" if plane.status? == "land"
    raise "landing not allowed" if stormy?
    plane.update_status("land")
    # @planes << plane
    to_hangar(plane)
  end

  def takeoff(plane)
    raise "takeoff not allowed" if stormy?
    raise "plane already in air" if plane.status? == "air"
    raise "plane not at this airport" unless in_hangar(plane)
    plane.update_status("air")
    @planes.delete(plane)
  end

  def capacity?
    @capacity
  end

  def full?
    @planes.count >= @capacity
  end

  def in_hangar(plane)
    @planes.include?(plane)
  end

  def to_hangar(plane)
    @planes << plane
  end

  def flying_planes
    $all_planes.select { |plane| plane.flying? }
  end

  def landed_planes
    $all_planes.reject { |plane| plane.flying? }
  end

  def flying_in_airport?
    flying_planes.select { |plane| plane.in_airport?.count.positive? }
  end

  def orphan_landed_planes?
    landed_planes.select { |plane| plane.in_airport?.count.zero? }
  end

end
