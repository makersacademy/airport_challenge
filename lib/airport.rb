require_relative 'airplane'

class Airport 

attr_reader :plane, :plane_take_off
attr_accessor :capacity

DEFAULT_CAPACITY = 20

def initialize 
  @plane = []
  @capacity = DEFAULT_CAPACITY
  @plane_take_off = []
end

def land(plane)
    fail 'Airport is full' if full?
  if stormy?
    fail 'Cannot land plane. Weather is stormy'
  end

  if (@plane.include? plane)
    puts "This plane is already landed"
  else
    "#{@plane} has landed"
    @plane << plane
  end

if plane_take_off.include? plane
  plane_take_off.delete(plane)
end
end

def take_off(plane_take_off)
  if stormy?
    fail 'Cannot take-off plane. Weather is stormy' 
  end

  if (@plane_take_off.include? plane_take_off)
    puts "This plane is already flying"
  else
    @plane_take_off << plane_take_off
    "#{@plane_take_off} has taken off!"
  end

  if plane.include? plane_take_off
    plane.delete(plane_take_off)
  end
end 

def stormy?
  luck = rand(0..6)
    if (luck == 1)
      return true
    end
end

private 
def full?
  @plane.count >= @capacity
end

end
