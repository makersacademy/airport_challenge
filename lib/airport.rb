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
    fail 'Inclement weather' if bad_weather
  end

  def dock plane
    fail 'Airport is full' if full?
    fail 'Inclement weather' if bad_weather
    @planes << plane
  end

private
attr_reader :planes

def flying_planes
  @planes.select { | plane | plane.flying?}
end

def landed_planes
  @planes.reject { | plane | plane.flying?}
end

def full?
  @planes.count >= capacity
end

def bad_weather?
  @planes.reject { |plane | plane.stormy?}
end


end
