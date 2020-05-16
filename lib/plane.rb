class Plane

  def initialize
    @location = 'air'
  end

  attr_accessor :location

  def land
    @location = 'airport'
  end

  def take_off
    @location = 'air'
  end 

end
