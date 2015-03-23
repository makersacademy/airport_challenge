class Plane
  attr_reader :status
  alias_method :status?, :status

  def initialize
    @status = 'flying'
  end

  def land
    fail 'Plane already landed.' unless @status == 'flying'
    @status = 'landed'
  end

  def take_off
    @status = 'flying'
  end
end
