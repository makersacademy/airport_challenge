class Plane
  attr_reader :status
  alias_method :status?, :status

  def initialize
    @status = 'flying'
  end

  def land
  end

  def take_off
  end
end
