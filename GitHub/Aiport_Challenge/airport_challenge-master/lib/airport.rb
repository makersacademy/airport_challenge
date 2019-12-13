class Airport
require_relative 'plane'

attr_reader :airp, :capacity

def initialize
  @capacity = 4
  @airp = []
end

def land_plane(plane)
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
end
