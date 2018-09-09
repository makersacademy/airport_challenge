class Airplane
  attr_reader :grounded
  def initialize
    @grounded = false
  end

  def takes_off
    @grounded = false
  end

  def lands
    @grounded = true
  end
end
