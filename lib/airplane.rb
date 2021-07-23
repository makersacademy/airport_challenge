class Airplane
  attr_accessor :flying

  def initialize()
    @flying = false
  end

  def flying?
    return @flying
  end
end
