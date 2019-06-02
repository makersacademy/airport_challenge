require_relative 'planes'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

# planes in airport
  def land_plane
    @planes
  end

  def take_off
    fail 'All planes departed' if empty?

#    @planes.pop
  end 

  # planes on the airport
  def apron(planes)  
    fail 'Airport is full' if full?

    @planes << planes
  end

# private
# attr_reader :planes

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end
end

  # planes.pop  remove planes from aiport 
  # when airport reached capacity no landing
  # default airport capacity later can be overridden 
