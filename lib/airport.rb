require_relative './plane'
require_relative './weather'
class Airport
  AIRPORT_CAPACITY = 10
  include Weather
  attr_reader :capacity, :plane, :planes

  def initialize(capacity = AIRPORT_CAPACITY)
    @planes = []
    @capacity = capacity
    # @plane = Plane.new
  end

  def depart_plane plane
    raise 'already landed' if plane.departed == true
    fail 'weather conditions prvent take-off' if Weather.stormy
    @planes.delete landed_planes.pop if !landed_planes.empty?
    plane.report_departed
  end

  def land_plane plane
    fail if plane.departed == false
    if Weather.stormy
      raise 'weather conditions prvent landing'
    elsif full?
      raise 'airport is full'
    elsif
      @planes << plane
      plane.report_landed
    end
  end

  def landed_planes
    @planes.reject { |plane| plane.departed? }
  end

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end
