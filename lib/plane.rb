class Plane

  def initialize
    @location = 'air'
  end

  attr_accessor :location

  def land
    @location = 'airport'
  end

end
