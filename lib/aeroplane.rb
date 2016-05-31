class Aeroplane
  def initialize
    @landed = false
  end

  def set_landed
    fail "Plane is already landed" if @landed
    @landed = true
  end
  
  def landed?
    landed
  end
  
  def take_off
    fail "Plane is already flying" unless @landed
    @landed = false
  end

  private
  attr_reader :landed
end
