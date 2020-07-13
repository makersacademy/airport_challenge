require_relative 'Plane'

class AirPort
  attr_reader :hangar
  attr_accessor :capacity

  def initialize
    @hangar = []
    @capacity = 200
  end

  def land
    fail 'AirPort reached max capacity!' if @hangar.length >= @capacity
    @hangar << Plane.new
    'A new plane arrived!'
  end

  def take_off
    @hangar.delete_at(0)
    'Plane left the Ariport!'
  end

end
