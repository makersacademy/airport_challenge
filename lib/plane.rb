require_relative 'airport'

class Plane

  attr_accessor :landed, :airport

  def initialize (state=false)
    @landed = state
    #@airport = nil
  end

  def land airport
    @landed = true
    @airport = airport
  end

  def take_off
    raise "Plane cannot take off, it's already flying!" if !landed
    @landed = false
    @airport = nil
  end

end
