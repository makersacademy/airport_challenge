class Plane
  attr_accessor :flying

  def initialize
    @flying = 'flying'
  end
  # def flying
  #   @flying
  # end
  def flying?
    @flying
    true if @flying == 'flying'
  end
  def landed?
    @flying
    true  if @flying == 'landed'
    false if @flying == 'flying'
  end
  def land
    # fail 'already on the ground' if @flying == 'landed'
    @flying = 'landed'
  end
  def take_off
    # fail 'already in the air' if @flying == 'flying'
    @flying = 'flying'
  end
end
