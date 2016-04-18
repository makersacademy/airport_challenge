class Plane

  def initialize
    @landed = false
  end

  def is_landed
    @landed = true
  end

  def took_off
    @landed = false
  end

  def landed?
    landed
  end

private

  attr_reader :landed

end
