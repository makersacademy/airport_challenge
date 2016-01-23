
class Airplane
  attr_reader :flying

  def initialize
    @flying = true
  end

  def plane_landed
    @flying = false
  end

  def plane_taken_off
    @flying = true
  end
end
