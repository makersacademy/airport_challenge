require_relative 'airport'

class Plane

  attr_reader :location

  def land
    @location = :landed
  end

  def take_off
    @location = :flying
  end
end
