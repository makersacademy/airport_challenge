require_relative 'airport'

class Plane

  attr_reader :location

  def land
    @location = :landed
  end

  def landed
    @location == :landed
  end

end
