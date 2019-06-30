require 'airport'

class Plane


  def initialize(flying=false)
    @flying = flying
  end

  def take_off
    raise "The plane cannot take off as it is already in the air" if flying?
    @flying = true
  end

  def land
    raise "The plane cannot land as it has not taken off yet" if !flying?
    @flying = false
  end

  def flying?
    @flying
  end

end
