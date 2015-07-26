require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 20
    attr_accessor :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def take_off
    fail 'Plane is already flying' if landed_planes.empty?
    @planes.delete landed_planes.pop
  end

  def dock plane
    fail 'Airport full' if full?
    fail 'Inclement weather' if stormy?
    @planes << plane
  end



private
attr_reader :planes

def landed_planes
  @planes.reject { | plane | plane.flying?}
end

def full?
  @planes.count >= capacity
end

def stormy?
  @planes.select { |plane | plane.reported_bad_weather}
end


end
