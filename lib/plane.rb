
require_relative 'airport'

class Plane

  attr_accessor :landed, :stormy

  def initialize
    @landed = true
    @stormy = false
  end

  def chance
    rand(10)
  end

  def weather
    @stormy = true  if chance >= 7
  end

  def take_off
    if @stormy == true
       @landed = true
       'Traffic control we are grounded. It is STORMY!'
    else @landed = false
        'Traffic control this is niner-niner-three. We have taken off!'
    end
  end

  def land(airport)
    if @stormy == true
      @landed = false
      'Traffic control WTF do we do it is MAJORLY STORMY'
    else
    @landed = true
    'Traffic control this is niner-niner-three. We have landed!'
    end
  end


end
