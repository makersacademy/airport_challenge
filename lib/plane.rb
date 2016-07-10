class Plane

  def landed?
    @landed
  end

  def land
    fail 'Plane already landed' if landed?
    @landed = true
  end

  def take_off
    fail 'Plane already in air' unless landed?
    @landed = false
  end

  private

  attr_reader :landed

end
