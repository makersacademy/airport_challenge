

class Plane

  def initialize
    @location = "Airplane factory"
  end


  def broadcast_location
    location
  end

  def land
    @location = 'airport'
  end

  def take_off
    @location = 'where eagles soar'
  end

  private
  attr_accessor :location


end
