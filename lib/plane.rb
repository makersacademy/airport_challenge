class Plane
  def initialize
    @status = 'flying'
  end

  attr_reader :status

  def landed
    @status = 'landed'
  end

  def take_off
    @status = 'flying'
  end
end
