class Planes
  attr_reader :status

  def inialize
    @status = 'landed'
  end

  def land
    @status = 'landed'
  end

  def take_off
    @status = 'flying'
  end

end
