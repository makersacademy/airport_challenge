

class Plane

  def initialize
    @location = "Airplane factory"
    @flying = false
  end


  def broadcast_location
    location
  end

  def land
    raise "I haven't taken off yet mate" unless flying
    @location = 'airport'
    @flying = false
    nil
  end

  def take_off
    raise "I'm already up here mate" if flying
    @location = 'where eagles soar'
    @flying = true
    nil
  end

  private
  attr_accessor :location, :flying




end
