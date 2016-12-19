class Plane

  attr_reader :landed

  def initialize
    @landed = false;
  end

  def has_landed
    @landed = true
  end

  def has_landed?
    @landed == true
  end

end
