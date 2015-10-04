class Plane

  attr_accessor :flying

  def initialize(flying = 'flying')
    @flying = 'flying'
  end

  def land
    @flying = 'landed'
  end

  def take_off
    @flying = 'flying'
  end

end
