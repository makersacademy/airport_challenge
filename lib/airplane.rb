
class Airplane
  attr_accessor :landed

  def initialize(landed = false)
    @landed = landed
  end

  def flying?
    !@landed
  end
end
