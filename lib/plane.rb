class Plane
  attr_reader :landed

  def initialize
    @landed = false
  end

  def land
    fail 'Cannot land again, plane already landed!' if @landed
    @landed = true
  end

  def take_off
    fail 'Cannot take off again, plane already took off!' unless @landed
    @landed = false
  end
end
