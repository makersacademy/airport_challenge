class Plane

  def landed?
    @landed
  end

  def land
    raise 'Plane already landed' if landed?
    @landed = true
  end

  def take_off
    raise 'Plane already in air' unless landed?
    @landed = false
  end

  private

  attr_reader :landed

end
