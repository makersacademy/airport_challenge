class Plane
  attr_accessor :landed, :airport

  def initialize(landed = false)
    @landed = landed
  end

  def landed?
    @landed
  end

end
