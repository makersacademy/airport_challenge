require_relative 'Plane'

class AirPort
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land
    fail 'AirPort reached max capacity!' if @hangar.length >= 200
    @hangar << Plane.new
    'A new plane arrived!'
  end

  def take_off
    @hangar.delete_at(0)
    'Plane left the Ariport!'
  end

end
