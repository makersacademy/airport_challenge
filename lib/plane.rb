require_relative 'airport'

class Plane
  attr_reader :status

  def initialize
    @status = :flying
  end

  def take_off(airport)
    airport.planes.reject! { |plane| self == plane }
    @status = :flying
    'Took off!'
  end

  def land(airport)
    fail 'cannot land in storm' if airport.weather == :stormy
    fail 'all spaces are taken' if airport.planes.length == airport.capacity
    airport.planes << self
    @status = :landed
  end
end
