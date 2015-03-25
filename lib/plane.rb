class Plane
  attr_reader :flying, :status

  def initialize
    @flying = false
    @status = 'landed'
  end

  def flying?
    @flying
  end

  def take_off
    @flying = true
    @status = 'flying'
  end

  def land
    @flying = false
    @status = 'landed'
  end
end
