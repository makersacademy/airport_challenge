require_relative 'airport'

class Plane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land airport
    @landed = true
    @airport = airport
  end

  def take_off
    raise "Plane cannot take off, it's already flying!" if !landed
    @landed = false
  end

  def airport
    @airport
  end

  # def airport

  # end

  # def landed??
  #   true
  # end

end
