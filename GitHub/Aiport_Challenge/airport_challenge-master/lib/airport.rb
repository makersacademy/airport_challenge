class Airport
require_relative 'plane'

DEFAULT_CAPACTITY = 4

attr_reader :airp, :capacity

def initialize(capacity = DEFAULT_CAPACTITY)
  @capactity = capacity
  @airp = []
end

def land_plane(plane)
  fail 'Airport full' if full?
  add_plane(plane)
end

def plane_take_off(plane)
  remove_plane(plane)
end

def add_plane(plane)
  @airp << plane
end

def remove_plane(plane)
  @airp.pop
end

def confirm_left(plane)
  if @airp.include?(plane)
   'plane has not taken off'
 else
    'plane has taken off'
    end
  end

def full?
  @airp.count >= DEFAULT_CAPACTITY
end


end
