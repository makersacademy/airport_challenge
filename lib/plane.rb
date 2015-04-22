class Plane
  attr_reader :status

  def initialize
    @status = 'flying'
  end

  def take_off
    @status = 'flying'
  end

  def touch_down
    @status = 'landed'
  end
end
