class Plane
  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land
    fail 'Plane already landed' if landed?
    @landed = true
  end

  def take_off
    fail 'Plane already taken off' unless landed?
    @landed = false
  end

  private

  def landed?
    @landed
  end
end
