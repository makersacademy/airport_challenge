require_relative './plane'
require_relative './weather'
class Airport
  AIRPORT_CAPACITY = 10
  include Weather
  attr_reader :capacity
  attr_reader :planes
  def initialize (capacity = AIRPORT_CAPACITY)
    @planes = []
    @capacity = capacity
  end
  def land_plane plane
    if Weather.stormy
      raise 'weather conditions prvent landing'
    elsif full?
      raise 'airport is full'
    else
      @planes << plane
    end
  end
  def depart_plane plane
    if Weather.stormy
      raise 'weather conditions prvent take-off'
    else
      fail 'No planes for take-off' if landed_planes.empty?
      planes.delete landed_planes.pop
    end
  end
  def landed_planes
    planes.reject { |plane| plane.departed? }
  end
  def full?
    @planes.count >= capacity
  end
  def empty?
    @planes.empty?
  end
end
