class Plane
  def initialize(flying = 'flying')
    @flying = 'flying'
  end

  def flying
    @flying
  end

  def land
    @flying = 'landed'
  end

  def take_off
    @flying = 'flying'
  end

end
