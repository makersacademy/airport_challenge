class Plane
  def initialize(flying = 'flying', destinaton = 'Glasgow')
    @flying = flying
    @destination = destination
  end

  def flying
    @flying
  end

  def land
    fail 'already landed' if @flying == 'landed'
    @flying = "landed"
  end

  def take_off
    fail 'already flying' if @flying == 'flying'
    @flying = "flying"
  end

  def destination
    fail 'you cannot have a plane in the air without a destination' if @destination == ''
  @destination
  end


end
