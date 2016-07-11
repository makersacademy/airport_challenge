require_relative './plane'
require_relative './weather'
class Airport
  CAPACITY ||= 10
  include Weather
  attr_reader :planes
  def initialize
    @planes = []
    @capacity = CAPACITY
  end
  def land_plane plane
    if Weather.stormy
      'weather conditions prvent landing'
    elsif full?
      'airport is full, please use nearest one'
    else
      @planes << plane
      plane.landed?
    end
  end
  def depart_plane plane
    if Weather.stormy
      'weather conditions prvent take-off'
    elsif empty?
      return
    else
      @planes.delete(plane)
    end
  end
private
  def full?
    @planes.count >= CAPACITY
  end
  def empty?
    @planes.empty?
  end
end
