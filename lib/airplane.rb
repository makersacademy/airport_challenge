class Airplane
  attr_accessor :landed

  def initialize(status=true)
    @landed = status
  end

  def landed?
    landed
  end
end
