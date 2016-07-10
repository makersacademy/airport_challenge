require_relative './plane'
require_relative './Weather'
class Airport
include Weather
attr_reader :planes
CAPACITY = 100
  def initialize
    @planes = []
  end
  def land_plane plane
    if Weather.stormy
      'weather conditions prvent landing'
    elsif full?
      'airport is full, please use nearest one'
    else
      @planes << plane
    end
  end
  def depart_plane plane
    if Weather.stormy
      'weather conditions prvent take-off'
    else
      plane
    end
  end
private
  def full?
    @planes.count >= CAPACITY
  end
end
